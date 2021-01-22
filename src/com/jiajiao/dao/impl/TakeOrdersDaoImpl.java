package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.TakeOrders;
import com.jiajiao.dao.TakeOrdersDao;

@Repository("takeOrdersDao")
public class TakeOrdersDaoImpl implements TakeOrdersDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	/*
	 * 是否该教员已经预约了该订单
	 */
	public int isTakeOrderByOId(int teacherId, int oId) {

		String sql = "SELECT COUNT(toId) FROM t_takeorders WHERE teacherId=? AND oId=?  ";

		int count = jdbcTemplate.queryForObject(sql, new Object[] { teacherId,
				oId }, Integer.class);

		return count;
	}

	public int insert(TakeOrders takeOrders) {
		String sql = "INSERT INTO t_takeorders(oId,memberId,teacherId,takeTime)"
				+ "VALUES(?,?,?,now())";

		int row = jdbcTemplate.update(sql, new Object[] { takeOrders.getoId(),
				takeOrders.getMemberId(), takeOrders.getTeacherId() });

		return row;
	}

	@Override
	public int calTakeOrderNum(int teacherId) {
		String sql = "SELECT COUNT(toId) FROM t_takeorders WHERE teacherId=? AND takeStatus=1  ";

		int count = jdbcTemplate.queryForObject(sql,
				new Object[] { teacherId }, Integer.class);

		return count;
	}

	@Override
	public List<TakeOrders> findTakeOrdersListByTeacherId(int teacherId) {

		String sql = "  SELECT toId,t_takeorders.oId as oId,t_orders.contactName as contactName, "
				+ " t_orders.areaId as areaId,t_orders.address as address,t_course.courseName as courseName, memberId, "
				+ " teacherId,IFNULL(courcePrice,'') courcePrice,takeTime,t_takeorders.remark as remark,takeStatus,t_orders.orderCode as orderCode,t_orders.contactGender as contactGender  "
				+ " FROM t_takeorders  "
				+ " LEFT JOIN t_orders ON t_takeorders.oId=t_orders.oId "
				+ " LEFT JOIN t_course ON t_course.courseId=t_orders.teachingCourse "
				+ " WHERE t_takeorders.teacherId= ? "
				+ " ORDER BY t_takeorders.takeTime desc ";
		try {

			RowMapper<TakeOrders> rowMapper = new BeanPropertyRowMapper<TakeOrders>(
					TakeOrders.class);

			List<TakeOrders> takeOrdersList = jdbcTemplate.query(sql,
					rowMapper, teacherId);
			return takeOrdersList;

		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public List<TakeOrders> findAllTakeOrder() {
		String sql = "SELECT a.toId,b.oId,b.orderCode,IFNULL(c.memberId,0),IFNULL(c.name ,'管理员') contactName,d.teacherId,d.teacherName,e.courseName,b.areaId,b.address,a.takeTime,a.takeStatus,a.remark,a.courcePrice "
				+ " FROM t_takeorders a "
				+ " LEFT JOIN t_orders b ON a.oId=b.oId "
				+ " LEFT JOIN t_member c ON a.memberId=c.memberId "
				+ " LEFT JOIN t_teacher d ON a.teacherId=d.teacherId "
				+ " LEFT JOIN t_course e ON b.teachingCourse=e.courseId  "
				+ " ORDER BY b.orderCode desc,a.takeTime desc ";
		try {

			RowMapper<TakeOrders> rowMapper = new BeanPropertyRowMapper<TakeOrders>(
					TakeOrders.class);

			List<TakeOrders> takeOrdersList = jdbcTemplate
					.query(sql, rowMapper);
			return takeOrdersList;

		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public TakeOrders findTakeOrderBytoId(int id) {
		String sql = "SELECT toId,oId,memberId,teacherId,courcePrice,takeTime,remark,takeStatus  "
				+ "FROM t_takeorders " + "WHERE toId=?";

		try {

			RowMapper<TakeOrders> rowMapper = new BeanPropertyRowMapper<TakeOrders>(
					TakeOrders.class);

			TakeOrders takeOrder = jdbcTemplate.queryForObject(sql, rowMapper,
					id);
			return takeOrder;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int updateTakeOrderInfo(TakeOrders takeOrders) {
		String sql = "UPDATE t_takeorders SET courcePrice=?,takeStatus=?,remark=? WHERE toId=?";

		int row = jdbcTemplate.update(sql, new Object[] {
				takeOrders.getCourcePrice(), takeOrders.getTakeStatus(),
				takeOrders.getRemark(), takeOrders.getToId() });

		return row;
	}

	@Override
	public List<TakeOrders> findTakeOrderListByOId(int id) {
		String sql = "SELECT a.teacherId,b.teacherName as teacherName, courcePrice,takeTime,takeStatus "
				+ " FROM t_takeorders a,t_teacher b "
				+ " WHERE a.teacherId=b.teacherId AND a.oId=?"
				+ " ORDER BY takeTime DESC";
		try {

			RowMapper<TakeOrders> rowMapper = new BeanPropertyRowMapper<TakeOrders>(
					TakeOrders.class);

			List<TakeOrders> takeOrdersList = jdbcTemplate.query(sql,
					rowMapper, id);
			return takeOrdersList;

		} catch (Exception e) {
			return null;
		}
	}
}
