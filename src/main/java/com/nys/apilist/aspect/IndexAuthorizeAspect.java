package com.nys.apilist.aspect;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpServletRequest;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nys.apilist.config.APIConfig;
import com.nys.apilist.dataobject.ApiInfo;
import com.nys.apilist.exception.IndexAuthorizeException;
import com.nys.apilist.utils.IPUtil;
import com.nys.apilist.utils.TimeUtil;
import com.nys.apilist.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 切面类-根据IP校验用户对API的操作权限
 * @author nysheng
 *
 */

@Aspect
@Component
@Slf4j
@SuppressWarnings("unchecked")
public class IndexAuthorizeAspect {
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	@Autowired
	private APIConfig apiConfig;
	/**
	 * 返回通知-在客户端第一次访问主页，主页controller请求数据库时，为每一个API数据设置一个访问次数限制，并设置过期时间
	 * @param jp
	 * @param result
	 */
	@AfterReturning(value="execution(* com.nys.apilist.service.impl.ApiInfoServiceImpl.getAllAPI())",returning = "result")
	public void afterReturning_getAllAPI(JoinPoint jp,Object result) {
		//1.获取客户端请求
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        //2.获取客户端IP
        String ip=IPUtil.getIpAddress(request);
        //3.获取切入点返回数据
        List<ApiInfo> apiInfoList=(List<ApiInfo>)result;
        //4.将数据保存到redis中
        for(ApiInfo apiInfo:apiInfoList) {
        	stringRedisTemplate.opsForHash().putIfAbsent(ip, apiInfo.getId().toString(), apiConfig.getCount());
        }
        //5.设置过期时间
        stringRedisTemplate.expire(ip, TimeUtil.getTimeForMinutes(), TimeUnit.MINUTES);
        
	}
	/**
	 * 前置通知-当访问API时，检查是否有权限，即检查访问次数是否已用尽
	 * @param jp
	 */
	@Before(value="execution(* com.nys.apilist.controller.IndexController.details(..))")
	public void before_getAPIById(JoinPoint jp) {
		//1.因為ip是唯一的，所以不会出现并发问题，无需加锁
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        String ip=IPUtil.getIpAddress(request);
        //2.获取切入点参数
        Object[] args=jp.getArgs();
        //3.去redis查询指定API的访问次数
        Object valueStr=stringRedisTemplate.opsForHash().get(ip, args[0].toString());
        Integer value=Integer.parseInt(valueStr==null?"0":valueStr.toString());
        //4.若访问次数用尽，抛出异常
        if(value<=0) {
        	log.error("【API访问权限校验】API访问次数用尽：ip：{}，id：{}",ip,args[0]);
        	throw new IndexAuthorizeException();
        }
        //5.访问次数减一，修改redis值
        value--;
        stringRedisTemplate.opsForHash().put(ip,args[0].toString(),value.toString());
	}
	/**
	 * 返回通知-在主页数据返回之前封装每个API的可访问次数到ModelAndView中
	 * @param jp
	 * @param result
	 * @return
	 */
	@AfterReturning(value="execution(* com.nys.apilist.controller.IndexController.index(..))",returning = "result")
	public ModelAndView afterReturning_index(JoinPoint jp,Object result) {
		//1.获取客户端IP
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        String ip=IPUtil.getIpAddress(request);
		//2.获取切入点返回数据
		ModelAndView model=(ModelAndView)result;
		List<ApiInfo> apiInfoList= ((ResultVO<List<ApiInfo>>)model.getModel().get("resultVO")).getData().get("apiList");
		//3.获取所有API的ID值并封装到Collection中
		Collection<Object> listKey=new ArrayList<Object>();
		for(ApiInfo apiInfo:apiInfoList) {
			listKey.add(apiInfo.getId().toString());
        }
		//4.一次性从redis中获取当前IP的所有API可访问次数
        List<Object> listValue=stringRedisTemplate.opsForHash().multiGet(ip, listKey);
		//5.将数据封装到原ModelAndView中
        model.addObject("countList", listValue);
        //6.返回ModelAndView
		return model;
	}
}
