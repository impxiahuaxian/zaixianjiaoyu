package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.FastOrderTeacher;
import com.jiajiao.dao.FastOrderTeacherDao;

@Repository("fastOrderTeacherDao")
public class FastOrderTeacherDaoImpl implements FastOrderTeacherDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insert(FastOrderTeacher fastOrderTeacher) {

		String sql = "INSERT INTO t_fastorderteacher(name,phone,teachingCourse,teachingCourseName,wxNumber,publicTime,state,ip)"
				+ " VALUES(?,?,?,?,?,now(),1,?)";

		int row = jdbcTemplate.update(sql, fastOrderTeacher.getName(),
				fastOrderTeacher.getPhone(), fastOrderTeacher
						.getTeachingCourse(), fastOrderTeacher
						.getTeachingCourseName(), fastOrderTeacher
						.getWxNumber(), fastOrderTeacher.getIp());

		return row;
	}

	@Override
	public int calcOrderTeacherNumByIp(String ip) {
		String sql = " SELECT count(fotId) FROM t_fastorderteacher "
				+ " Where ip=?  AND state IN (1,2,3,4)";

		int rows = jdbcTemplate.queryForObject(sql, Integer.class,
				new Object[] { ip });

		return rows;
	}

	@Override
	public List<FastOrderTeacher> findAllFastORderTeacher() {

		String sql = "SELECT  fotId, name,t_fastorderteacher.phone,teachingCourse,teachingCourseName,t_fastorderteacher.wxNumber,orderPrice, "
				+ " IFNULL(t_fastorderteacher.teacherId,'') teacherId,IFNULL(teacherName,'') teacherName,IFNULL(remark,'') remark,state,publicTime,ip  "
				+ " FROM t_fastorderteacher "
				+ " LEFT JOIN t_teacher ON t_fastorderteacher.teacherId=t_teacher.teacherId ";

		RowMapper<FastOrderTeacher> rowMapper = new BeanPropertyRowMapper<FastOrderTeacher>(
				FastOrderTeacher.class);

		List<FastOrderTeacher> fastOrderTeacherList = jdbcTemplate.query(sql,
				rowMapper);

		return fastOrderTeacherList;
	}

	@Override
	public FastOrderTeacher findFastOrderTeacherInfoByFotId(int id) {

		String sql = "SELECT  fotId, name,t_fastorderteacher.phone,teachingCourse,teachingCourseName,t_fastorderteacher.wxNumber,orderPrice, "
				+ " IFNULL(t_fastorderteacher.teacherId,'') teacherId,IFNULL(teacherName,'') teacherName,IFNULL(remark,'') remark,state,publicTime,ip  "
				+ " FROM t_fastorderteacher "
				+ " LEFT JOIN t_teacher ON t_fastorderteacher.teacherId=t_teacher.teacherId "
				+ "Where fotId=?";

		try {
			RowMapper<FastOrderTeacher> rowMapper = new BeanPropertyRowMapper<FastOrderTeacher>(
					FastOrderTeacher.class);
			FastOrderTeacher fastOrderTeacher = jdbcTemplate.queryForObject(
					sql, rowMapper, id);

			return fastOrderTeacher;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public int updateFastOrderTeacherInfo(FastOrderTeacher fastOrderTeacher) {
		String sql = "UPDATE t_fastorderteacher "
				+ " SET teacherId=?,name=?,phone=?,wxNumber=?,orderPrice=?,remark=?,state=? "
				+ " WHERE fotId=?";

		int row = jdbcTemplate.update(sql, new Object[] {
				fastOrderTeacher.getTeacherId(), fastOrderTeacher.getName(),
				fastOrderTeacher.getPhone(), fastOrderTeacher.getWxNumber(),
				fastOrderTeacher.getOrderPrice(), fastOrderTeacher.getRemark(),
				fastOrderTeacher.getState(), fastOrderTeacher.getFotId() });

		return row;
	}

	@Override
	public List<FastOrderTeacher> findFastOrderTeacherInfoByTeacherId(
			int teacherId) {
		String sql = "SELECT  fotId, name,t_fastorderteacher.phone,teachingCourse,teachingCourseName,t_fastorderteacher.wxNumber,orderPrice, "
				+ " IFNULL(t_fastorderteacher.teacherId,'') teacherId,IFNULL(teacherName,'') teacherName,IFNULL(remark,'') remark,state,publicTime,ip  "
				+ " FROM t_fastorderteacher "
				+ " LEFT JOIN t_teacher ON t_fastorderteacher.teacherId=t_teacher.teacherId "
				+ " WHERE t_fastorderteacher.teacherId=?"
				+ " ORDER BY t_fastorderteacher.publicTime DESC ";

		RowMapper<FastOrderTeacher> rowMapper = new BeanPropertyRowMapper<FastOrderTeacher>(
				FastOrderTeacher.class);

		List<FastOrderTeacher> fastOrderTeacherList = jdbcTemplate.query(sql,
				rowMapper, teacherId);

		return fastOrderTeacherList;
	}
}
