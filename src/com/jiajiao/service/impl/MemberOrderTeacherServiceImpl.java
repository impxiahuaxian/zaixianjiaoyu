package com.jiajiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.MemberOrderTeacher;
import com.jiajiao.dao.MemberOrderTeacherDao;
import com.jiajiao.service.MemberOrderTeacherService;

@Service("memberOrderTeacherService")
@Transactional
public class MemberOrderTeacherServiceImpl implements MemberOrderTeacherService {

	@Resource
	private MemberOrderTeacherDao memberOrderTeacherDao;

	@Override
	public Map<String, Object> showAppointPop(int memberId, int teacherId) {

		Map<String, Object> map = new HashMap<String, Object>();

		// 判断是否该学员已经预约3位老师了
		int row = 0;
		MemberOrderTeacher memberOrderTeacherd = new MemberOrderTeacher();
		memberOrderTeacherd.setMemberId(memberId);
		row = memberOrderTeacherDao.calcOrderTeacherNum(memberOrderTeacherd);

		if (row > 2) {
			map.put("state", 4);// 已经预约超出3位教员
			map.put("message", "您已预约3位教员授课，请等待客服确认。");
			return map;
		}

		// 判断该学员是否已预订了该位教员
		row = memberOrderTeacherDao.isOrderTeacher(memberId, teacherId);
		if (row == 0) {
			map.put("state", 2);// 还未预订
			return map;
		} else {
			map.put("state", 3);// 已经预订了
			return map;
		}

	}

	@Override
	public Map<String, Object> addAppointTeacher(
			MemberOrderTeacher memberOrderTeacherd) {

		Map<String, Object> map = new HashMap<String, Object>();

		// 先查询是否该学员已经预约3位老师了
		int row = 0;
		row = memberOrderTeacherDao.calcOrderTeacherNum(memberOrderTeacherd);
		if (row > 2) {
			map.put("success", false);
			map.put("message", "您已预约3位教员授课，请等待客服确认。");
			return map;
		}

		row = memberOrderTeacherDao.insert(memberOrderTeacherd);

		if (row != 0) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "预约失败，请重新预约");
		}

		return map;

	}

	@Override
	public List<MemberOrderTeacher> findMemberOrderTeacherByMemberId(
			int memberId) {

		return memberOrderTeacherDao.findMemberOrderTeacherByMemberId(memberId);
	}

	@Override
	public List<MemberOrderTeacher> pagefindAllMemberOrderTeacher(int pageSize,
			int currentPage) {

		return memberOrderTeacherDao.pagefindAllMemberOrderTeacher(pageSize,
				currentPage);
	}

	@Override
	public int pagefindAllMemberOrderTeacherCount() {

		return memberOrderTeacherDao.pagefindAllMemberOrderTeacherCount();
	}

	@Override
	public List<MemberOrderTeacher> findAllMemberOrderTeacher() {
		return memberOrderTeacherDao.findAllMemberOrderTeacher();
	}

	@Override
	public MemberOrderTeacher findMemberOrderTeacherByMosId(int id) {
		return memberOrderTeacherDao.findMemberOrderTeacherByMosId(id);
	}

	@Override
	public int updateOrderTeacherInfoByMosId(
			MemberOrderTeacher memberOrderTeacher) {
		return memberOrderTeacherDao
				.updateOrderTeacherInfoByMosId(memberOrderTeacher);
	}

	@Override
	public List<MemberOrderTeacher> findMemberOrderTeacherByTeacherId(
			int teacherId) {
		return memberOrderTeacherDao
				.findMemberOrderTeacherByTeacherId(teacherId);
	}
}
