package com.jiajiao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.Course;
import com.jiajiao.dao.CourseDao;
import com.jiajiao.service.CourseService;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

	@Resource
	private CourseDao courseDao;

	public List<Course> findAllCourseList() {

		return courseDao.findAllCourseList();
	}

	@Override
	public List<Course> findCourseListByIsMobileAndKemudalei(int type) {
		return courseDao.findCourseListByIsMobileAndKemudalei(type);
	}

	@Override
	public List<Course> findCourseBykemudalei(int kemudalei) {
		return courseDao.findCourseBykemudalei(kemudalei);
	}

}
