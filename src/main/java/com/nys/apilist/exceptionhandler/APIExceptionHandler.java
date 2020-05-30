package com.nys.apilist.exceptionhandler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.nys.apilist.exception.APIException;
/**
 * 获取API信息时产生的异常处理
 * @author nysheng
 *
 */
@ControllerAdvice
public class APIExceptionHandler {
	
	@ExceptionHandler(value=APIException.class)
	public String handler() {
		return "redirect:"+"/index";
	}
}
