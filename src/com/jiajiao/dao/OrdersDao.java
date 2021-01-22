package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.Orders;

public interface OrdersDao {

	public Orders findById(int id);

	public List<Orders> findByStatus(int status);

	/**
	 * 通过订单编号更改订单状态
	 * 
	 * @param oId
	 * @param status
	 * @return
	 */
	public int updateStatusByoId(int oId, int status);

	/**
	 * 新增家教需求订单
	 * 
	 * @param publisher
	 * @param teachingCourse
	 * @param contactName
	 * @param contactPhone
	 * @param contactGender
	 * @param wxNumber
	 * @param studentGender
	 * @param condition
	 * @param areaId
	 * @param address
	 * @param teachingTime
	 * @param courcePrice
	 * @param teachingWay
	 * @param teacherGender
	 * @param teacherType
	 * @param requirements
	 * @param orderStatus
	 * @return
	 */
	public int insertOrder(int publisher1, int publisher2, int teachingCourse,
			String contactName, String contactPhone, int contactGender,
			String wxNumber, int studentGender, int studentGradeId,
			String profile, int areaId, String address, String teachingTime,
			int coursePrice, int teachingWay, int teacherGender,
			int teacherType, String requirements, int orderStatus,
			String orderCode, int gradeId, String lng, String lat);

	public List<Orders> PagefindAllOrdersList(int pageSize, int currentPage);

	public int PagefindAllOrdersListCout();

	public List<Orders> findByMemberId(int memberId);

	public List<Orders> findAllOrderList();

	public int updateOrderInfo(int oId, String contactName,
			String contactPhone, String wxNumber, String remark);

	public List<Orders> pagefindOrdersList(String course, String areaId,
			int teacherType, int gender, int pageSize, int currentPage);

	public int pagefindOrdersListCout(String course, String areaId,
			int teacherType, int gender);

	public int CountOrdersTotal();

	public int CountPriceTotal();

	public int calPerMonthPublishTotal(int memberId);

	public int countPublishingFastOrderTotal();

	public int countPublishingOrderTotal();

	public int countRefunddingOrderTotal();

	public int countAppointmentingOrderTotal();

	public List<Orders> pagefindOrderListByCondition(int courseId, int areaId,
			int teacherType, int gender, int pageSize, int currentPage);

}
