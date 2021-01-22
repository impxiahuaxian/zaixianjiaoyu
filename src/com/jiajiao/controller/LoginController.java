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
public class LoginController {

	@Resource
	private MemberService memberService;

	@Resource
	private TeacherService teacherService;

	/**
	 * 跳转到登录界面
	 * 
	 * @return
	 */
	@RequestMapping("loginPage")
	public String loginPage() {
		return "login";
	}

	@RequestMapping("login")
	@ResponseBody
	public Map<String, Object> login(String phone, String password,
			String registerType, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		if (registerType.equals("1")) {// 学员登录

			Member member = memberService.login(phone, MD5Utils.MD5(password));

			if (member != null) {

				if (member.getIsUse() == 0) {
					map.put("Status", 0);
					map.put("Message", "该账号已被禁止登录，请咨询客服人员");
				} else {
					session.setAttribute("member", member);

					map.put("Status", 1);
					map.put("redirect", "member/index.action");

					session.setAttribute("role", "1");// 学员登录
				}

			} else {
				map.put("Status", 0);
				map.put("Message", "手机号或密码错误");
			}

		} else if (registerType.equals("2")) {// 教员登录
			Teacher teacher = teacherService.login(phone, MD5Utils
					.MD5(password));

			if (teacher != null && teacher.getIsUse() == 1) {
				session.setAttribute("teacher", teacher);
				map.put("Status", 2);
				map.put("redirect", "teacher/index.action");
			} else if (teacher != null && teacher.getIsUse() == 0) {
				map.put("Status", 0);
				map.put("Message", "该账号已被禁止登录，请咨询客服人员");
			} else {
				map.put("Status", 0);
				map.put("Message", "手机号或密码错误");
			}

		}

		return map;

	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:welcome";
	}

	@RequestMapping("mLoginPage")
	public String mLoginPage() {
		return "mobile/login";
	}

	@RequestMapping("mLogin")
	@ResponseBody
	public Map<String, Object> mLogin(String phone, String password,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = memberService.login(phone, MD5Utils.MD5(password));

		Teacher teacher = teacherService.login(phone, MD5Utils.MD5(password));

		if (member != null) {

			if (member.getIsUse() == 0) {
				map.put("Status", 0);
				map.put("Message", "该账号已被禁止登录，请咨询客服人员");

			} else {
				session.setAttribute("member", member);

				map.put("Status", 1);
				map.put("redirect", "mobile.action");

				session.setAttribute("role", "1");// 学员登录
			}

		}

		if (teacher != null && teacher.getIsUse() == 1) {

			session.setAttribute("teacher", teacher);
			map.put("Status", 1);
			map.put("redirect", "mobile.action");

		} else if (teacher != null && teacher.getIsUse() == 0) {

			map.put("Status", 0);
			map.put("Message", "该账号已被禁止登录，请咨询客服人员");
		}

		if (member == null && teacher == null) {
			map.put("Status", 0);
			map.put("Message", "手机号或密码错误");

		}

		return map;

	}
	
	@RequestMapping("mLogout")
	public String mLogout(HttpSession session) {
		session.invalidate();
		return "redirect:mobile.action";
	}
}
