package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.TakeOrders;

public interface TakeOrdersDao {
	public int isTakeOrderByOId(int teacherId, int oId);

	public int insert(TakeOrders takeOrders);

	/**
	 * 查找该教员 接单状态为 待支付的单数 ，超出3单将不予再接单
	 * 
	 * @param teacherId
	 * @return
	 */
	public int calTakeOrderNum(int teacherId);

	public List<TakeOrders> findTakeOrdersListByTeacherId(int teacherId);

	public List<TakeOrders> findAllTakeOrder();

	public TakeOrders findTakeOrderBytoId(int id);

	public int updateTakeOrderInfo(TakeOrders takeOrders);

	public List<TakeOrders> findTakeOrderListByOId(int id);
}
