package com.nys.apilist.utils;


import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
class TimeUtilTest {

	@Test
	void testGetTimeForSeconds() {
		Long minutes=TimeUtil.getTimeForMinutes();
		Assert.assertTrue(minutes>0);
		
	}

}
