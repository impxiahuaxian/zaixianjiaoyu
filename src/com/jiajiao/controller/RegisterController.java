package com.jiajiao.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajiao.bean.Member;
import com.jiajiao.bean.Teacher;
import com.jiajiao.service.MemberService;
import com.jiajiao.service.TeacherService;
import com.jiajiao.utils.MD5Utils;

@Controller
public class RegisterController {

	@Resource
	private MemberService memberService;

	@Resource
	private TeacherService teacherService;

	/**
	 * 跳转到注册界面
	 * 
	 * @return
	 */
	@RequestMapping("registerPage")
	public String registerPage() {
		return "register";
	}

	/**
	 * 注册功能
	 * 
	 * @param mobile
	 * @param password
	 * @param registerType
	 *            注册类型：1学员、2教员
	 * @param verifyCode
	 * @param session
	 * @return
	 */
	@RequestMapping("register")
	@ResponseBody
	public Map<String, Object> register(String mobile, String password,
			String registerType, String verifyCode, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		if (!(verifyCode.equalsIgnoreCase(session.getAttribute("code")
				.toString()))) { // 忽略验证码大小写
			map.put("success", false);
			map.put("message", "验证码错误！");
			return map;
		}

		if (registerType.equals("1")) {

			Member member = memberService.findByPhone(mobile);
			if (member != null) {
				map.put("success", false);
				map.put("message", "手机号已存在");
				return map;
			}

			int row = memberService.registerMember(mobile, MD5Utils.MD5(password));
			if (row == 0) {
				map.put("success", false);
				map.put("message", "注册失败，请重新注册");
			} else {
				map.put("success", true);
				map.put("message", "注册成功");
				map.put("registerType", 1);
			}
		} else if (registerType.equals("2")) {// 教员注册

			// 查找是否存在该手机号
			map = teacherService.registTeacher(mobile, MD5Utils.MD5(password));
		}

		return map;
	}

	@RequestMapping("checkMobileExist")
	@ResponseBody
	public Map<String, Object> checkMobileExist(String mobile) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = memberService.findByPhone(mobile);

		Teacher teacher = teacherService.findByPhone(mobile);

		if (member != null || teacher != null) {
			map.put("success", false);
			map.put("message", "手机号已存在");
		} else {
			map.put("success", true);
			map.put("message", "通过");
		}

		return map;
	}
	
	/**
	 * 跳转到注册界面
	 * 
	 * @return
	 */
	@RequestMapping("mRegisterPage")
	public String mRegisterPage() {
		return "mobile/register";
	}
	
	@RequestMapping("mRegister")
	@ResponseBody
	public Map<String, Object> mRegister(String mobile, String password,
			String registerType, String verifyCode,String teacherType, HttpSession session) {

    	Map<String, Object> map = new HashMap<String, Object>();

		if (!(verifyCode.equalsIgnoreCase(session.getAttribute("code")
				.toString()))) { // 忽略验证码大小写
			map.put("success", false);
			map.put("message", "验证码错误！");
			return map;
		}

		if (registerType.equals("1")) {

			Member member = memberService.findByPhone(mobile);
			if (member != null) {
				map.put("success", false);
				map.put("message", "手机号已存在");
				return map;
			}

			int row = memberService.registerMember(mobile, MD5Utils.MD5(password));
			if (row == 0) {
				map.put("success", false);
				map.put("message", "注册失败，请重新注册");
			} else {
				map.put("success", true);
				map.put("message", "注册成功");
				map.put("registerType", 1);
				map.put("redirect", "mLoginPage.action");
			}
		} else if (registerType.equals("2")) {// 教员注册

			// 查找是否存在该手机号
			map = teacherService.registTeacher(mobile, MD5Utils.MD5(password),teacherType);
		}

		return map;
	}
}
