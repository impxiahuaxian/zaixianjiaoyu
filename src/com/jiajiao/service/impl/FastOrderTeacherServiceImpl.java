package com.jiajiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiajiao.bean.FastOrderTeacher;
import com.jiajiao.dao.FastOrderTeacherDao;
import com.jiajiao.service.FastOrderTeacherService;

@Service
public class FastOrderTeacherServiceImpl implements FastOrderTeacherService {

	@Resource
	private FastOrderTeacherDao fastOrderTeacherDao;

	@Override
	public Map<String, Object> orderTeacher(FastOrderTeacher fastOrderTeacher) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;

		row = fastOrderTeacherDao.calcOrderTeacherNumByIp(fastOrderTeacher
				.getIp());

		if (row > 2) {
			map.put("success", false);
			map.put("message", "您已预约3次，请等待客服确认。");
			return map;
		}

		row = fastOrderTeacherDao.insert(fastOrderTeacher);

		if (row != 0) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "快速请家教失败");
		}

		return map;
	}

	@Override
	public List<FastOrderTeacher> findAllFastORderTeacher() {
		return fastOrderTeacherDao.findAllFastORderTeacher();
	}

	@Override
	public FastOrderTeacher findFastOrderTeacherInfoByFotId(int id) {
		return fastOrderTeacherDao.findFastOrderTeacherInfoByFotId(id);
	}

	@Override
	public int updateFastOrderTeacherInfo(FastOrderTeacher fastOrderTeacher) {

		return fastOrderTeacherDao.updateFastOrderTeacherInfo(fastOrderTeacher);
	}

	@Override
	public List<FastOrderTeacher> findFastOrderTeacherInfoByTeacherId(
			int teacherId) {
		return fastOrderTeacherDao
				.findFastOrderTeacherInfoByTeacherId(teacherId);
	}
}
