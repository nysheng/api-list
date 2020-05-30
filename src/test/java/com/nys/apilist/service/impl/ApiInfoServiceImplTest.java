package com.nys.apilist.service.impl;

import java.util.List;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.nys.apilist.dataobject.ApiInfo;

/**
 * API信息Service实现类的测试
 * @author nysheng
 *
 */
@RunWith(SpringRunner.class)
@SpringBootTest
class ApiInfoServiceImplTest {

	@Autowired
	private ApiInfoServiceImpl apiInfoServiceImpl;
	@Test
	void testGetAllAPI() {
		 List<ApiInfo> results= apiInfoServiceImpl.getAllAPI();
		 Assert.assertNotNull(results);
	}

	@Test
	void testGetAPIById() {
		ApiInfo apiInfo=apiInfoServiceImpl.getAPIById(10000);
		Assert.assertNotNull(apiInfo);
	}

}
