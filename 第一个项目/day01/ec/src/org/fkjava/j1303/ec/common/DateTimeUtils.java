package org.fkjava.j1303.ec.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 * 日期时间工具类，用于时间处理
 * 
 * @author lwq
 * 
 */
public class DateTimeUtils {

	/**
	 * 默认的时间格式
	 */
	public static final String DEFAULT_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 获取当前时间的字符串表达形式。以默认时间格式进行时间的格式化
	 * 
	 * @return 以默认时间格式返回当前时间的字符串形式
	 */
	public static String getCurrentTime() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				DEFAULT_TIME_PATTERN);
		return simpleDateFormat.format(new Date());
	}

	/**
	 * 使用默认格式把时间格式化成字符串
	 * 
	 * @param date
	 *            需要格式化成字符串的日期
	 * @return
	 */
	public static String toString(Date date) {
		return toString(date, DEFAULT_TIME_PATTERN);
	}

	/**
	 * 使用指定的格式把时间格式化成字符串
	 * 
	 * @param date
	 *            需要格式化成字符串的日期
	 * @param pattern
	 *            目标的时间格式
	 * @return
	 */
	public static String toString(Date date, String pattern) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		return simpleDateFormat.format(date);
	}

	/**
	 * 按照默认格式把字符串转换成Date对象
	 * 
	 * @param date
	 *            字符串格式的日期
	 * @return
	 * @throws ParseException
	 */
	public static Date toDate(String date) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				DEFAULT_TIME_PATTERN);
		return simpleDateFormat.parse(date);
	}

	/**
	 * 使用指定格式把字符串转换成日期对象
	 * 
	 * @param date
	 *            字符串格式的日期
	 * @param pattern
	 *            字符串的日期格式
	 * @return
	 * @throws ParseException
	 */
	public static Date toDate(String date, String pattern)
			throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		return simpleDateFormat.parse(date);
	}

	/**
	 * 以GMT格式返回指定时间的字符串形式
	 * 
	 * @param date
	 *            指定的时间
	 * @return GMT格式的时间字符串形式
	 */
	public static String getGMTTime(Date date) {
		// 标准的GMT格式时间：27 Jun 2013 03:27:53 GMT
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"d MMM yyyy HH:mm:ss z", Locale.ENGLISH);
		simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));

		return simpleDateFormat.format(date);
	}

	/**
	 * 在指定时间上，增加指定的秒数
	 * 
	 * @param date
	 *            指定时间
	 * @param seconds
	 *            需要增加的秒数
	 * @return 增加指定的seconds后的时间
	 */
	public static Date addSeconds(Date date, int seconds) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.SECOND, seconds);
		return calendar.getTime();
	}
}
