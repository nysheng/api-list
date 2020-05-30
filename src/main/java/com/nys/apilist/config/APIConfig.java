package com.nys.apilist.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;
/**
 * 
 * API相关配置-如每个API允许访问的次数
 * @author nysheng
 *
 */
@Data
@Component
@ConfigurationProperties(prefix = "api")
public class APIConfig {
	private String count;
}
