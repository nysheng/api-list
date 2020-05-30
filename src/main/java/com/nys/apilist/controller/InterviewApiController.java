package com.nys.apilist.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSON;
import com.nys.apilist.dataobject.ApiInfo;
import com.nys.apilist.exception.APIException;
import com.nys.apilist.service.ApiInfoService;




@RestController
@RequestMapping("/api")
public class InterviewApiController {

	@Autowired 
	private ApiInfoService apiInfoService;
	/**
	 * 发送有参数的get请求-参数形式：url?a=1&b=2
	 * @param id API的id值
	 * @param map
	 * @param request 请求域，用于获得参数值
	 * @return
	 */
	@GetMapping("interview/{id}")
	public Object interview(@PathVariable("id")Integer id,Map<String, Object> map,HttpServletRequest request){
		//去数据库查询API详情
		ApiInfo apiInfo=apiInfoService.getAPIById(id);
		if(apiInfo==null) {
			throw new APIException();
		}
		String paramStr=apiInfo.getParamsStr();
		//解析参数
		String[] params=paramStr.split("-");
		String param="";
		for(String key : params) {
			String value=request.getParameter(key);
			param+="&"+key+"="+value;
		}
		param=param.substring(1);
		//发送get请求
		RestTemplate restTemplate=new RestTemplate();
		String result=restTemplate.getForObject(apiInfo.getUrl()+"?"+param, String.class);
		return JSON.parse(result);
	}
	/**
	 * 发送有参数的get请求-参数形式：url/key/value
	 * 需要发送的参数只有一个
	 * @param id
	 * @param map
	 * @param request
	 * @return
	 */
	@GetMapping("interview_path/{id}")
	public Object interview_path(@PathVariable("id")Integer id,Map<String, Object> map,HttpServletRequest request){
		//去数据库查询API详情
		ApiInfo apiInfo=apiInfoService.getAPIById(id);
		if(apiInfo==null) {
			throw new APIException();
		}
		String key=apiInfo.getParamsStr();
		String value=request.getParameter(key);
		//解析参数
		String param="";
		if(StringUtils.isEmpty(value)) {
			param+="/"+key;
		}else {
			param+="/"+key+"/"+value;
		}
		//发送get请求
		RestTemplate restTemplate=new RestTemplate();
		String result=restTemplate.getForObject(apiInfo.getUrl()+param, String.class);
		return JSON.parse(result);
	}
	/**
	 * 发送无参get请求
	 * @param id API的id值
	 * @param map
	 * @return
	 */
	@GetMapping("/interview_no_params/{id}")
	public Object interviewNoParams(@PathVariable("id")Integer id,Map<String, Object> map) {
		//去数据库查询API详情
		ApiInfo apiInfo=apiInfoService.getAPIById(id);
		if(apiInfo==null) {
			throw new APIException();
		}
		//发送get请求
		RestTemplate restTemplate=new RestTemplate();
		String result=restTemplate.getForObject(apiInfo.getUrl(), String.class);
		return JSON.parse(result);
	}
}
