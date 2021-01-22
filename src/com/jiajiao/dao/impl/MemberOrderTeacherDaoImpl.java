package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.MemberOrderTeacher;
import com.jiajiao.dao.MemberOrderTeacherDao;

@Repository("memberOrderTeacherDao")
public class MemberOrderTeacherDaoImpl implements MemberOrderTeacherDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insert(MemberOrderTeacher orderTeacher) {
		String sql = "insert into t_memberorderteacher(memberId,teacherId,teachingCourse,teachingCourseName,name,gender,areaId,address,publicTime,lat,lng) "
				+ " values(?,?,?,?,?,?,?,?,now(),?,?)";

		int rows = jdbcTemplate.update(sql, orderTeacher.getMemberId(),
				orderTeacher.getTeacherId(), orderTeacher.getTeachingCourse(),
				orderTeacher.getTeachingCourseName(), orderTeacher.getName(),
				orderTeacher.getGender(), orderTeacher.getAreaId(),
				orderTeacher.getAddress(), orderTeacher.getLat(), orderTeacher
						.getLng());

		return rows;
	}

	@Override
	public int isOrderTeacher(int memberId, int teacherId) {
		String sql = " SELECT count(mosId) FROM t_memberorderteacher "
				+ " Where memberId=? AND teacherId=? AND state IN (1,2,3,4)";

		int rows = jdbcTemplate.queryForObject(sql, Integer.class,
				new Object[] { memberId, teacherId });

		return rows;
	}

	@Override
	public int calcOrderTeacherNum(MemberOrderTeacher memberOrderTeacherd) {
		String sql = " SELECT count(mosId) FROM t_memberorderteacher "
				+ " Where memberId=?  AND state IN (1,2,3,4)";

		int rows = jdbcTemplate.queryForObject(sql, Integer.class,
				new Object[] { memberOrderTeacherd.getMemberId() });

		return rows;
	}

	@Override
	public List<MemberOrderTeacher> findMemberOrderTeacherByMemberId(
			int memberId) {

		String sql = " SELECT mosId,memberId,IFNULL(t_teacher.teacherId,'') teacherId,IFNULL(t_teacher.teacherName,'') teacherName,teachingCourse,teachingCourseName,name, "
				+ " t_memberorderteacher.gender,t_memberorderteacher.areaId,t_memberorderteacher.address,lat,lng,publicTime,price,remark,state "
				+ " FROM t_memberorderteacher  "
				+ " LEFT JOIN t_teacher ON t_memberorderteacher.teacherId=t_teacher.teacherId "
				+ " WHERE t_memberorderteacher.memberId=?";

		RowMapper<MemberOrderTeacher> rowMapper = new BeanPropertyRowMapper<MemberOrderTeacher>(
				MemberOrderTeacher.class);

		List<MemberOrderTeacher> memberOrderTeacherList = jdbcTemplate.query(
				sql, rowMapper, memberId);

		return memberOrderTeacherList;
	}

	@Override
	public List<MemberOrderTeacher> pagefindAllMemberOrderTeacher(int pageSize,
			int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;

		String sql = " SELECT mosId,memberId,t_teacher.teacherId,t_teacher.teacherName,teachingCourse,teachingCourseName,name, "
				+ " t_memberorderteacher.gender,t_memberorderteacher.areaId,t_memberorderteacher.address,lat,lng,publicTime,price,remark,state "
				+ " FROM t_memberorderteacher  "
				+ " LEFT JOIN t_teacher ON t_memberorderteacher.teacherId=t_teacher.teacherId "
				+ " ORDER BY t_memberorderteacher.publicTime DESC "
				+ " limit "
				+ (start - 1) + "," + pageSize;

		RowMapper<MemberOrderTeacher> rowMapper = new BeanPropertyRowMapper<MemberOrderTeacher>(
				MemberOrderTeacher.class);

		List<MemberOrderTeacher> memberOrderTeacherList = jdbcTemplate.query(
				sql, rowMapper);

		return memberOrderTeacherList;
	}

	@Override
	public int pagefindAllMemberOrderTeacherCount() {

		String sql = "SELECT COUNT(mosId) FROM t_memberorderteacher";

		int row = jdbcTemplate.queryForObject(sql, Integer.class);

		return row;
	}

	@Override
	public List<MemberOrderTeacher> findAllMemberOrderTeacher() {
		String sql = " SELECT mosId,memberId,IFNULL(t_teacher.teacherId,'') teacherId,IFNULL(t_teacher.teacherName,'') teacherName,teachingCourse,teachingCourseName,name, "
				+ " t_memberorderteacher.gender,t_memberorderteacher.areaId,t_memberorderteacher.address,lat,lng,publicTime,price,remark,state "
				+ " FROM t_memberorderteacher  "
				+ " LEFT JOIN t_teacher ON t_memberorderteacher.teacherId=t_teacher.teacherId "
				+ " ORDER BY t_memberorderteacher.publicTime DESC ";

		RowMapper<MemberOrderTeacher> rowMapper = new BeanPropertyRowMapper<MemberOrderTeacher>(
				MemberOrderTeacher.class);

		List<MemberOrderTeacher> memberOrderTeacherList = jdbcTemplate.query(
				sql, rowMapper);

		return memberOrderTeacherList;
	}

	@Override
	public MemberOrderTeacher findMemberOrderTeacherByMosId(int id) {

		String sql = " SELECT mosId,memberId,t_teacher.teacherId,t_teacher.teacherName,teachingCourse,teachingCourseName,name, "
				+ " t_memberorderteacher.gender,t_memberorderteacher.areaId,t_memberorderteacher.address,lat,lng,publicTime,price,remark,state "
				+ " FROM t_memberorderteacher  "
				+ " LEFT JOIN t_teacher ON t_memberorderteacher.teacherId=t_teacher.teacherId "
				+ " WHERE t_memberorderteacher.mosId=?";

		try {
			RowMapper<MemberOrderTeacher> rowMapper = new BeanPropertyRowMapper<MemberOrderTeacher>(
					MemberOrderTeacher.class);
			MemberOrderTeacher memberOrderTeacher = jdbcTemplate
					.queryForObject(sql, rowMapper, id);

			return memberOrderTeacher;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int updateOrderTeacherInfoByMosId(
			MemberOrderTeacher memberOrderTeacher) {

		String sql = "UPDATE t_memberorderteacher "
				+ " SET teacherId=?,name=?,gender=?,areaId=?,address=?,price=?,remark=?,state=? "
				+ " WHERE mosId=?";

		int row = jdbcTemplate.update(sql, new Object[] {
				memberOrderTeacher.getTeacherId(),
				memberOrderTeacher.getName(), memberOrderTeacher.getGender(),
				memberOrderTeacher.getAreaId(),
				memberOrderTeacher.getAddress(), memberOrderTeacher.getPrice(),
				memberOrderTeacher.getRemark(), memberOrderTeacher.getState(),
				memberOrderTeacher.getMosId() });

		return row;
	}

	@Override
	public List<MemberOrderTeacher> findMemberOrderTeacherByTeacherId(
			int teacherId) {

		String sql = " SELECT mosId,memberId,t_teacher.teacherId,t_teacher.teacherName,teachingCourse,teachingCourseName,name, "
				+ " t_memberorderteacher.gender,t_memberorderteacher.areaId,t_memberorderteacher.address,lat,lng,publicTime,price,remark,state "
				+ " FROM t_memberorderteacher  "
				+ " LEFT JOIN t_teacher ON t_memberorderteacher.teacherId=t_teacher.teacherId "
				+ " WHERE t_memberorderteacher.teacherId=?"
				+ " ORDER BY t_memberorderteacher.publicTime DESC";

		RowMapper<MemberOrderTeacher> rowMapper = new BeanPropertyRowMapper<MemberOrderTeacher>(
				MemberOrderTeacher.class);

		List<MemberOrderTeacher> memberOrderTeacherList = jdbcTemplate.query(
				sql, rowMapper, teacherId);

		return memberOrderTeacherList;
	}
}
