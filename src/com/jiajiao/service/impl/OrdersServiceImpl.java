package com.jiajiao.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.Course;
import com.jiajiao.bean.Orders;
import com.jiajiao.dao.CourseDao;
import com.jiajiao.dao.OrdersDao;
import com.jiajiao.service.OrdersService;

@Service("ordersService")
@Transactional
public class OrdersServiceImpl implements OrdersService {

	@Resource
	private OrdersDao ordersDao;

	@Resource
	private CourseDao courseDao;

	@Override
	public List<Orders> findByStatus(int status) {

		return ordersDao.findByStatus(status);
	}

	@Override
	public Map<String, Object> publishOrders(int publisher1, int publisher2,
			int teachingCourse, String contactName, String contactPhone,
			int contactGender, String wxNumber, int studentGender,
			int studentGradeId, String profile, int areaId, String address,
			String teachingTime, int coursePrice, int teachingWay,
			int teacherGender, int teacherType, String requirements,
			int orderStatus, String lng, String lat) {

		Map<String, Object> map = new HashMap<String, Object>();

		// 查询该学员用户本月发布的家教需求订单数
		int publishTotal = ordersDao.calPerMonthPublishTotal(publisher1);

		if (publishTotal >= 5) {
			map.put("success", false);
			map.put("message", "每月只可发布5条家教需求哦！");
			return map;
		}

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		String orderCode = df.format(new Date());// new
		// Date()为获取当前系统时间，也可使用当前时间戳

		Course course = courseDao.findCourseById(teachingCourse);
		int gradeId = course.getKeMuXiaoLei();

		int row = ordersDao.insertOrder(publisher1, publisher2, teachingCourse,
				contactName, contactPhone, contactGender, wxNumber,
				studentGender, studentGradeId, profile, areaId, address,
				teachingTime, coursePrice, teachingWay, teacherGender,
				teacherType, requirements, orderStatus, orderCode, gradeId,
				lng, lat);

		if (row != 0) {
			map.put("success", true);
			map.put("message", "家教需求发布成功！");

		} else {
			map.put("success", false);
			map.put("message", "家教需求发布失败！");
		}

		return map;

	}

	@Override
	public List<Orders> PagefindAllOrdersList(int pageSize, int currentPage) {
		return ordersDao.PagefindAllOrdersList(pageSize, currentPage);
	}

	@Override
	public int PagefindAllOrdersListCout() {
		return ordersDao.PagefindAllOrdersListCout();
	}

	@Override
	public Orders findById(int oId) {
		return ordersDao.findById(oId);
	}

	@Override
	public List<Orders> findByMemberId(int memberId) {

		return ordersDao.findByMemberId(memberId);
	}

	@Override
	public List<Orders> findAllOrderList() {
		return ordersDao.findAllOrderList();
	}

	@Override
	public int updateOrderInfo(int oId, String contactName,
			String contactPhone, String wxNumber, String remark) {
		return ordersDao.updateOrderInfo(oId, contactName, contactPhone,
				wxNumber, remark);
	}

	@Override
	public List<Orders> PagefindOrdersList(String course, String areaId,
			int teacherType, int gender, int pageSize, int currentPage) {
		return ordersDao.pagefindOrdersList(course, areaId, teacherType,
				gender, pageSize, currentPage);
	}

	@Override
	public int PagefindOrdersListCout(String course, String areaId,
			int teacherType, int gender) {
		return ordersDao.pagefindOrdersListCout(course, areaId, teacherType,
				gender);
	}

	@Override
	public int countOrdersTotal() {

		return ordersDao.CountOrdersTotal();
	}

	@Override
	public int countPriceTotal() {
		return ordersDao.CountPriceTotal();
	}

	@Override
	public int countAppointmentingOrderTotal() {
		return ordersDao.countAppointmentingOrderTotal();
	}

	@Override
	public int countPublishingFastOrderTotal() {
		return ordersDao.countPublishingFastOrderTotal();
	}

	@Override
	public int countPublishingOrderTotal() {
		return ordersDao.countPublishingOrderTotal();
	}

	@Override
	public int countRefunddingOrderTotal() {
		return ordersDao.countRefunddingOrderTotal();
	}

	@Override
	public List<Orders> pagefindOrderListByCondition(int courseId, int areaId,
			int teacherType, int gender, int pageSize, Integer pageNo) {

		return ordersDao.pagefindOrderListByCondition(courseId, areaId,
				teacherType, gender, pageSize, pageNo);
	}

}
