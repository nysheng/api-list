package com.nys.apilist.service;

import java.util.List;

import com.nys.apilist.dataobject.ApiInfo;

/**
 * API信息Service接口
 * @author nysheng
 *
 */
public interface ApiInfoService {
	List<ApiInfo> getAllAPI();//获取所有API
	ApiInfo getAPIById(Integer id);//根据主键查找API
}
