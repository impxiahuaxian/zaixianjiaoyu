package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.FastOrderTeacher;

public interface FastOrderTeacherService {

	public Map<String, Object> orderTeacher(FastOrderTeacher fastOrderTeacher);

	public List<FastOrderTeacher> findAllFastORderTeacher();

	public FastOrderTeacher findFastOrderTeacherInfoByFotId(int id);

	public int updateFastOrderTeacherInfo(FastOrderTeacher fastOrderTeacher);

	public List<FastOrderTeacher> findFastOrderTeacherInfoByTeacherId(
			int teacherId);

}
