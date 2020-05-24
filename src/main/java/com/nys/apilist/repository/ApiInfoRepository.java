package com.nys.apilist.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nys.apilist.dataobject.ApiInfo;
/**
 * API信息Repository接口
 * @author nysheng
 *
 */

public interface ApiInfoRepository extends JpaRepository<ApiInfo, Integer> {
	
}
