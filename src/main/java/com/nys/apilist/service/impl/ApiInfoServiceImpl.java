package com.nys.apilist.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nys.apilist.dataobject.ApiInfo;
import com.nys.apilist.repository.ApiInfoRepository;
import com.nys.apilist.service.ApiInfoService;
import lombok.extern.slf4j.Slf4j;
/**
 * API信息Service实现类
 * @author nysheng
 *
 */

@Service
@Slf4j
public class ApiInfoServiceImpl implements ApiInfoService{
	@Autowired
	private ApiInfoRepository repository;
	/**
	 * 获得所有API信息
	 */
	@Override
	public List<ApiInfo> getAllAPI() {
		List<ApiInfo> list=repository.findAll();
		log.info("【查询所有API信息】：{}",list.size());
		return list;
	}
	/**
	 * 根据主键id查找API
	 */
	@Override
	public ApiInfo getAPIById(Integer id) {
		Optional<ApiInfo> optional= repository.findById(id);
		if(optional==null) {
			log.warn("【根据id查询API】查询失败：null");
			return null;
		}
		ApiInfo apiInfo=optional.get();
		return apiInfo;
	}

}
