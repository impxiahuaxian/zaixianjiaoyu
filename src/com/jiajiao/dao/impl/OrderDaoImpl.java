package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Orders;
import com.jiajiao.dao.OrdersDao;

@Repository("orderDao")
public class OrderDaoImpl implements OrdersDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public Orders findById(int id) {

		String sql = " SELECT a.oId,publisher1,ifnull(publisher2,''),a.teachingCourse,b.courseName,a.contactName, "
				+ " a.contactPhone,a.contactGender,wxNumber,studentGender,studentGradeId,c.content as studentGradeName, "
				+ " a.profile,a.areaId,d.district as area,address,teachingTime,coursePrice,publicTime,teachingWay, "
				+ " (CASE a.teachingWay WHEN 20 THEN	'一对一家教上门'	WHEN 21 THEN '一对一学生上门' ELSE '一对一家教上门、一对一学生上门'	END) as teachingWayName, "
				+ " a.teacherGender,a.teacherType, "
				+ " (CASE a.teacherType WHEN 18 THEN '老师（在职/进修/离职/退休）'	WHEN 19 THEN '在校大学生/毕业生'	ELSE '老师、在校大学生/毕业生' END) as teacherTypeName, "
				+ " a.requirements,a.orderStatus,a.remark,a.orderCode,a.lng,a.lat "
				+ " FROM t_orders a,t_course b,t_dictinfo c,t_district d "
				+ " WHERE a.teachingCourse=b.courseId AND a.studentGradeId=c.dictId AND "
				+ " a.areaId=d.districtId AND oId=?";
		try {
			RowMapper<Orders> rowMapper = new BeanPropertyRowMapper<Orders>(
					Orders.class);
			Orders Orders = jdbcTemplate.queryForObject(sql, rowMapper, id);

			return Orders;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public List<Orders> findByStatus(int status) {

		String sql = " SELECT  a.oId,a.teachingCourse,b.courseName,a.areaId,c.district as area,a.coursePrice,a.teacherType, "
				+ " ( "
				+ " CASE a.teacherType "
				+ "	WHEN 18 THEN '在校大学生/毕业生' "
				+ "	WHEN 19 THEN '老师（在职/进修/离职/退休）' "
				+ "	ELSE '不限' "
				+ "	END "
				+ " ) as teacherTypeName, "
				+ " a.requirements "
				+ " FROM t_orders a,t_course b,t_district c "
				+ " WHERE  a.orderStatus=22 AND a.teachingCourse=b.courseId AND a.areaId=c.districtId "
				+ " ORDER BY publicTime DESC  LIMIT 0,8  ";

		RowMapper<Orders> rowMapper = new BeanPropertyRowMapper<Orders>(
				Orders.class);

		List<Orders> ordersList = jdbcTemplate.query(sql, rowMapper);

		return ordersList;
	}

	@Override
	public int updateStatusByoId(int oId, int status) {
		String sql = "UPDATE t_orders SET orderStatus=? WHERE oId=?";

		int row = jdbcTemplate.update(sql, status, oId);

		return row;
	}

	@Override
	public int insertOrder(int publisher1, int publisher2, int teachingCourse,
			String contactName, String contactPhone, int contactGender,
			String wxNumber, int studentGender, int studentGradeId,
			String profile, int areaId, String address, String teachingTime,
			int coursePrice, int teachingWay, int teacherGender,
			int teacherType, String requirements, int orderStatus,
			String orderCode, int gradeId, String lng, String lat) {

		String sql = "INSERT INTO t_orders(publisher1,publisher2,teachingCourse,contactName,contactPhone,contactGender,wxNumber,"
				+ "studentGender,studentGradeId,profile,areaId,address,teachingTime,coursePrice,teachingWay,teacherGender,"
				+ "teacherType,requirements,orderStatus,publicTime,orderCode,gradeId,lng,lat)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?)";

		int row = jdbcTemplate.update(sql, publisher1, publisher2,
				teachingCourse, contactName, contactPhone, contactGender,
				wxNumber, studentGender, studentGradeId, profile, areaId,
				address, teachingTime, coursePrice, teachingWay, teacherGender,
				teacherType, requirements, orderStatus, orderCode, gradeId,
				lng, lat);

		return row;
	}

	@Override
	public List<Orders> PagefindAllOrdersList(int pageSize, int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;

		String sql = "SELECT a.oId,a.teachingCourse,b.courseName,contactName,contactGender,orderCode, "
				+ " areaId,c.district as area,coursePrice,teacherType,requirements,orderStatus,teachingTime  "
				+ " FROM t_orders a,t_course b,t_district c "
				+ " WHERE a.teachingCourse=b.courseId AND a.areaId=c.districtId "
				+ " ORDER BY publicTime DESC "
				+ " limit "
				+ (start - 1)
				+ ","
				+ pageSize;

		try {
			RowMapper<Orders> rowMapper = new BeanPropertyRowMapper<Orders>(
					Orders.class);

			List<Orders> ordersList = jdbcTemplate.query(sql, rowMapper);

			return ordersList;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public int PagefindAllOrdersListCout() {

		String sql = "SELECT COUNT(oId) FROM t_orders ";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public List<Orders> findByMemberId(int memberId) {

		String sql = "SELECT a.oId, a.orderCode, b.courseName, a.coursePrice, a.publicTime, orderStatus, IFNULL(c.teacherId, '') teacherId, IFNULL(d.teacherName, '') teacherName "+
		" FROM "+
		" 	t_orders a "+
			" LEFT JOIN t_course b ON a.teachingCourse = b.courseId "+
		" LEFT JOIN t_takeorders c ON a.oId = c.oId "+
		" AND c.takeStatus IN (2, 3, 4) "+
		" LEFT JOIN t_teacher d ON c.teacherId = d.teacherId "+
		" WHERE a.publisher1=? " +
		" ORDER BY a.publicTime DESC ";

		try {
			RowMapper<Orders> rowMapper = new BeanPropertyRowMapper<Orders>(
					Orders.class);

			List<Orders> ordersList = jdbcTemplate.query(sql, rowMapper,
					memberId);

			return ordersList;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public List<Orders> findAllOrderList() {

		String sql = "SELECT a.oId,a.orderCode,publisher1,publisher2,a.contactName,a.contactPhone,a.wxNumber,a.areaId,a.address,a.teachingCourse,b.courseName ,a.publicTime,orderStatus,a.remark,IFNULL(c.teacherId,'') teacherId,IFNULL(d.teacherName,'') teacherName "
				+ " FROM t_orders a "
				+ " LEFT JOIN t_course b ON a.teachingCourse=b.courseId "
				+ " LEFT JOIN t_takeorders c ON a.oId=c.oId AND c.takeStatus in(2,3,4) "
				+ " LEFT JOIN t_teacher d ON c.teacherId=d.teacherId "
				+ " ORDER BY a.publicTime DESC ";

		try {
			RowMapper<Orders> rowMapper = new BeanPropertyRowMapper<Orders>(
					Orders.class);

			List<Orders> ordersList = jdbcTemplate.query(sql, rowMapper);

			return ordersList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int updateOrderInfo(int oId, String contactName,
			String contactPhone, String wxNumber, String remark) {

		String sql = "UPDATE t_orders SET contactName=?,contactPhone=?,wxNumber=?,remark=? WHERE oId=?";

		int row = jdbcTemplate.update(sql, contactName, contactPhone, wxNumber,
				remark, oId);

		return row;
	}

	@Override
	public List<Orders> pagefindOrdersList(String course, String areaId,
			int teacherType, int gender, int pageSize, int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;

		String sql = "SELECT a.oId,a.teachingCourse,b.courseName,contactName,contactGender,orderCode, "
				+ " areaId,c.district as area,coursePrice,teacherType,requirements,orderStatus,teachingTime  "
				+ " FROM t_orders a,t_course b,t_district c "
				+ " WHERE a.teachingCourse=b.courseId AND a.areaId=c.districtId ";

		if (!"0".equals(course)) {
			sql += " AND a.gradeId=? ";
		}
		if (!"0".equals(areaId)) {
			sql += " AND a.areaId=? ";
		}
		if (teacherType != 0) {
			sql += " AND a.teacherType=? ";
		}
		if (gender != 2) {
			sql += " AND a.teacherGender=? ";
		}

		sql += " ORDER BY publicTime DESC " + " limit " + (start - 1) + ","
				+ pageSize;

		List<Orders> ordersList = null;

		try {
			RowMapper<Orders> rowMapper = new BeanPropertyRowMapper<Orders>(
					Orders.class);

			if (!"0".equals(course) && "0".equals(areaId) && teacherType == 0
					&& gender == 2) {
				// 1.course选中 areaId不限 类型不限 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper, course);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course选中 areaId选中 类型不限 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper, course, areaId);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course选中 areaId选中 类型选中 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper, course, areaId,
						teacherType);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, course, areaId,
						teacherType, gender);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course不限 areaId选中 类型选中 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType, gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course不限 areaId不限 类型选中 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, teacherType,
						gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course不限 areaId不限 类型不限 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, gender);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course不限 areaId不限 类型不限 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender == 2) {
				// 1.course不限 areaId选中 类型不限 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper, areaId);

			} else if ("0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course不限 areaId不限 类型选中 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper, teacherType);

			} else if (!"0".equals(course) && "0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course选中 areaId不限 类型选中 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper, course,
						teacherType);

			} else if (!"0".equals(course) && "0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course选中 areaId不限 类型不限 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, course, gender);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course选中 areaId选中 类型不限 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, course, areaId,
						gender);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender == 2) {
				// 1.course不限 areaId选中 类型选中 性别不限
				ordersList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType);

			} else if ("0".equals(course) && !"0".equals(areaId)
					&& teacherType == 0 && gender != 2) {
				// 1.course不限 areaId选中 类型不限 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, areaId, gender);

			} else if (!"0".equals(course) && !"0".equals(areaId)
					&& teacherType != 0 && gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				ordersList = jdbcTemplate.query(sql, rowMapper, course, areaId,
						teacherType, gender);
			}

			return ordersList;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public int pagefindOrdersListCout(String course, String areaId,
			int teacherType, int gender) {

		String sql = " SELECT COUNT(oId) " + " FROM t_orders a "
				+ " WHERE 1=1  ";

		if (!"0".equals(course)) {
			sql += " AND a.gradeId=? ";
		}
		if (!"0".equals(areaId)) {
			sql += " AND a.areaId=? ";
		}
		if (teacherType != 0) {
			sql += " AND a.teacherType=? ";
		}
		if (gender != 2) {
			sql += " AND a.teacherGender=? ";
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
	public int CountOrdersTotal() {
		String sql = "SELECT  ocount+mcount as ordersTotal "
				+ "FROM  "
				+ "(SELECT COUNT(oId) as ocount FROM t_orders )a, "
				+ "(SELECT count(mosId) as mcount FROM t_memberorderteacher )b ";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int CountPriceTotal() {
		String sql = "SELECT  sum1+sum2 as priceTotal  "
				+ " FROM  "
				+ "	(SELECT SUM(courcePrice) as sum1 FROM t_takeorders WHERE t_takeorders.takestatus in (2,3,4) )a, "
				+ "	(SELECT SUM(price) as sum2 FROM t_memberorderteacher WHERE t_memberorderteacher.state in (3,4,5) )b  ";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int calPerMonthPublishTotal(int memberId) {

		String sql = "SELECT COUNT(oId) "
				+ "FROM t_orders "
				+ "WHERE t_orders.publisher1=? AND  year(t_orders.publicTime)=year(curdate()) AND  month(curdate())= month(t_orders.publicTime) ";

		int count = jdbcTemplate.queryForObject(sql, Integer.class, memberId);
		return count;

	}

	@Override
	public int countAppointmentingOrderTotal() {
		String sql = "SELECT COUNT(mosId) FROM t_memberorderteacher WHERE state=1";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int countPublishingFastOrderTotal() {
		String sql = "SELECT COUNT(fotId) FROM t_fastorderteacher WHERE state=1";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int countPublishingOrderTotal() {
		String sql = "SELECT COUNT(oId) FROM t_orders WHERE orderStatus=22";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int countRefunddingOrderTotal() {

		String sql = "SELECT  sum1+sum2 as refunddingOrderTota  "
				+ " FROM  "
				+ "	(SELECT COUNT(mosId) sum1 FROM t_memberorderteacher WHERE state=7) a, "
				+ "	(SELECT COUNT(toId) sum2 FROM t_takeorders WHERE takeStatus=5 )b ";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public List<Orders> pagefindOrderListByCondition(int courseId, int areaId,
			int teacherType, int gender, int pageSize, int currentPage) {

		String sql = "SELECT a.oId,a.orderCode,a.areaId,c.district as area, a.contactName,a.teachingCourse,courseName,a.studentGender, "
				+ "a.`profile`,coursePrice,address,orderStatus "
				+ " FROM t_orders a "
				+ " LEFT JOIN t_course b ON a.teachingCourse=b.courseId "
				+ " LEFT JOIN t_district c ON a.areaId=c.districtId "
				+ " WHERE 1=1 AND a.orderStatus IN (22,23,24,25) ";

		int start = (currentPage - 1) * pageSize + 1;

		if (courseId != 0) {
			sql += "AND a.teachingCourse=? ";
		}
		if (areaId != 0) {
			sql += "AND areaId=? ";
		}
		if (teacherType != 0) {
			sql += "AND teacherType=? ";
		}
		if (gender != 2) {
			sql += "AND teacherGender=? ";
		}

		sql += " ORDER BY  a.orderCode DESC " + " limit " + (start - 1) + ","
				+ pageSize;

		List<Orders> orderList = null;

		try {
			RowMapper<Orders> rowMapper = new BeanPropertyRowMapper<Orders>(
					Orders.class);

			if (courseId != 0 && areaId == 0 && teacherType == 0 && gender == 2) {
				// 1.course选中 areaId不限 类型不限 性别不限
				orderList = jdbcTemplate.query(sql, rowMapper, courseId);

			} else if (courseId != 0 && areaId != 0 && teacherType == 0
					&& gender == 2) {
				// 1.course选中 areaId选中 类型不限 性别不限
				orderList = jdbcTemplate
						.query(sql, rowMapper, courseId, areaId);

			} else if (courseId != 0 && areaId != 0 && teacherType != 0
					&& gender == 2) {
				// 1.course选中 areaId选中 类型选中 性别不限
				orderList = jdbcTemplate.query(sql, rowMapper, courseId,
						areaId, teacherType);

			} else if (courseId != 0 && areaId != 0 && teacherType != 0
					&& gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				orderList = jdbcTemplate.query(sql, rowMapper, courseId,
						areaId, teacherType, gender);

			} else if (courseId == 0 && areaId != 0 && teacherType != 0
					&& gender != 2) {
				// 1.course不限 areaId选中 类型选中 性别选中
				orderList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType, gender);

			} else if (courseId == 0 && areaId == 0 && teacherType != 0
					&& gender != 2) {
				// 1.course不限 areaId不限 类型选中 性别选中
				orderList = jdbcTemplate.query(sql, rowMapper, teacherType,
						gender);

			} else if (courseId == 0 && areaId == 0 && teacherType == 0
					&& gender != 2) {
				// 1.course不限 areaId不限 类型不限 性别选中
				orderList = jdbcTemplate.query(sql, rowMapper, gender);

			} else if (courseId == 0 && areaId == 0 && teacherType == 0
					&& gender == 2) {
				// 1.course不限 areaId不限 类型不限 性别不限
				orderList = jdbcTemplate.query(sql, rowMapper);

			} else if (courseId == 0 && areaId != 0 && teacherType == 0
					&& gender == 2) {
				// 1.course不限 areaId选中 类型不限 性别不限
				orderList = jdbcTemplate.query(sql, rowMapper, areaId);

			} else if (courseId == 0 && areaId == 0 && teacherType != 0
					&& gender == 2) {
				// 1.course不限 areaId不限 类型选中 性别不限
				orderList = jdbcTemplate.query(sql, rowMapper, teacherType);

			} else if (courseId != 0 && areaId == 0 && teacherType != 0
					&& gender == 2) {
				// 1.course选中 areaId不限 类型选中 性别不限
				orderList = jdbcTemplate.query(sql, rowMapper, courseId,
						teacherType);

			} else if (courseId != 0 && areaId == 0 && teacherType == 0
					&& gender != 2) {
				// 1.course选中 areaId不限 类型不限 性别选中
				orderList = jdbcTemplate
						.query(sql, rowMapper, courseId, gender);

			} else if (courseId != 0 && areaId != 0 && teacherType == 0
					&& gender != 2) {
				// 1.course选中 areaId选中 类型不限 性别选中
				orderList = jdbcTemplate.query(sql, rowMapper, courseId,
						areaId, gender);

			} else if (courseId == 0 && areaId != 0 && teacherType != 0
					&& gender == 2) {
				// 1.course不限 areaId选中 类型选中 性别不限
				orderList = jdbcTemplate.query(sql, rowMapper, areaId,
						teacherType);

			} else if (courseId == 0 && areaId != 0 && teacherType == 0
					&& gender != 2) {
				// 1.course不限 areaId选中 类型不限 性别选中
				orderList = jdbcTemplate.query(sql, rowMapper, areaId, gender);

			} else if (courseId != 0 && areaId != 0 && teacherType != 0
					&& gender != 2) {
				// 1.course选中 areaId选中 类型选中 性别选中
				orderList = jdbcTemplate.query(sql, rowMapper, courseId,
						areaId, teacherType, gender);
			}

			return orderList;
		} catch (Exception e) {
			return null;
		}

	}

}
