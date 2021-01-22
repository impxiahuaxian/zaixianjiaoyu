package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.Orders;

public interface OrdersService {

	public List<Orders> findByStatus(int status);

	public Map<String, Object> publishOrders(int publisher1, int publisher2,
			int teachingCourse, String contactName, String contactPhone,
			int contactGender, String wxNumber, int studentGender,
			int studentGradeId, String profile, int areaId, String address,
			String teachingTime, int coursePrice, int teachingWay,
			int teacherGender, int teacherType, String requirements,
			int orderStatus, String lng, String lat);

	public int PagefindAllOrdersListCout();

	public List<Orders> PagefindAllOrdersList(int pageSize, int currentPage);

	public Orders findById(int oId);

	public List<Orders> findByMemberId(int memberId);

	public List<Orders> findAllOrderList();

	public int updateOrderInfo(int oId, String contactName,
			String contactPhone, String wxNumber, String remark);

	public int PagefindOrdersListCout(String course, String areaId,
			int teacherType, int gender);

	public List<Orders> PagefindOrdersList(String course, String areaId,
			int teacherType, int gender, int pageSize, int currentPage);

	public int countOrdersTotal();

	public int countPriceTotal();

	public int countRefunddingOrderTotal();

	public int countPublishingOrderTotal();

	public int countPublishingFastOrderTotal();

	public int countAppointmentingOrderTotal();

	public List<Orders> pagefindOrderListByCondition(int courseId, int areaId,
			int teacherType, int gender, int pageSize, Integer pageNo);

}
