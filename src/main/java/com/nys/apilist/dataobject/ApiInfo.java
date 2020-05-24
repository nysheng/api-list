package com.nys.apilist.dataobject;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

/**
 * api信息实体类
 * @author nysheng
 *
 */
@Entity
@Data
public class ApiInfo {
	@Id
	@GeneratedValue
	private Integer id;
	
	private String url;
	private String paramsStr;
	private String name;
	private String image;
	private String comment;
}
