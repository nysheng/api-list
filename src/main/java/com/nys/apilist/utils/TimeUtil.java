package com.nys.apilist.utils;

import java.time.Duration;
import java.time.LocalDateTime;
/**
 * 时间工具类，用于生成当前时间到当晚十二点的时间间隔
 * @author nysheng
 *
 */
public class TimeUtil {
	public static Long getTimeForMinutes() {
		LocalDateTime localDateTime =LocalDateTime.now();
		int year=localDateTime.getYear();
		int month=localDateTime.getMonthValue();
		int day=localDateTime.getDayOfMonth();
		int dayOfMonth=localDateTime.getMonthValue();
		if(day==dayOfMonth) {
			if(month==12) {
				month=1;
			}else {
				month++;
			}
			day=1;
		}else {
			day++;
		}
		LocalDateTime localDateTime1=LocalDateTime.of(year, month, day, 0, 0,0);
		Duration duration=Duration.between(localDateTime,localDateTime1);
		return duration.toMinutes();
	}
}
