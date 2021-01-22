package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Course;
import com.jiajiao.dao.CourseDao;

@Repository("courseDao")
public class CourseDaoImpl implements CourseDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	public List<Course> findAllCourseList() {
		String sql = " SELECT a.courseid courseId,a.coursename courseName,a.kemuxiaolei,b.content kemuxiaoleiName,a.kemudalei,c.content kemudaleiName "
				+ " FROM t_course a,t_dictinfo b,t_dictinfo c "
				+ " WHERE a.kemuxiaolei = b.dictid AND a.kemudalei = c.dictid";
		RowMapper<Course> rowMapper = new BeanPropertyRowMapper<Course>(
				Course.class);
		List<Course> coutseList = jdbcTemplate.query(sql, rowMapper);

		return coutseList;
	}

	@Override
	public Course findCourseById(int id) {

		String sql = "select courseId,courseName,kemuxiaolei,kemudalei from t_course where courseId=?";

		RowMapper<Course> rowMapper = new BeanPropertyRowMapper<Course>(
				Course.class);
		Course course = jdbcTemplate.queryForObject(sql, rowMapper, id);

		return course;
	}

	@Override
	public List<Course> findCourseListByIsMobileAndKemudalei(int type) {

		String sql = "";

		if (type == 1) {
			sql = "SELECT courseId,courseName,kemuxiaolei,kemudalei from t_course WHERE isMobile=1 AND kemudalei in(1,2,3,4)";
		} else if (type == 2) {
			sql = "SELECT courseId,courseName,kemuxiaolei,kemudalei from t_course WHERE isMobile=1 AND kemudalei =6";
		} else if (type == 3) {
			sql = "SELECT courseId,courseName,kemuxiaolei,kemudalei from t_course WHERE isMobile=1 AND kemudalei =7";
		}

		try {
			RowMapper<Course> rowMapper = new BeanPropertyRowMapper<Course>(
					Course.class);

			List<Course> courseList = jdbcTemplate.query(sql, rowMapper);

			return courseList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<Course> findCourseBykemudalei(int kemudalei) {

		String sql = "SELECT courseId,courseName FROM t_course WHERE kemudalei=?";

		try {
			RowMapper<Course> rowMapper = new BeanPropertyRowMapper<Course>(
					Course.class);

			List<Course> courseList = jdbcTemplate.query(sql, rowMapper,
					kemudalei);

			return courseList;

		} catch (Exception e) {

			return null;
		}
	}

}
