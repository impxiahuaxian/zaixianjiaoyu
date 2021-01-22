package com.jiajiao.utils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonUtil {

	public static Map<String, Object> teacherTimeMap = new HashMap<String, Object>();

	static {
		teacherTimeMap.put("33", "周一上午");
		teacherTimeMap.put("34", "周一下午");
		teacherTimeMap.put("35", "周一晚上");
		teacherTimeMap.put("36", "周二上午");
		teacherTimeMap.put("37", "周二下午");
		teacherTimeMap.put("38", "周二晚上");
		teacherTimeMap.put("39", "周三上午");
		teacherTimeMap.put("40", "周三下午");
		teacherTimeMap.put("41", "周三晚上");
		teacherTimeMap.put("42", "周四上午");
		teacherTimeMap.put("43", "周四下午");
		teacherTimeMap.put("44", "周四晚上");
		teacherTimeMap.put("45", "周五上午");
		teacherTimeMap.put("46", "周五下午");
		teacherTimeMap.put("47", "周五晚上");
		teacherTimeMap.put("48", "周六上午");
		teacherTimeMap.put("49", "周六下午");
		teacherTimeMap.put("50", "周六晚上");
		teacherTimeMap.put("51", "周日上午");
		teacherTimeMap.put("52", "周日下午");
		teacherTimeMap.put("53", "周日晚上");

	}

	public static String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.contains(",")) {
			return ip.split(",")[0];
		} else {
			return ip;
		}
	}

	// 更改状态
	public static int changeState(int state) {
		return state == 1 ? 0 : 1;
	}

	// 显示提示信息
	public static void showAlertMessage(HttpServletResponse response, String msg)
			throws IOException {
		response.getWriter().println(
				"<SCRIPT LANGUAGE='JavaScript'>alert('" + msg
						+ "');javascript:history.back(-1);</SCRIPT>");

	}

	// 显示提示信息
	public static void showAlertMessageNoBack(HttpServletResponse response,
			String msg) throws IOException {
		response.getWriter().println(
				"<SCRIPT LANGUAGE='JavaScript'>alert('" + msg + "');</SCRIPT>");

	}

	// 生成num位数的随机数字符串
	public static String randomCode(int num) {

		String code = "";

		Random random = new Random();

		for (int i = 0; i < num; i++) {
			code += random.nextInt(10);
		}

		return code;

	}

	/**
	 * 判断数组values中是否有存在s字符串，如果有，转变为""
	 * 
	 * @param values
	 * @param s
	 * @return
	 */
	public static String[] changeValues(String[] values, String s) {

		if (ArrayHelper.inArray(values, s)) {
			for (int i = 0; i < values.length; i++) {
				values[i] = "";
			}
		}

		return values;
	}

	/**
	 * 给定开始时间和结束时间，计算中间天数
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 * @throws ParseException
	 */
	public static double differentDays(String from, String to)
			throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date beginDate = sdf.parse(from);
		Date endDate = sdf.parse(to);

		double days = ((endDate.getTime() - beginDate.getTime()) * 1.0 / (1000 * 3600 * 24));

		return Math.ceil(days);// 向上取整--时间不满一天也算一天
	}

	public static long calMin(String from, String to) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date d = sdf.parse(from);
		Date d2 = sdf.parse(to);

		long c = Math.abs(d.getTime() - d2.getTime()) / (1000 * 60);

		return c;
	}

	public static String getTeacherTime(String code) {

		return (String) teacherTimeMap.get(code);
	}

	// 生成随机数字和字母,
	public static String getStringRandom(int length) {

		String val = "";
		Random random = new Random();
		// length为几位密码
		for (int i = 0; i < length; i++) {
			String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
			// 输出字母还是数字
			if ("char".equalsIgnoreCase(charOrNum)) {
				// 输出是大写字母还是小写字母
				int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
				val += (char) (random.nextInt(26) + temp);
			} else if ("num".equalsIgnoreCase(charOrNum)) {
				val += String.valueOf(random.nextInt(10));
			}
		}
		return val;
	}

}
