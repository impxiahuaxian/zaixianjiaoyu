package com.jiajiao.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Course;
import com.jiajiao.bean.DictInfo;
import com.jiajiao.bean.Orders;
import com.jiajiao.bean.TakeOrders;
import com.jiajiao.service.CourseService;
import com.jiajiao.service.DictInfoService;
import com.jiajiao.service.OrdersService;
import com.jiajiao.service.TakeOrdersService;

@Controller
@RequestMapping("order")
public class OrderController {

	@Resource
	private OrdersService ordersService;

	@Resource
	private DictInfoService dictInfoService;

	@Resource
	private CourseService courseService;

	@Resource
	private TakeOrdersService takeOrdersService;

	@RequestMapping("orderInfo")
	public ModelAndView orderInfo(int oId) {

		ModelAndView modelAndView = new ModelAndView();

		Orders order = ordersService.findById(oId);

		modelAndView.addObject("order", order);
		modelAndView.setViewName("orderInfo");
		return modelAndView;
	}

	@RequestMapping("mOrderList")
	public ModelAndView mOrderList(int kmdl, int courseId, int areaId,
			int teacherType, int gender, int location) {

		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> kemudaleiList = dictInfoService.findByCode("kemudalei");

		List<Course> courseList = courseService.findAllCourseList();

		modelAndView.addObject("kemudaleiList", kemudaleiList);
		modelAndView.addObject("courseList", courseList);

		modelAndView.addObject("courseId", courseId);
		modelAndView.addObject("areaId", areaId);
		modelAndView.addObject("teacherType", teacherType);
		modelAndView.addObject("gender", gender);
		modelAndView.addObject("kmdl", kmdl);
		modelAndView.addObject("location", location);

		modelAndView.setViewName("mobile/orderList");

		return modelAndView;
	}

	@RequestMapping(value = { "/mOrderListQuery" })
	@ResponseBody
	public Object mTeacherListQuery(int courseId, int areaId, int teacherType,
			int gender, Integer pageNo) throws Exception {

		if (pageNo == null) {

			pageNo = 1;

		}

		int pageSize = 8;

		List<Orders> orderList = ordersService.pagefindOrderListByCondition(
				courseId, areaId, teacherType, gender, pageSize, pageNo);

		return orderList;

	}

	@RequestMapping("mOrderInfo")
	public ModelAndView mOrderInfo(int oId) {
		ModelAndView modelAndView = new ModelAndView();

		Orders order = ordersService.findById(oId);

		modelAndView.addObject("order", order);

		modelAndView.setViewName("mobile/orderInfo");

		return modelAndView;
	}

	@RequestMapping("mAppointOrderInfo")
	public ModelAndView mAppointOrderInfo(int oId, int toid) {
		ModelAndView modelAndView = new ModelAndView();

		Orders order = ordersService.findById(oId);
		TakeOrders takeOrder = takeOrdersService.findTakeOrderBytoId(toid);

		// 判断该接单id下的家教订单id是否是同一个 ，防止前端被修改后直接看到联系人信息
		if (takeOrder.getoId() == order.getoId()) {

			// 还未支付，或者支付状态是退款，订单失败
			if (takeOrder.getTakeStatus() == 1
					|| takeOrder.getTakeStatus() == 5
					|| takeOrder.getTakeStatus() == 6) {
				order.setContactPhone("13********");
				order.setWxNumber("********");
			}
		} else {
			// 不是同一个，直接隐藏联系人信息
			order.setContactPhone("13********");
			order.setWxNumber("********");

		}

		modelAndView.addObject("order", order);
		modelAndView.addObject("price", takeOrder.getCourcePrice());

		modelAndView.setViewName("mobile/appointOrderInfo");

		return modelAndView;
	}

	@RequestMapping("mMap")
	public ModelAndView mMap(String address, String lat, String lng) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("address", address);
		modelAndView.addObject("lat", lat);
		modelAndView.addObject("lng", lng);

		modelAndView.setViewName("mobile/map");

		return modelAndView;
	}

}
