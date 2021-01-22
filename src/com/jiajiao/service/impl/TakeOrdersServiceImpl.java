package com.jiajiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.TakeOrders;
import com.jiajiao.bean.Teacher;
import com.jiajiao.dao.OrdersDao;
import com.jiajiao.dao.TakeOrdersDao;
import com.jiajiao.dao.TeacherDao;
import com.jiajiao.service.TakeOrdersService;

@Service("takeOrdersService")
@Transactional
public class TakeOrdersServiceImpl implements TakeOrdersService {

	@Resource
	private TakeOrdersDao takeOrdersDao;

	@Resource
	private OrdersDao ordersDao;

	@Resource
	private TeacherDao teacherDao;

	/*
	 * 教员预约家教订单
	 */
	@Override
	public Map<String, Object> takeOrder(TakeOrders takeOrders) {

		Map<String, Object> map = new HashMap<String, Object>();

		// 判断是否该教员已经预约该订单
		int row = 0;

		row = takeOrdersDao.calTakeOrderNum(takeOrders.getTeacherId());

		if (row >= 5) {
			map.put("success", false);
			map.put("message", "预约次数过多！请等待客服电话");
			return map;
		}

		row = takeOrdersDao.isTakeOrderByOId(takeOrders.getTeacherId(),
				takeOrders.getoId());

		if (row != 0) {
			// 该教员已经预约该订单
			map.put("success", true);
			map.put("message", "您已成功预约此家教！请等待客服电话");
			return map;
		}

		row = takeOrdersDao.insert(takeOrders);

		if (row != 0) {
			map.put("success", true);
			map.put("message", "您已成功预约此家教！请等待客服电话");
			return map;
		} else {
			map.put("success", false);
			map.put("message", "预约失败，请重新预约！");
			return map;
		}

	}

	@Override
	public List<TakeOrders> findTakeOrdersListByTeacherId(int teacherId) {

		return takeOrdersDao.findTakeOrdersListByTeacherId(teacherId);
	}

	@Override
	public List<TakeOrders> findAllTakeOrder() {

		return takeOrdersDao.findAllTakeOrder();
	}

	@Override
	public TakeOrders findTakeOrderBytoId(int id) {
		return takeOrdersDao.findTakeOrderBytoId(id);
	}

	@Override
	public int updateTakeOrderInfo(TakeOrders takeOrders) {

		int row = 0;
		row = takeOrdersDao.updateTakeOrderInfo(takeOrders);

		if (row != 0) {
			int takeStatus = takeOrders.getTakeStatus();

			if (takeStatus == 2) {
				// 接单状态为2已支付，修改订单状态为23教员申请中
				row = ordersDao.updateStatusByoId(takeOrders.getoId(), 23);
			} else if (takeStatus == 3) {
				// 接单状态为3试授课中，修改订单状态为24试授课中
				row = ordersDao.updateStatusByoId(takeOrders.getoId(), 24);
			} else if (takeStatus == 4) {
				// 接单状态为4已完成，修改订单状态为25已完成
				row = ordersDao.updateStatusByoId(takeOrders.getoId(), 25);
			} else if (takeStatus == 5) {
				// 接单状态为5退款中，修改订单状态为22发布中
				row = ordersDao.updateStatusByoId(takeOrders.getoId(), 22);
			} else if (takeStatus == 6) {
				// 接单状态为6预约失败，修改订单状态为22发布中
				row = ordersDao.updateStatusByoId(takeOrders.getoId(), 22);
			}
		}

		return row;
	}

	@Override
	public Map<String, Object> sendOrder(TakeOrders takeOrders,
			String teacherName) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;

		int teacherId = takeOrders.getTeacherId();
		// 1.判断该教员编号是否存在
		// 2.该教员编号下的教员姓名是否与输入的姓名一致
		Teacher teacher = teacherDao.findByTeacherId(teacherId);

		if (teacher != null) {

			if (teacher.getTeacherName().equals(teacherName)) {

				row = takeOrdersDao.insert(takeOrders);
				if (row != 0) {

					map.put("success", true);
					map.put("message", "派单成功");
				} else {
					map.put("success", false);
					map.put("message", "派单失败");
				}

			} else {
				map.put("success", false);
				map.put("message", "教员编号与教员姓名不一致");
			}

		} else {
			map.put("success", false);
			map.put("message", "教员编号不存在");
		}

		return map;
	}

	@Override
	public List<TakeOrders> findTakeOrderListByOId(int id) {

		return takeOrdersDao.findTakeOrderListByOId(id);
	}
}
