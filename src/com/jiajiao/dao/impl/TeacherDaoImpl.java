package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Teacher;
import com.jiajiao.dao.TeacherDao;

@Repository("teacherDao")
public class TeacherDaoImpl implements TeacherDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	public List<Teacher> findTeacherListByKeMuDaLei(String keMuDaLei) {

		return null;
	}

	@Override
	public List<Teacher> findTeacherListIsZhongXiaoXue(int isMobile) {

		String sql = " SELECT teacherId,teacherName,gender,teachingAge,personImg,b.content as educationName,selfEvaluation "
				+ " FROM  t_teacher a,t_dictinfo b "
				+ " WHERE ( FIND_IN_SET('1',a.keMuDaLei) OR  FIND_IN_SET('2',a.keMuDaLei) "
				+ " OR  FIND_IN_SET('3',a.keMuDaLei) OR  FIND_IN_SET('4',a.keMuDaLei)) "
				+ " AND a.education=b.dictId  AND a.isUse=1 And a.isCheck=1 "
				+ " ORDER BY lastLoginTime DESC ";

		if (isMobile == 1) {
			sql += " LIMIT 0,8 ";
		} else {
			sql += " LIMIT 0,6 ";
		}

		RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
				Teacher.class);

		List<Teacher> teacherList = jdbcTemplate.query(sql, rowMapper);

		return teacherList;
	}

	@Override
	public List<Teacher> findTeacherListIsYueQi(int isMobile) {
		String sql = " SELECT teacherId,teacherName,gender,teachingAge,personImg,b.content as educationName,selfEvaluation "
				+ " FROM t_teacher a,t_dictinfo b "
				+ " WHERE  FIND_IN_SET('6',a.keMuDaLei) AND a.education=b.dictId  AND a.isUse=1  And a.isCheck=1 "
				+ " ORDER BY lastLoginTime DESC ";

		if (isMobile == 1) {
			sql += " LIMIT 0,8 ";
		} else {
			sql += " LIMIT 0,6 ";
		}

		RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
				Teacher.class);

		List<Teacher> teacherList = jdbcTemplate.query(sql, rowMapper);

		return teacherList;
	}

	@Override
	public List<Teacher> findTeacherListIsQiLei(int isMobile) {
		String sql = " SELECT teacherId,teacherName,gender,teachingAge,personImg,b.content as educationName,selfEvaluation "
				+ " FROM t_teacher a,t_dictinfo b "
				+ " WHERE  FIND_IN_SET('7',a.keMuDaLei) AND a.education=b.dictId  AND a.isUse=1  And a.isCheck=1 "
				+ " ORDER BY lastLoginTime DESC ";

		if (isMobile == 1) {
			sql += " LIMIT 0,8 ";
		} else {
			sql += " LIMIT 0,6 ";
		}

		RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
				Teacher.class);

		List<Teacher> teacherList = jdbcTemplate.query(sql, rowMapper);

		return teacherList;
	}

	@Override
	public Teacher findByPhone(String phone) {

		String sql = " SELECT teacherId,teacherName,phone,wxNumber,gender,coursePrice,personImg,birthday,province,  "
				+ " education,c.content as educationName,identity,d.content as identityName,lastLoginTime,professional,school,areaId,district as area,address,teachingWay,teachingTime, "
				+ " keMuXiaoLei,keMuDaLei,teachingCource,teachingArea,certificate,selfEvaluation,teachingCase, "
				+ " idPhoto,teachingAge,teacherType,isCheck,isUse "
				+ " FROM t_teacher a "
				+ " LEFT JOIN t_district b ON a.areaId=b.districtId "
				+ " LEFT JOIN t_dictinfo c ON a.education=c.dictId "
				+ " LEFT JOIN t_dictinfo d ON a.identity=d.dictId "
				+ " WHERE a.phone=? AND a.isUse=1 ";

		try {
			RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
					Teacher.class);
			Teacher teacher = jdbcTemplate
					.queryForObject(sql, rowMapper, phone);

			return teacher;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int insertByPhoneAndPwd(String phone, String pwd) {

		String sql = "insert into t_teacher(phone,password,registTime,isCheck,isUse) value(?,?,now(),?,?)";

		int rows = jdbcTemplate.update(sql, phone, pwd, 0, 1);

		return rows;
	}

	@Override
	public Teacher findByPhoneAndPwd(String phone, String pwd) {

		String sql = " SELECT teacherId,teacherName,phone,password,wxNumber,gender,coursePrice,personImg,birthday,province,  "
				+ " education,c.content as educationName,identity,d.content as identityName,lastLoginTime,professional,school,areaId,district as area,address,teachingWay,teachingTime, "
				+ " keMuXiaoLei,keMuDaLei,teachingCource,teachingArea,certificate,selfEvaluation,teachingCase, "
				+ " idPhoto,teachingAge,teacherType,isCheck,isUse "
				+ " FROM t_teacher a "
				+ " LEFT JOIN t_district b ON a.areaId=b.districtId "
				+ " LEFT JOIN t_dictinfo c ON a.education=c.dictId "
				+ " LEFT JOIN t_dictinfo d ON a.identity=d.dictId "
				+ " WHERE a.phone=? And password=? ";

		try {
			RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
					Teacher.class);
			Teacher teacher = jdbcTemplate.queryForObject(sql, rowMapper,
					phone, pwd);

			return teacher;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int updateLastLoginTimeByPhone(String phone) {

		String sql = "update t_teacher set lastLoginTime=now() where phone=?";

		int row = jdbcTemplate.update(sql, new Object[] { phone });

		return row;

	}

	@Override
	public int updateTeacher(Teacher teacher) {
		String sql = "UPDATE t_teacher "
				+ " SET teacherType=?,teacherName=?,gender=?,birthday=?,province=?,wxNumber=?,areaId=?,address=?,education=?, "
				+ " school=?,professional=?,identity=?,teachingArea=?,teachingCource=?,teachingTime=?,coursePrice=?, "
				+ " teachingWay=?,certificate=?,teachingAge=?,teachingCase=?,selfEvaluation=?,keMuXiaoLei=?,keMuDaLei=? "
				+ " WHERE t_teacher.teacherId=?";

		int row = jdbcTemplate.update(sql, new Object[] {
				teacher.getTeacherType(), teacher.getTeacherName(),
				teacher.getGender(), teacher.getBirthday(),
				teacher.getProvince(), teacher.getWxNumber(),
				teacher.getAreaId(), teacher.getAddress(),
				teacher.getEducation(), teacher.getSchool(),
				teacher.getProfessional(), teacher.getIdentity(),
				teacher.getTeachingArea(), teacher.getTeachingCource(),
				teacher.getTeachingTime(), teacher.getCoursePrice(),
				teacher.getTeachingWay(), teacher.getCertificate(),
				teacher.getTeachingAge(), teacher.getTeachingCase(),
				teacher.getSelfEvaluation(), teacher.getKeMuXiaoLei(),
				teacher.getKeMuDaLei(), teacher.getTeacherId() });

		return row;
	}

	@Override
	public int changePwdByTeacherId(String pwd, int teacherId) {

		String sql = "update t_teacher set password=? where teacherId=?";

		int row = jdbcTemplate.update(sql, new Object[] { pwd, teacherId });

		return row;
	}

	@Override
	public int updatePersonImg(String personImg, int teacherId) {
		String sql = "update t_teacher set personImg=? where teacherId=?";

		int row = jdbcTemplate.update(sql,
				new Object[] { personImg, teacherId });

		return row;
	}

	@Override
	public int PagefindAllTeacherListCout() {

		String sql = "SELECT COUNT(teacherId) FROM t_teacher WHERE t_teacher.isUse=1 AND t_teacher.isCheck=1";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public List<Teacher> PagefindAllTeachersList(int pageSize, int currentPage) {
		int start = (currentPage - 1) * pageSize + 1;

		String sql = "SELECT teacherId,teacherName,identity,c.content as identityName, areaId,b.district as area , "
				+ " teachingAge,teacherType,teachingCource,selfEvaluation,personImg,lastLoginTime "
				+ " FROM t_teacher a  "
				+ " LEFT JOIN t_district b ON a.areaId=b.districtId "
				+ " LEFT JOIN t_dictinfo c ON a.identity=c.dictId "
				+ " WHERE a.isUse=1 AND a.isCheck=1 "
				+ " ORDER BY a.lastLoginTime DESC "
				+ " limit "
				+ (start - 1)
				+ "," + pageSize;

		try {
			RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
					Teacher.class);

			List<Teacher> teacherList = jdbcTemplate.query(sql, rowMapper);

			return teacherList;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public Teacher findByTeacherId(int tId) {

		String sql = " SELECT teacherId,teacherName,phone,wxNumber,gender,province,coursePrice,personImg,birthday, "
				+ " education,a.content as educationName,identity,b.content as identityName,lastLoginTime,professional, "
				+ " school,areaId,district as area,address,teachingWay,teachingTime,teachingCource,teachingArea,certificate, "
				+ " selfEvaluation,teachingCase,teachingAge,isCheck,isUse,idPhoto,registTime,teacherType,keMuXiaoLei,keMuDaLei "
				+ " FROM t_teacher  "
				+ " LEFT JOIN t_dictinfo a ON t_teacher.education=a.dictId "
				+ " LEFT JOIN t_dictinfo b ON t_teacher.identity=b.dictId "
				+ " LEFT JOIN t_district c ON t_teacher.areaId=c.districtId"
				+ " WHERE teacherId=?";

		try {
			RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
					Teacher.class);
			Teacher teacher = jdbcTemplate.queryForObject(sql, rowMapper, tId);

			return teacher;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public List<Teacher> findAllTeacherList() {

		String sql = "SELECT t_teacher.teacherId,teacherName,phone,wxNumber,gender, (CASE areaId WHEN 1 THEN '城厢区'	WHEN 2 THEN '荔城区' WHEN 3 THEN '秀屿区' WHEN 4 THEN '涵江区' WHEN 5 THEN '仙游县'	END) as area,address,identity,t_dictinfo.content as identityName,IFNULL(a.num1,0)+IFNULL(b.num2,0)+IFNULL(c.num3,0) as teachingNum,lastLoginTime,isUse,isCheck "
				+ " FROM t_teacher "
				+ " LEFT JOIN t_dictinfo ON t_teacher.identity=t_dictinfo.dictId "
				+ " LEFT JOIN ( "
				+ "		SELECT t_fastorderteacher.teacherId,COUNT(fotId) num1 "
				+ "		FROM t_fastorderteacher "
				+ "		WHERE t_fastorderteacher.state=3 OR t_fastorderteacher.state=4 OR t_fastorderteacher.state=5 OR t_fastorderteacher.state=6 OR t_fastorderteacher.state=7 "
				+ "		GROUP BY t_fastorderteacher.teacherId "
				+ " )a ON a.teacherId=t_teacher.teacherId "
				+ " LEFT JOIN  "
				+ " ( "
				+ " 	SELECT t_memberorderteacher.teacherId,COUNT(mosId) num2 "
				+ " 	FROM t_memberorderteacher "
				+ " 	WHERE t_memberorderteacher.state=3 OR t_memberorderteacher.state=4 OR t_memberorderteacher.state=5 OR t_memberorderteacher.state=6 OR t_memberorderteacher.state=7 "
				+ " 	GROUP BY t_memberorderteacher.teacherId "
				+ " )b on  b.teacherId=t_teacher.teacherId "
				+ " LEFT JOIN( "
				+ " SELECT t_takeorders.teacherId,COUNT(toId) num3 "
				+ " FROM t_takeorders "
				+ " WHERE t_takeorders.takeStatus =2 OR t_takeorders.takeStatus=3 OR t_takeorders.takeStatus=4 OR t_takeorders.takeStatus=5 OR t_takeorders.takeStatus=6 "
				+ " GROUP BY t_takeorders.teacherId "
				+ " )c ON c.teacherId=t_teacher.teacherId "
				+ " ORDER BY lastLoginTime DESC ";

		try {
			RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
					Teacher.class);

			List<Teacher> teacherList = jdbcTemplate.query(sql, rowMapper);

			return teacherList;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public int changeTeacherUse(int id, int i) {
		String sql = "UPDATE t_Teacher SET isUse=? WHERE teacherId=?";
		int rows = jdbcTemplate.update(sql, i, id);
		return rows;
	}

	@Override
	public int changeTeacherCheck(int id, int i) {
		String sql = "UPDATE t_Teacher SET isCheck=? WHERE teacherId=?";
		int rows = jdbcTemplate.update(sql, i, id);
		return rows;
	}

	@Override
	public int pageFindTeacherListCount(String course, String areaId,
			int teacherType, int gender) {

		String sql = "SELECT COUNT(teacherId) " + "FROM t_teacher  "
				+ "WHERE t_teacher.isUse=1 " + "AND t_teacher.isCheck=1  ";

		if (!"0".equals(course)) {
			sql += "AND FIND_IN_SET(?,t_teacher.keMuXiaoLei) ";
		}
		if (!"0".equals(areaId)) {
			sql += "AND FIND_IN_SET(?,t_teacher.teachingArea) ";
		}
		if (teacherType != 0) {
			sql += "AND teacherType=? ";
		}
		if (gender != 2) {
			sql += "AND gender=? ";
		}

		int count = 0;

		if (!"0".equals(course) && "0".equals(areaId) && teacherType == 0
				&& gender == 2) {
			// 1.course选中 areaId不限 类型不限 性别不限
			count = jdbcTemplate.queryForObject(sql, Integer.class, course);
		} else if (!"0".equals(course) && !"0".equals(areaId)
				&& teacherType == 0 && gender == 2) {
			// 1.course选中 areaId选中 类型不限 性别不限
			count = jdbcTemplate.queryForObject(sql, Integer.class, course,
					areaId);
		} else if (!"0".equals(course) && !"0".equals(areaId)
				&& teacherType != 0 && gender == 2) {
			// 1.course选中 areaId选中 类型选中 性别不限
			count = jdbcTemplate.queryForObject(sql, Integer.class, course,
					areaId, teacherType);
		} else if (!"0".equals(course) && !"0".equals(areaId)
				&& teacherType != 0 && gender != 2) {
			// 1.course选中 areaId选中 类型选中 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class, course,
					areaId, teacherType, gender);
		} else if ("0".equals(course) && !"0".equals(areaId)
				&& teacherType != 0 && gender != 2) {
			// 1.course不限 areaId选中 类型选中 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class, areaId,
					teacherType, gender);
		} else if ("0".equals(course) && "0".equals(areaId) && teacherType != 0
				&& gender != 2) {
			// 1.course不限 areaId不限 类型选中 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class,
					teacherType, gender);
		} else if ("0".equals(course) && "0".equals(areaId) && teacherType == 0
				&& gender != 2) {
			// 1.course不限 areaId不限 类型不限 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class, gender);
		} else if ("0".equals(course) && "0".equals(areaId) && teacherType == 0
				&& gender == 2) {
			// 1.course不限 areaId不限 类型不限 性别不限
			count = jdbcTemplate.queryForObject(sql, Integer.class);
		} else if ("0".equals(course) && !"0".equals(areaId)
				&& teacherType == 0 && gender == 2) {
			// 1.course不限 areaId选中 类型不限 性别不限
			count = jdbcTemplate.queryForObject(sql, Integer.class, areaId);

		} else if ("0".equals(course) && "0".equals(areaId) && teacherType != 0
				&& gender == 2) {
			// 1.course不限 areaId不限 类型选中 性别不限
			count = jdbcTemplate
					.queryForObject(sql, Integer.class, teacherType);

		} else if (!"0".equals(course) && "0".equals(areaId)
				&& teacherType != 0 && gender == 2) {
			// 1.course选中 areaId不限 类型选中 性别不限
			count = jdbcTemplate.queryForObject(sql, Integer.class, course,
					teacherType);

		} else if (!"0".equals(course) && "0".equals(areaId)
				&& teacherType == 0 && gender != 2) {
			// 1.course选中 areaId不限 类型不限 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class, course,
					gender);

		} else if (!"0".equals(course) && !"0".equals(areaId)
				&& teacherType == 0 && gender != 2) {
			// 1.course选中 areaId选中 类型不限 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class, course,
					areaId, gender);

		} else if ("0".equals(course) && !"0".equals(areaId)
				&& teacherType != 0 && gender == 2) {
			// 1.course不限 areaId选中 类型选中 性别不限
			count = jdbcTemplate.queryForObject(sql, Integer.class, areaId,
					teacherType);

		} else if ("0".equals(course) && !"0".equals(areaId)
				&& teacherType == 0 && gender != 2) {
			// 1.course不限 areaId选中 类型不限 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class, areaId,
					gender);

		} else if (!"0".equals(course) && !"0".equals(areaId)
				&& teacherType != 0 && gender != 2) {
			// 1.course选中 areaId选中 类型选中 性别选中
			count = jdbcTemplate.queryForObject(sql, Integer.class, course,
					areaId, teacherType, gender);

		}

		return count;
	}

	@Override
	public List<Teacher> PagefindTeachersList(String course, String areaId,
			int teacherType, int gender, int pageSize, int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;

		String sql = "SELECT teacherId,teacherName,identity,c.content as identityName, areaId,b.district as area , "
				+ " teachingAge,teacherType,teachingCource,selfEvaluation,personImg,lastLoginTime "
				+ " FROM t_teacher a  "
				+ " LEFT JOIN t_district b ON a.areaId=b.districtId "
				+ " LEFT JOIN t_dictinfo c ON a.identity=c.dictId "
				+ " WHERE a.isUse=1 AND a.isCheck=1 ";

		if (!"0".equals(course)) {
			sql += "AND FIND_IN_SET(?,a.keMuXiaoLei) ";
		}
		if (!"0".equals(areaId)) {
			sql += "AND FIND_IN_SET(?,a.teachingArea) ";
		}
		if (teacherType != 0) {
			sql += "AND teacherType=? ";
		}
		if (gender != 2) {
			sql += "AND gender=? ";
		}

		sql += " ORDER BY a.lastLoginTime DESC " + " limit " + (start - 1)
				+ "," + pageSize;

		List<Teacher> teacherList = null;

		try {
			RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
					Teacher.class);

			if (!"0".equals(course) && "0".equals(areaId) && teacherType == 0
					&& gender == 2) {
				// 1.course选中 areaId不限 类型不限 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, course);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course选中 areaId选中 类型不限 性别不限
				teacherList = jdbcTemplate
						.query(sql, rowMapper, course, areaId);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course选中 areaId选中 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, teacherType);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, teacherType, gender);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course不限 areaId选中 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType, gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course不限 areaId不限 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, teacherType,
						gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course不限 areaId不限 类型不限 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course不限 areaId不限 类型不限 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course不限 areaId选中 类型不限 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, areaId);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course不限 areaId不限 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, teacherType);

			} else if (!"0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course选中 areaId不限 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						teacherType);

			} else if (!"0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course选中 areaId不限 类型不限 性别选中
				teacherList = jdbcTemplate
						.query(sql, rowMapper, course, gender);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course选中 areaId选中 类型不限 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, gender);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course不限 areaId选中 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course不限 areaId选中 类型不限 性别选中
				teacherList = jdbcTemplate
						.query(sql, rowMapper, areaId, gender);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, teacherType, gender);
			}

			return teacherList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int updateIDImg(String idPhoto, int teacherId) {
		String sql = "update t_teacher set idPhoto=? where teacherId=?";

		int row = jdbcTemplate.update(sql, new Object[] { idPhoto, teacherId });

		return row;
	}

	@Override
	public int countTeacherTotal() {
		String sql = "SELECT COUNT(teacherId) FROM t_teacher ";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int calSuccessJJ(int tId) {
		String sql = "SELECT num1+num2 as successjj "
				+ " FROM "
				+ " (SELECT COUNT(teacherId) num1 FROM t_takeorders WHERE teacherId=? AND takeStatus IN(2,3,4) )a , "
				+ " (SELECT COUNT(teacherId) num2 FROM t_memberorderteacher WHERE teacherId=? AND state IN(2,3,4) )b ";

		int count = jdbcTemplate.queryForObject(sql, Integer.class, tId, tId);
		return count;
	}

	@Override
	public int countBanTeacherTotal() {
		String sql = "SELECT COUNT(teacherId) FROM t_teacher WHERE isUse=0";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int countPendingTeacherTotal() {
		String sql = "SELECT COUNT(teacherId) FROM t_teacher WHERE isCheck=0";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public List<Teacher> pagefindTeachersListByCondition(String course,
			String areaId, int teacherType, int gender, int pageSize,
			int currentPage) {
		int start = (currentPage - 1) * pageSize + 1;

		String sql = "SELECT teacherId,teacherName,identity,c.content as identityName, areaId,b.district as area , "
				+ " teachingAge,teacherType,teachingCource,selfEvaluation,personImg,lastLoginTime,school,gender "
				+ " FROM t_teacher a  "
				+ " LEFT JOIN t_district b ON a.areaId=b.districtId "
				+ " LEFT JOIN t_dictinfo c ON a.identity=c.dictId "
				+ " WHERE a.isUse=1 AND a.isCheck=1 ";

		if (!"0".equals(course)) {
			sql += "AND FIND_IN_SET(?,a.teachingCource) ";
		}
		if (!"0".equals(areaId)) {
			sql += "AND FIND_IN_SET(?,a.teachingArea) ";
		}
		if (teacherType != 0) {
			sql += "AND teacherType=? ";
		}
		if (gender != 2) {
			sql += "AND gender=? ";
		}

		sql += " ORDER BY a.lastLoginTime DESC " + " limit " + (start - 1)
				+ "," + pageSize;

		List<Teacher> teacherList = null;

		try {
			RowMapper<Teacher> rowMapper = new BeanPropertyRowMapper<Teacher>(
					Teacher.class);

			if (!"0".equals(course) && "0".equals(areaId) && teacherType == 0
					&& gender == 2) {
				// 1.course选中 areaId不限 类型不限 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, course);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course选中 areaId选中 类型不限 性别不限
				teacherList = jdbcTemplate
						.query(sql, rowMapper, course, areaId);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course选中 areaId选中 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, teacherType);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, teacherType, gender);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course不限 areaId选中 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType, gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course不限 areaId不限 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, teacherType,
						gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course不限 areaId不限 类型不限 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course不限 areaId不限 类型不限 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course不限 areaId选中 类型不限 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, areaId);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course不限 areaId不限 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, teacherType);

			} else if (!"0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course选中 areaId不限 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						teacherType);

			} else if (!"0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course选中 areaId不限 类型不限 性别选中
				teacherList = jdbcTemplate
						.query(sql, rowMapper, course, gender);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course选中 areaId选中 类型不限 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, gender);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course不限 areaId选中 类型选中 性别不限
				teacherList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course不限 areaId选中 类型不限 性别选中
				teacherList = jdbcTemplate
						.query(sql, rowMapper, areaId, gender);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				teacherList = jdbcTemplate.query(sql, rowMapper, course,
						areaId, teacherType, gender);
			}

			return teacherList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int insertByPhoneAndPwd(String mobile, String pwd, String teacherType) {
		String sql = "insert into t_teacher(phone,password,registTime,isCheck,isUse,teacherType) value(?,?,now(),?,?,?)";

		int rows = jdbcTemplate.update(sql, mobile, pwd, 0, 1, teacherType);

		return rows;
	}

	@Override
	public int mUpdatePersonal(Teacher teacher) {

		String sql = "UPDATE t_teacher SET teacherName=?,gender=?,wxNumber=?,birthday=?,province=?,areaId=?,address=? where teacherId=?";

		int rows = jdbcTemplate.update(sql, new Object[] {
				teacher.getTeacherName(), teacher.getGender(),
				teacher.getWxNumber(), teacher.getBirthday(),
				teacher.getProvince(), teacher.getAreaId(),
				teacher.getAddress(), teacher.getTeacherId() });

		return rows;
	}

	@Override
	public int mUpdateEducate(Teacher teacher) {

		String sql = "UPDATE t_teacher SET school=?,professional=?,education=?,identity=? where teacherId=?";

		int rows = jdbcTemplate.update(sql, new Object[] { teacher.getSchool(),
				teacher.getProfessional(), teacher.getEducation(),
				teacher.getIdentity(), teacher.getTeacherId() });

		return rows;
	}

	@Override
	public int mUpdateTeaching(Teacher teacher) {

		String sql = "UPDATE t_teacher SET teachingArea=?,teachingCource=?,teachingTime=?,coursePrice=?,teachingWay=?,"
				+ "certificate=?,teachingAge=?, teachingCase=?,selfEvaluation=?,keMuXiaoLei=?,keMuDaLei=? where teacherId=?";

		int rows = jdbcTemplate.update(sql, new Object[] {
				teacher.getTeachingArea(), teacher.getTeachingCource(),
				teacher.getTeachingTime(), teacher.getCoursePrice(),
				teacher.getTeachingWay(), teacher.getCertificate(),
				teacher.getTeachingAge(), teacher.getTeachingCase(),
				teacher.getSelfEvaluation(), teacher.getKeMuXiaoLei(),
				teacher.getKeMuDaLei(), teacher.getTeacherId() });

		return rows;
	}
}
