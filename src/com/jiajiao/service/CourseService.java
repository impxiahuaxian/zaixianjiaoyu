package com.jiajiao.service;

import java.util.List;

import com.jiajiao.bean.Course;

public interface CourseService {

	public List<Course> findAllCourseList();

	public List<Course> findCourseListByIsMobileAndKemudalei(int type);

	public List<Course> findCourseBykemudalei(int kemudalei);
}
