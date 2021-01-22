package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.FastOrderTeacher;

public interface FastOrderTeacherDao {

	public int insert(FastOrderTeacher fastOrderTeacher);

	public int calcOrderTeacherNumByIp(String ip);

	public List<FastOrderTeacher> findAllFastORderTeacher();

	public FastOrderTeacher findFastOrderTeacherInfoByFotId(int id);

	public int updateFastOrderTeacherInfo(FastOrderTeacher fastOrderTeacher);

	public List<FastOrderTeacher> findFastOrderTeacherInfoByTeacherId(
			int teacherId);
}
