package com.jiajiao.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Member;
import com.jiajiao.bean.MemberOrderTeacher;
import com.jiajiao.bean.Teacher;
import com.jiajiao.service.MemberOrderTeacherService;
import com.jiajiao.service.MemberService;

@Controller
public class MemberOrderTeacherController {

	@Resource
	private MemberOrderTeacherService memberOrderTeacherService;

	@Resource
	private MemberService memberService;

	@RequestMapping("orderTeacherInfo")
	@ResponseBody
	public Map<String, Object> orderTeacherInfo(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		MemberOrderTeacher memberOrderTeacher = memberOrderTeacherService
				.findMemberOrderTeacherByMosId(id);

		if (memberOrderTeacher == null) {
			map.put("success", false);
			map.put("message", "查询失败");
		} else {
			map.put("success", true);
			map.put("message", memberOrderTeacher);
		}
		return map;
	}

	@RequestMapping("updateOrderTeacherInfo")
	@ResponseBody
	public Map<String, Object> updateOrderTeacherInfo(
			MemberOrderTeacher memberOrderTeacher) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = memberOrderTeacherService
				.updateOrderTeacherInfoByMosId(memberOrderTeacher);

		if (row != 0) {
			map.put("success", true);
			map.put("message", "修改成功");
		} else {
			map.put("success", false);
			map.put("message", "修改失败");
		}

		return map;
	}


}
