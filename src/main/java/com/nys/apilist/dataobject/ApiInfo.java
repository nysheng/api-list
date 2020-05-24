package com.nys.apilist.dataobject;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String url;
	private String paramsStr;
	private String name;
	private String image;
	private String comment;
	@Override
	public String toString() {
		return "ApiInfo [id=" + id + ", url=" + url + ", paramsStr=" + paramsStr + ", name=" + name + ", image=" + image
				+ ", comment=" + comment + "]";
	}
	
	
}
