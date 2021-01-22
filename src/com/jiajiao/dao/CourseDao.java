package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.Course;

public interface CourseDao {

	public List<Course> findAllCourseList();

	public Course findCourseById(int id);

	public List<Course> findCourseListByIsMobileAndKemudalei(int type);

	public List<Course> findCourseBykemudalei(int kemudalei);
}
