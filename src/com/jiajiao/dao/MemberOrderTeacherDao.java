package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.MemberOrderTeacher;

public interface MemberOrderTeacherDao {

	public int insert(MemberOrderTeacher orderTeacher);

	public int isOrderTeacher(int memberId, int teacherId);

	public int calcOrderTeacherNum(MemberOrderTeacher memberOrderTeacherd);

	public List<MemberOrderTeacher> findMemberOrderTeacherByMemberId(
			int memberId);

	public List<MemberOrderTeacher> pagefindAllMemberOrderTeacher(int pageSize,
			int currentPage);

	public int pagefindAllMemberOrderTeacherCount();

	public List<MemberOrderTeacher> findAllMemberOrderTeacher();

	public MemberOrderTeacher findMemberOrderTeacherByMosId(int id);

	public int updateOrderTeacherInfoByMosId(
			MemberOrderTeacher memberOrderTeacher);

	public List<MemberOrderTeacher> findMemberOrderTeacherByTeacherId(
			int teacherId);

}
