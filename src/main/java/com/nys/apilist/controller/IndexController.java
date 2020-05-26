package com.nys.apilist.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.nys.apilist.dataobject.ApiInfo;
import com.nys.apilist.service.ApiInfoService;
import com.nys.apilist.vo.ResultVO;

@Controller
public class IndexController {

	@Autowired
	private ApiInfoService apiInfoService;
	/**
	 * 主页数据
	 * @param map
	 * @return
	 */
	@GetMapping("/index")
	public ModelAndView index(Map<String, Object> map) {
		//1.openid校验
		//TODO...
		//2.获取所有API信息
		map.put("resultVO", ResultVO.success().append("apiList", apiInfoService.getAllAPI()));
		return new ModelAndView("index",map);
	}
	/**
	 * 
	 * @param id API的id值
	 * @return
	 */
	@GetMapping("/details/{id}")
	public ModelAndView details(@PathVariable("id")Integer id,Map<String, Object> map) {
		ResultVO<Object> resultVO= ResultVO.success();
		
		//1.去数据库查询API详情
		ApiInfo apiInfo=apiInfoService.getAPIById(id);
		String paramsStr=apiInfo.getParamsStr();
		if(paramsStr!=null) {
			//若api需要参数，将参数名解析后返回给用户，让用户填写信息
			String[] params=paramsStr.split("-");
			resultVO.append("params", Arrays.asList(params));
		}
		map.put("resultVO", resultVO.append("apiInfo", apiInfo));
		//调用对应的模板页面返回给用户(模板页面是根据id进行命名的)
		return new ModelAndView("api_pages/"+id,map);
	}
	
}
