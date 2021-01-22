package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.MemberOrderTeacher;

public interface MemberOrderTeacherService {

	public Map<String, Object> addAppointTeacher(
			MemberOrderTeacher memberOrderTeacher);

	public Map<String, Object> showAppointPop(int memberId, int teacherId);

	public List<MemberOrderTeacher> findMemberOrderTeacherByMemberId(
			int memberId);

	public int pagefindAllMemberOrderTeacherCount();

	public List<MemberOrderTeacher> pagefindAllMemberOrderTeacher(int pageSize,
			int currentPage);

	public List<MemberOrderTeacher> findAllMemberOrderTeacher();

	public MemberOrderTeacher findMemberOrderTeacherByMosId(int id);

	public int updateOrderTeacherInfoByMosId(
			MemberOrderTeacher meberOrderTeacher);

	public List<MemberOrderTeacher> findMemberOrderTeacherByTeacherId(
			int teacherId);
}
