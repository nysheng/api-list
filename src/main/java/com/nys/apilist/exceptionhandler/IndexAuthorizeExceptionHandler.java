package com.nys.apilist.exceptionhandler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import com.nys.apilist.exception.IndexAuthorizeException;

/**
 * 拦截异常，
 * @author nysheng
 *
 */
@ControllerAdvice
public class IndexAuthorizeExceptionHandler {
	@ExceptionHandler(value = IndexAuthorizeException.class)
	public String handler() {
		return "redirect:"+"/index";
	}
}
