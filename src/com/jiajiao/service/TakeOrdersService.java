package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.TakeOrders;

public interface TakeOrdersService {

	public Map<String, Object> takeOrder(TakeOrders takeOrders);

	public List<TakeOrders> findTakeOrdersListByTeacherId(int teacherId);

	public List<TakeOrders> findAllTakeOrder();

	public TakeOrders findTakeOrderBytoId(int id);

	public int updateTakeOrderInfo(TakeOrders takeOrders);

	public Map<String, Object> sendOrder(TakeOrders takeOrders, String teacherName);

	public List<TakeOrders> findTakeOrderListByOId(int id);

}
