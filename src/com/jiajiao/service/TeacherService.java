package com.jiajiao.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.jiajiao.bean.Teacher;

public interface TeacherService {

	public List<Teacher> findTeacherListIsZhongXiaoXue(int isMobile);

	public List<Teacher> findTeacherListIsYueQi(int isMobile);

	public List<Teacher> findTeacherListIsQiLei(int isMobile);

	public Map<String, Object> registTeacher(String phone, String pwd);

	public Teacher findByPhone(String phone);

	public Teacher login(String phone, String pwd);

	public Map<String, Object> updateTeacher(Teacher teacher);

	public Map<String, Object> changePwd(String pwd, int teacherId);

	public Map<String, Object> uploadPersonImg(MultipartFile file,
			HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException;

	public int PagefindAllTeacherListCout();

	public List<Teacher> PagefindAllTeachersList(int pageSize, int currentPage);

	public Teacher findByTeacherId(int tId);

	public List<Teacher> findAllTeacherList();

	public int changeTeacherUse(int id, int i);

	public int auditTeacher(int id, int i);

	public int pageFindTeacherListCount(String course, String areaId,
			int teacherType, int gender);

	public List<Teacher> PagefindTeachersList(String course, String areaId,
			int teacherType, int gender, int pageSize, int currentPage);

	public Map<String, Object> PersonIDUpload(HttpServletRequest request,
			HttpSession session) throws IllegalStateException, IOException;

	public int countTeacherTotal();

	public int calSuccessJJ(int tId);

	public int countPendingTeacherTotal();

	public int countBanTeacherTotal();

	public List<Teacher> pagefindTeachersListByCondition(String course,
			String area, int teacherType, int gender, int pageSize,
			Integer pageNo);

	public Map<String, Object> registTeacher(String mobile, String pwd,
			String teacherType);

	public Map<String, Object> mUpdatePersonal(Teacher teacher,HttpSession session);

	public Map<String, Object> mUpdateEducate(Teacher teacher,
			HttpSession session);

	public Map<String, Object> mUpdateTeaching(Teacher teacher,
			HttpSession session);


}
