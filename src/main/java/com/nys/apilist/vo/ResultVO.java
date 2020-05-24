package com.nys.apilist.vo;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;
/**
 * Controller层返回结果
 * @author nysheng
 *
 * @param <T>
 */
@Data
public class ResultVO<T> {
	private Integer code;
	private String status;
	private Map<String, T> data;

	public ResultVO<T> append(String key,T value){
		this.data.put(key, value);
		return this;
	}
	public static <T> ResultVO<T> success(){
		ResultVO<T> resultVO=new ResultVO<T>();
		resultVO.setCode(1);
		resultVO.setStatus("success");
		resultVO.setData(new HashMap<String, T>());
		return resultVO;
	}
	public static <T> ResultVO<T> fail(T data){
		ResultVO<T> resultVO=new ResultVO<T>();
		resultVO.setCode(0);
		resultVO.setStatus("fail");
		resultVO.setData(new HashMap<String, T>());
		return resultVO;
	}
}
