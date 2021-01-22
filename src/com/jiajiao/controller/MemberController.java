package com.jiajiao.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Course;
import com.jiajiao.bean.DictInfo;
import com.jiajiao.bean.District;
import com.jiajiao.bean.Member;
import com.jiajiao.bean.MemberOrderTeacher;
import com.jiajiao.bean.Orders;
import com.jiajiao.bean.Teacher;
import com.jiajiao.service.CourseService;
import com.jiajiao.service.DictInfoService;
import com.jiajiao.service.DistrictService;
import com.jiajiao.service.MemberOrderTeacherService;
import com.jiajiao.service.MemberService;
import com.jiajiao.service.OrdersService;
import com.jiajiao.utils.MD5Utils;
import com.jiajiao.utils.PageUtil;

@Controller
@RequestMapping("member")
public class MemberController {

	@Resource
	private DistrictService districtService;

	@Resource
	private DictInfoService dictInfoService;

	@Resource
	private MemberService memberService;

	@Resource
	private CourseService courseService;

	@Resource
	private OrdersService ordersService;

	@Resource
	private MemberOrderTeacherService memberOrderTeacherService;

	@RequestMapping("index")
	public String indexPage(HttpSession session) {

		return "member/index";
	}

	@RequestMapping("updateMemberPage")
	public ModelAndView updateMemberPage() {

		ModelAndView modelAndView = new ModelAndView();

		List<District> districtList = districtService.findAllDistrictList();

		modelAndView.addObject("districtList", districtList);// 获取区域

		modelAndView.setViewName("member/updateMember");
		return modelAndView;
	}

	@RequestMapping("updatepwdPage")
	public String updatepwdPage() {

		return "member/updatePassword";
	}

	@RequestMapping("updatePassword")
	@ResponseBody
	public Map<String, Object> updatePassword(String password,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");
		if (member != null) {

			int row = memberService.changePasswordByMemberId(MD5Utils
					.MD5(password), member.getMemberId());
			if (row != 0) {
				map.put("success", true);
				map.put("message", "修改成功！");
			} else {
				map.put("success", false);
				map.put("message", "修改失败！");
			}
		} else {
			map.put("success", false);
			map.put("message", "您还未登陆！");
		}

		return map;
	}

	@RequestMapping("updateMember")
	@ResponseBody
	public Map<String, Object> updateMember(String userName, int gender,
			String wexin, int districtId, String address, int memberId,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");
		if (member != null) {

			int row = memberService.updateMemberInfo(userName, gender, wexin,
					districtId, address, memberId);

			if (row != 0) {

				member = memberService.findByPhone(member.getPhone());

				session.setAttribute("member", member);

				map.put("success", true);
				map.put("message", "信息修改成功");
			} else {
				map.put("success", true);
				map.put("message", "信息修改失败");
			}
		} else {
			map.put("success", true);
			map.put("message", "您还未登陆！");
		}

		return map;
	}

	@RequestMapping("publishOrderPage")
	public ModelAndView publishOrderPage() {

		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictList = dictInfoService.findByCode("jiudunianji");// 就读年级
		List<DictInfo> dictInfoKeMuDaLeiList = dictInfoService
				.findByCode("kemudalei");// 科目大类
		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");// 科目小类
		List<District> districtList = districtService.findAllDistrictList();

		List<Course> courseList = courseService.findAllCourseList();

		modelAndView.addObject("dictList", dictList);
		modelAndView.addObject("districtList", districtList);
		modelAndView.addObject("dictInfoKeMuDaLeiList", dictInfoKeMuDaLeiList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);
		modelAndView.addObject("courseList", courseList);

		modelAndView.setViewName("member/publishOrder");

		return modelAndView;
	}

	@RequestMapping("publishOrders")
	@ResponseBody
	public Map<String, Object> publishOrders(int memberId, int grade, int sex,
			String subjectids, String subjectnames, String teachdays,
			int areaid, String teachaddress, String contact, String telephone,
			int contactGender, String wexin, String sturemark,
			String teacherrequire, int coursePrice, int teachersex,
			String classmode, String teachertype, String lng, String lat) {

		Map<String, Object> map = new HashMap<String, Object>();

		int teachingCourse = Integer.parseInt(subjectids);// 课程编号
		int teachingWay = 0;// 授课方式 家教上门或者学生上门都行 不限
		int teacherType = 0;// 大学生或者老师都行 不限

		if (classmode.split(",").length == 2) {
			teachingWay = 0;// 家教上门或者学生上门都行 不限
		} else {
			teachingWay = Integer.parseInt(classmode);
		}

		if (teachertype.split(",").length == 2) {
			teacherType = 0;// 大学生或者老师都行 不限
		} else {
			teacherType = Integer.parseInt(teachertype);
		}

		teachdays = teachdays.substring(0, teachdays.length() - 1);

		// 22 表示状态为发布中
		map = ordersService.publishOrders(memberId, memberId, teachingCourse,
				contact, telephone, contactGender, wexin, sex, grade,
				sturemark, areaid, teachaddress, teachdays, coursePrice,
				teachingWay, teachersex, teacherType, teacherrequire, 22, lng,
				lat);

		return map;
	}

	@RequestMapping("ordersPage")
	public ModelAndView ordersPage(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictInfoList = dictInfoService.findByCode("kemuxiaolei");
		List<District> districtList = districtService.findAllDistrictList();
		modelAndView.addObject("dictInfoList", dictInfoList);
		modelAndView.addObject("districtList", districtList);

		int pageSize = 6;// 每页显示数目
		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);

		int rsCount = ordersService.PagefindAllOrdersListCout();// 算出总条数
		util.setRsCount(rsCount);
		util.getPageCount();

		int currentPage = util.getCurrentPage();

		List<Orders> ordersList = ordersService.PagefindAllOrdersList(pageSize,
				currentPage);

		String pageTool = util.createPageTool(PageUtil.BbsImage);
		modelAndView.addObject("pageTool", pageTool);
		modelAndView.addObject("ordersList", ordersList);

		modelAndView.addObject("course", "0");
		modelAndView.addObject("areaId", "0");
		modelAndView.addObject("teacherType", 0);
		modelAndView.addObject("gender", 2);

		modelAndView.setViewName("orders");

		return modelAndView;
	}

	@RequestMapping("showAppointPop")
	@ResponseBody
	public Map<String, Object> showAppointPop(int teacherId, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");
		// 判断学员是否登录
		if (member == null) {
			map.put("state", 1);
			map.put("message", "您还未登录，请先登录");
			return map;
		}

		int memberId = member.getMemberId();

		map = memberOrderTeacherService.showAppointPop(memberId, teacherId);

		return map;

	}

	@RequestMapping("addAppointTeacher")
	@ResponseBody
	public Map<String, Object> addAppointTeacher(
			MemberOrderTeacher memberOrderTeacher, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");
		// 判断学员是否登录
		if (member == null) {
			map.put("state", 1);
			map.put("message", "您还未登录，请先登录");
			return map;
		}

		memberOrderTeacher.setMemberId(member.getMemberId());

		map = memberOrderTeacherService.addAppointTeacher(memberOrderTeacher);

		return map;
	}

	@RequestMapping("appointList")
	public ModelAndView appointList(HttpServletResponse response,
			HttpSession session) throws IOException {

		ModelAndView modelAndView = new ModelAndView();

		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			modelAndView.setViewName("redirect:/");
			return modelAndView;
		}

		List<MemberOrderTeacher> memberOrderTeacherList = memberOrderTeacherService
				.findMemberOrderTeacherByMemberId(member.getMemberId());

		modelAndView
				.addObject("memberOrderTeacherList", memberOrderTeacherList);

		modelAndView.setViewName("member/appointList");

		return modelAndView;
	}

	@RequestMapping("orderList")
	public ModelAndView orderList(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			modelAndView.setViewName("redirect:/welcome.action");
			return modelAndView;
		}

		List<Orders> orderList = ordersService.findByMemberId(member
				.getMemberId());

		modelAndView.addObject("orderList", orderList);
		modelAndView.setViewName("member/orderList");
		return modelAndView;
	}

	@RequestMapping("orderListPage")
	public ModelAndView orderListPage(String course, String areaId,
			int teacherType, int gender, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictInfoList = dictInfoService.findByCode("kemuxiaolei");
		List<District> districtList = districtService.findAllDistrictList();
		modelAndView.addObject("dictInfoList", dictInfoList);
		modelAndView.addObject("districtList", districtList);

		int pageSize = 6;// 每页显示数目
		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);

		int rsCount = ordersService.PagefindOrdersListCout(course, areaId,
				teacherType, gender);// 算出总条数
		util.setRsCount(rsCount);
		util.getPageCount();

		int currentPage = util.getCurrentPage();

		List<Orders> ordersList = ordersService.PagefindOrdersList(course,
				areaId, teacherType, gender, pageSize, currentPage);

		String pageTool = util.createPageTool(PageUtil.BbsImage);
		modelAndView.addObject("pageTool", pageTool);
		modelAndView.addObject("ordersList", ordersList);

		modelAndView.addObject("course", course);
		modelAndView.addObject("areaId", areaId);
		modelAndView.addObject("teacherType", teacherType);
		modelAndView.addObject("gender", gender);

		modelAndView.setViewName("orders");

		return modelAndView;
	}

	@RequestMapping("mMemberCenterPage")
	public ModelAndView mMemberCenterPage() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/memberCenter");
		return modelAndView;
	}

	@RequestMapping("mMemberInfo")
	public ModelAndView mMemberInfo() {

		ModelAndView modelAndView = new ModelAndView();

		List<District> districtList = districtService.findAllDistrictList();

		modelAndView.addObject("districtList", districtList);// 获取区域

		modelAndView.setViewName("mobile/member/memberInfo");
		return modelAndView;
	}

	@RequestMapping("mUpdateNamePage")
	public ModelAndView mUpdateNamePage() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/member/updateName");
		return modelAndView;
	}

	@RequestMapping("mUpdateName")
	@ResponseBody
	public Map<String, Object> mUpdateName(HttpSession session, String name) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			member.setName(name);

			map = memberService.mUpdateMemberInfo(member);

			if ((Boolean) map.get("success")) {
				session.setAttribute("member", member);
			}
		} else {
			map.put("success", false);
			map.put("message", "您还未登录！");
		}

		return map;
	}

	@RequestMapping("mUpdateAreaPage")
	public ModelAndView mUpdateAreaPage() {

		ModelAndView modelAndView = new ModelAndView();

		List<District> districtList = districtService.findAllDistrictList();

		modelAndView.addObject("districtList", districtList);

		modelAndView.setViewName("mobile/member/updateArea");
		return modelAndView;
	}

	@RequestMapping("mUpdateArea")
	@ResponseBody
	public Map<String, Object> mUpdateArea(HttpSession session, int districtId,
			String districtName) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			member.setDistrictId(districtId);
			member.setDistrict(districtName);

			map = memberService.mUpdateMemberInfo(member);

			if ((Boolean) map.get("success")) {
				session.setAttribute("member", member);
			}
		} else {
			map.put("success", false);
			map.put("message", "您还未登录！");
		}

		return map;
	}

	@RequestMapping("mUpdateAddressPage")
	public ModelAndView mUpdateAddressPage() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/member/updateAddress");
		return modelAndView;
	}

	@RequestMapping("mUpdateAddress")
	@ResponseBody
	public Map<String, Object> mUpdateAddress(HttpSession session,
			String address) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			member.setAddress(address);

			map = memberService.mUpdateMemberInfo(member);

			if ((Boolean) map.get("success")) {
				session.setAttribute("member", member);
			}
		} else {
			map.put("success", false);
			map.put("message", "您还未登录！");
		}

		return map;
	}

	@RequestMapping("mUpdateWxPage")
	public ModelAndView mUpdateWxPage() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/member/updateWx");
		return modelAndView;
	}

	@RequestMapping("mUpdateWx")
	@ResponseBody
	public Map<String, Object> mUpdateWx(HttpSession session, String wxNumber) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			member.setWxNumber(wxNumber);

			map = memberService.mUpdateMemberInfo(member);

			if ((Boolean) map.get("success")) {
				session.setAttribute("member", member);
			}
		} else {
			map.put("success", false);
			map.put("message", "您还未登录！");
		}

		return map;
	}

	@RequestMapping("mUpdatePwdPage")
	public ModelAndView mUpdatePwdPage() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/member/updatePwd");
		return modelAndView;
	}

	@RequestMapping("mUpdatePwd")
	@ResponseBody
	public Map<String, Object> mUpdatePwd(HttpSession session, String password,
			String newPassword) {

		Map<String, Object> map = new HashMap<String, Object>();

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			if (member.getPassword().equals(MD5Utils.MD5(password))) {

				int row = memberService.changePasswordByMemberId(MD5Utils
						.MD5(newPassword), member.getMemberId());
				if (row != 0) {
					map.put("success", true);
					map.put("message", "修改成功！");
					member.setPassword(MD5Utils.MD5(newPassword));
					session.setAttribute("member", member);
				} else {
					map.put("success", false);
					map.put("message", "修改失败！");
				}
			} else {
				map.put("success", false);
				map.put("message", "旧密码错误！");
			}
		} else {
			map.put("success", false);
			map.put("message", "您还未登录！");
		}

		return map;
	}

	@RequestMapping("mAppointTeacherList")
	public ModelAndView mAppointTeacherList(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			modelAndView.setViewName("redirect:/mobile.action");
			return modelAndView;
		} else {

			List<MemberOrderTeacher> memberOrderTeacherList = memberOrderTeacherService
					.findMemberOrderTeacherByMemberId(member.getMemberId());

			List<District> districtList = districtService.findAllDistrictList();

			modelAndView.addObject("memberOrderTeacherList",
					memberOrderTeacherList);
			modelAndView.addObject("districtList", districtList);

			modelAndView.setViewName("mobile/member/appointTeacherList");
			return modelAndView;
		}
	}

	@RequestMapping("mOrderList")
	public ModelAndView mOrderList(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			modelAndView.setViewName("redirect:/mobile.action");
			return modelAndView;
		}

		List<Orders> orderList = ordersService.findByMemberId(member
				.getMemberId());

		modelAndView.addObject("orderList", orderList);
		modelAndView.setViewName("mobile/member/orderList");
		return modelAndView;
	}

	@RequestMapping("mPubOrderPage")
	public ModelAndView mPubOrderPage(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			modelAndView.setViewName("redirect:/mobile.action");
			return modelAndView;
		}
		
		List<Course> courseList = courseService.findAllCourseList();

		List<DictInfo> dictInfoKeMuDaLeiList = dictInfoService
				.findByCode("kemudalei");// 科目大类

		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");// 科目小类

		List<DictInfo> dictInfojiudunianjiliList = dictInfoService
				.findByCode("jiudunianji");// 目前学历

		List<DictInfo> dictInfoshenfenList = dictInfoService
				.findByCode("shenfen");// 身份

		List<DictInfo> shoukefangshiList = dictInfoService
				.findByCode("shoukefangshi");// 授课方式

		List<District> districtList = districtService.findAllDistrictList();

		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("dictInfoKeMuDaLeiList", dictInfoKeMuDaLeiList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);
		modelAndView.addObject("dictInfojiudunianjiliList",
				dictInfojiudunianjiliList);
		modelAndView.addObject("dictInfoshenfenList", dictInfoshenfenList);
		modelAndView.addObject("shoukefangshiList", shoukefangshiList);
		modelAndView.addObject("districtList", districtList);
		modelAndView.setViewName("mobile/member/pubOrder");
		return modelAndView;
	}
}
