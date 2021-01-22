package com.jiajiao.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Course;
import com.jiajiao.bean.DictInfo;
import com.jiajiao.bean.District;
import com.jiajiao.bean.FastOrderTeacher;
import com.jiajiao.bean.Member;
import com.jiajiao.bean.MemberOrderTeacher;
import com.jiajiao.bean.Orders;
import com.jiajiao.bean.TakeOrders;
import com.jiajiao.bean.Teacher;
import com.jiajiao.service.CourseService;
import com.jiajiao.service.DictInfoService;
import com.jiajiao.service.DistrictService;
import com.jiajiao.service.FastOrderTeacherService;
import com.jiajiao.service.MemberOrderTeacherService;
import com.jiajiao.service.MemberService;
import com.jiajiao.service.OrdersService;
import com.jiajiao.service.TakeOrdersService;
import com.jiajiao.service.TeacherService;
import com.jiajiao.utils.MD5Utils;
import com.jiajiao.utils.PageUtil;

@Controller
@RequestMapping("teacher")
public class TeacherController {

	@Resource
	private TeacherService teacherService;

	@Resource
	private DistrictService districtService;

	@Resource
	private DictInfoService dictInfoService;

	@Resource
	private CourseService courseService;

	@Resource
	private MemberService memberService;

	@Resource
	private MemberOrderTeacherService memberOrderTeacherService;

	@Resource
	private FastOrderTeacherService fastOrderTeacherService;

	@Resource
	private TakeOrdersService takeOrdersService;

	@Resource
	private OrdersService ordersService;

	@RequestMapping("index")
	public String indexPage() {

		return "teacher/index";
	}

	@RequestMapping("updateInfoPage")
	@ResponseBody
	public ModelAndView updateInfoPage() {

		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictInfoKeMuDaLeiList = dictInfoService
				.findByCode("kemudalei");// 科目大类

		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");// 科目小类

		List<DictInfo> dictInfomuqianxueliList = dictInfoService
				.findByCode("muqianxuel");// 目前学历

		List<DictInfo> dictInfoshenfenList = dictInfoService
				.findByCode("shenfen");// 身份

		List<District> districtList = districtService.findAllDistrictList();

		List<Course> courseList = courseService.findAllCourseList();

		modelAndView.addObject("districtList", districtList);
		modelAndView.addObject("dictInfoKeMuDaLeiList", dictInfoKeMuDaLeiList);
		modelAndView.addObject("dictInfomuqianxueliList",
				dictInfomuqianxueliList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);
		modelAndView.addObject("dictInfoshenfenList", dictInfoshenfenList);
		modelAndView.addObject("courseList", courseList);

		modelAndView.setViewName("teacher/updateInfo");

		return modelAndView;

	}

	@RequestMapping("updateInfo")
	@ResponseBody
	public Map<String, Object> updateInfo(Teacher teacher, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Teacher teacherSession = (Teacher) session.getAttribute("teacher");

		if (teacherSession == null) {
			map.put("success", false);
			map.put("message", "您已退出登陆！");
		} else {
			teacher.setTeacherId(teacherSession.getTeacherId());
			teacher.setLastLoginTime(teacherSession.getLastLoginTime());
			teacher.setIsCheck(teacherSession.getIsCheck());
			teacher.setPersonImg(teacherSession.getPersonImg());

			map = teacherService.updateTeacher(teacher);
			Boolean success = (Boolean) map.get("success");
			if (success) {
				session.setAttribute("teacher", teacher);
			}
		}

		return map;

	}

	@RequestMapping("updatePwdPage")
	public String updatepwdPage() {

		return "teacher/updatePassword";
	}

	@RequestMapping("updatePassword")
	@ResponseBody
	public Map<String, Object> updatePassword(String pwd, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = (Teacher) session.getAttribute("teacher");

		if (teacher != null) {

			map = teacherService.changePwd(MD5Utils.MD5(pwd), teacher
					.getTeacherId());
		} else {
			map.put("success", false);
			map.put("message", "您已退出登陆！");
		}

		return map;
	}

	@RequestMapping("personPhotoUpload")
	@ResponseBody
	public Map<String, Object> personPhotoUpload(MultipartFile file,
			HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		map = teacherService.uploadPersonImg(file, request, session);

		return map;

	}

	@RequestMapping("teachersPage")
	public ModelAndView teachersPage(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictInfoList = dictInfoService.findByCode("kemuxiaolei");
		List<District> districtList = districtService.findAllDistrictList();
		List<Course> courseList = courseService.findAllCourseList();
		List<DictInfo> dictInfokemudaleiList = dictInfoService
				.findByCode("kemudalei");
		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");

		modelAndView.addObject("dictInfoList", dictInfoList);
		modelAndView.addObject("districtList", districtList);
		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("dictInfokemudaleiList", dictInfokemudaleiList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);

		int pageSize = 4;// 每页显示数目
		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);

		int rsCount = teacherService.PagefindAllTeacherListCout();// 算出总条数
		util.setRsCount(rsCount);
		util.getPageCount();

		int currentPage = util.getCurrentPage();

		List<Teacher> teacherList = teacherService.PagefindAllTeachersList(
				pageSize, currentPage);

		String pageTool = util.createPageTool(PageUtil.BbsImage);
		modelAndView.addObject("pageTool", pageTool);
		modelAndView.addObject("teacherList", teacherList);

		modelAndView.addObject("course", "0");
		modelAndView.addObject("areaId", "0");
		modelAndView.addObject("teacherType", 0);
		modelAndView.addObject("gender", 2);

		modelAndView.setViewName("teachers");

		return modelAndView;

	}

	@RequestMapping("teacherInfoPage")
	public ModelAndView teacherInfoPage(int tId) {

		ModelAndView modelAndView = new ModelAndView();

		List<Course> courseList = courseService.findAllCourseList();

		Teacher teacherInfo = teacherService.findByTeacherId(tId);

		int successJJ = teacherService.calSuccessJJ(tId);// 成功家教数

		modelAndView.addObject("teacherInfo", teacherInfo);
		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("successJJ", successJJ);
		modelAndView.setViewName("teacherInfo");

		return modelAndView;

	}

	@RequestMapping("appointTeacherList")
	public ModelAndView appointTeacherList(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			modelAndView.setViewName("redirect:/welcome.action");
			return modelAndView;
		} else {

			List<MemberOrderTeacher> memberOrderTeacherList = memberOrderTeacherService
					.findMemberOrderTeacherByTeacherId(teacher.getTeacherId());

			modelAndView.addObject("memberOrderTeacherList",
					memberOrderTeacherList);
			modelAndView.setViewName("teacher/appointTeacherList");
			return modelAndView;
		}
	}

	@RequestMapping("memberOrderTeacherInfo")
	public ModelAndView memberOrderTeacherInfo(int id) {

		ModelAndView modelAndView = new ModelAndView();

		MemberOrderTeacher memberOrderTeacher = memberOrderTeacherService
				.findMemberOrderTeacherByMosId(id);

		Member member = memberService.findByMemberId(memberOrderTeacher
				.getMemberId());

		modelAndView.addObject("memberOrderTeacher", memberOrderTeacher);
		modelAndView.addObject("member", member);
		modelAndView.setViewName("teacher/memberOrderTeacherInfo");
		return modelAndView;
	}

	@RequestMapping("fastAppointTeacherList")
	public ModelAndView fastAppointTeacherList(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			modelAndView.setViewName("redirect:/welcome.action");
			return modelAndView;
		} else {
			List<FastOrderTeacher> fastOrderTeacherList = fastOrderTeacherService
					.findFastOrderTeacherInfoByTeacherId(teacher.getTeacherId());

			modelAndView
					.addObject("fastOrderTeacherList", fastOrderTeacherList);
			modelAndView.setViewName("teacher/fastAppointTeacherList");
			return modelAndView;
		}

	}

	@RequestMapping("fastOrderTeacherInfo")
	public ModelAndView fastOrderTeacherInfo(int id) {
		ModelAndView modelAndView = new ModelAndView();

		FastOrderTeacher fastOrderTeacher = fastOrderTeacherService
				.findFastOrderTeacherInfoByFotId(id);

		modelAndView.addObject("fastOrderTeacher", fastOrderTeacher);
		modelAndView.setViewName("teacher/fastOrderTeacherInfo");

		return modelAndView;
	}

	@RequestMapping("takeOrder")
	@ResponseBody
	public Map<String, Object> takeOrder(TakeOrders takeOrders,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 判断是否有教员登录
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			map.put("success", false);
			map.put("message", "请登录教员账号");
			return map;
		}

		takeOrders.setTeacherId(teacher.getTeacherId());

		map = takeOrdersService.takeOrder(takeOrders);

		return map;
	}

	@RequestMapping("takeOrdersList")
	public ModelAndView takeOrdersList(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		// 判断是否有教员登录
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			modelAndView.setViewName("redirect:/welcome.action");
			return modelAndView;
		} else {
			List<TakeOrders> takeOrdersList = takeOrdersService
					.findTakeOrdersListByTeacherId(teacher.getTeacherId());

			modelAndView.addObject("takeOrdersList", takeOrdersList);

			modelAndView.setViewName("teacher/takeOrdersList");
			return modelAndView;
		}

	}

	@RequestMapping("orderInfo")
	public ModelAndView orderInfo(int id, int toid) {

		ModelAndView modelAndView = new ModelAndView();
		Orders orders = ordersService.findById(id);

		TakeOrders takeOrder = takeOrdersService.findTakeOrderBytoId(toid);

		// 判断该接单id下的家教订单id是否是同一个 ，防止前端被修改后直接看到联系人信息
		if (takeOrder.getoId() == orders.getoId()) {

			// 还未支付，或者支付状态是退款，订单失败
			if (takeOrder.getTakeStatus() == 1
					|| takeOrder.getTakeStatus() == 5
					|| takeOrder.getTakeStatus() == 6) {
				orders.setContactPhone("13********");
				orders.setWxNumber("********");
			}
		} else {
			// 不是同一个，直接隐藏联系人信息
			orders.setContactPhone("13********");
			orders.setWxNumber("********");

		}

		modelAndView.addObject("order", orders);

		modelAndView.setViewName("teacher/orderInfo");

		return modelAndView;
	}

	@RequestMapping("teacherListPage")
	public ModelAndView teacherListPage(String course, String areaId,
			int teacherType, int gender, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> dictInfoList = dictInfoService.findByCode("kemuxiaolei");
		List<District> districtList = districtService.findAllDistrictList();
		List<Course> courseList = courseService.findAllCourseList();
		List<DictInfo> dictInfokemudaleiList = dictInfoService
				.findByCode("kemudalei");
		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");

		modelAndView.addObject("dictInfoList", dictInfoList);
		modelAndView.addObject("districtList", districtList);
		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("dictInfokemudaleiList", dictInfokemudaleiList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);

		int pageSize = 4;// 每页显示数目
		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);

		int rsCount = teacherService.pageFindTeacherListCount(course, areaId,
				teacherType, gender);// 算出总条数
		util.setRsCount(rsCount);
		util.getPageCount();

		int currentPage = util.getCurrentPage();

		List<Teacher> teacherList = teacherService.PagefindTeachersList(course,
				areaId, teacherType, gender, pageSize, currentPage);

		String pageTool = util.createPageTool(PageUtil.BbsImage);
		modelAndView.addObject("pageTool", pageTool);
		modelAndView.addObject("teacherList", teacherList);

		modelAndView.addObject("course", course);
		modelAndView.addObject("areaId", areaId);
		modelAndView.addObject("teacherType", teacherType);
		modelAndView.addObject("gender", gender);

		modelAndView.setViewName("teachers");

		return modelAndView;
	}

	@RequestMapping("idimgPage")
	public ModelAndView idimgPage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("teacher/idimg");
		return modelAndView;
	}

	/*
	 * 采用spring提供的上传文件的方法
	 */
	@RequestMapping("personIDUpload.action")
	public ModelAndView personIDUpload(HttpServletRequest request,
			HttpSession session) throws IllegalStateException, IOException {

		ModelAndView modelAndView = new ModelAndView();

		Map<String, Object> map = teacherService.PersonIDUpload(request,
				session);

		modelAndView.addObject("message", map.get("message"));
		modelAndView.setViewName("teacher/idimg");
		return modelAndView;

	}

	@RequestMapping("mTeacherList")
	public ModelAndView mTeacherList(int kmdl, int courseId, int areaId,
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

		modelAndView.setViewName("mobile/teacherList");

		return modelAndView;
	}

	@RequestMapping(value = { "/mTeacherListQuery" })
	@ResponseBody
	public Object mTeacherListQuery(int courseId, int areaId, int teacherType,
			int gender, Integer pageNo) throws Exception {

		if (pageNo == null) {

			pageNo = 1;

		}

		int pageSize = 8;

		String course = courseId + "";
		String area = areaId + "";
		List<Teacher> teacherList = teacherService
				.pagefindTeachersListByCondition(course, area, teacherType,
						gender, pageSize, pageNo);

		return teacherList;

	}

	@RequestMapping("mTeacherInfo")
	public ModelAndView mTeacherInfo(int tId,int isTeacherCenter) {
		ModelAndView modelAndView = new ModelAndView();

		List<Course> courseList = courseService.findAllCourseList();

		int successJJ = teacherService.calSuccessJJ(tId);// 成功家教数

		Teacher teacher = teacherService.findByTeacherId(tId);

		modelAndView.addObject("teacher", teacher);
		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("successJJ", successJJ);
		modelAndView.addObject("isTeacherCenter", isTeacherCenter);

		modelAndView.setViewName("mobile/teacherInfo");

		return modelAndView;
	}

	@RequestMapping("mTeacherCenterPage")
	public ModelAndView mTeacherCenterPage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/teacherCenter");
		return modelAndView;
	}

	@RequestMapping("mUploadIDPage")
	public ModelAndView mUploadIDPage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/uploadIDImg");
		return modelAndView;
	}

	@RequestMapping("mUpdatePwdPage")
	public ModelAndView mUpdatePwdPage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/updatePwd");
		return modelAndView;
	}

	@RequestMapping("mPersonIDUpload")
	@ResponseBody
	public Map<String, Object> mPersonIDUpload(HttpServletRequest request,
			HttpSession session) throws IllegalStateException, IOException {

		Map<String, Object> map = teacherService.PersonIDUpload(request,
				session);

		return map;

	}

	@RequestMapping("mPersonPhotoUpload")
	@ResponseBody
	public Map<String, Object> mPersonPhotoUpload(MultipartFile file,
			HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		map = teacherService.uploadPersonImg(file, request, session);

		return map;

	}

	@RequestMapping("mUpdatePassword")
	@ResponseBody
	public Map<String, Object> mUpdatePassword(String password,
			String newPassword, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = (Teacher) session.getAttribute("teacher");

		if (teacher != null) {

			if (teacher.getPassword().equals(MD5Utils.MD5(password))) {
				map = teacherService.changePwd(MD5Utils.MD5(newPassword),
						teacher.getTeacherId());
				teacher.setPassword(MD5Utils.MD5(newPassword));
				session.setAttribute("teacher", teacher);

			} else {
				map.put("success", false);
				map.put("message", "旧密码错误！");
			}

		} else {
			map.put("success", false);
			map.put("message", "您已退出登陆！");
		}

		return map;
	}

	@RequestMapping("mUpdateTeacherManage")
	public String mUpdateTeacherManage() {
		return "mobile/updateTeacherManage";
	}

	@RequestMapping("mUpdateTeacherInfoPage")
	public ModelAndView mUpdateTeacherInfoPage() {

		ModelAndView modelAndView = new ModelAndView();
		List<District> districtList = districtService.findAllDistrictList();

		modelAndView.addObject("districtList", districtList);

		modelAndView.setViewName("mobile/updateTeacherInfo");

		return modelAndView;

	}

	@RequestMapping("mUpdatePersonal")
	@ResponseBody
	public Map<String, Object> mUpdatePersonal(Teacher teacher,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Teacher sessionTeacher = (Teacher) session.getAttribute("teacher");

		teacher.setTeacherId(sessionTeacher.getTeacherId());

		map = teacherService.mUpdatePersonal(teacher, session);

		return map;
	}

	@RequestMapping("mUpdateEducatePage")
	public ModelAndView mUpdateEducatePage() {
		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> sfDictList = dictInfoService.findByCode("shenfen");
		List<DictInfo> muqianxueDictList = dictInfoService
				.findByCode("muqianxuel ");

		modelAndView.addObject("sfDictList", sfDictList);
		modelAndView.addObject("muqianxueDictList", muqianxueDictList);

		modelAndView.setViewName("mobile/updateEducate");

		return modelAndView;
	}

	@RequestMapping("mUpdateEducate")
	@ResponseBody
	public Map<String, Object> mUpdateEducate(Teacher teacher,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Teacher sessionTeacher = (Teacher) session.getAttribute("teacher");

		teacher.setTeacherId(sessionTeacher.getTeacherId());

		map = teacherService.mUpdateEducate(teacher, session);

		return map;
	}

	@RequestMapping("mUpdateTeachingPage")
	public ModelAndView mUpdateTeachingPage() {

		ModelAndView modelAndView = new ModelAndView();

		List<Course> courseList = courseService.findAllCourseList();

		List<DictInfo> dictInfoKeMuDaLeiList = dictInfoService
				.findByCode("kemudalei");// 科目大类

		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");// 科目小类

		List<DictInfo> dictInfomuqianxueliList = dictInfoService
				.findByCode("muqianxuel");// 目前学历

		List<DictInfo> dictInfoshenfenList = dictInfoService
				.findByCode("shenfen");// 身份

		List<DictInfo> shoukefangshiList = dictInfoService
				.findByCode("shoukefangshi");// 授课方式

		List<District> districtList = districtService.findAllDistrictList();

		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("dictInfoKeMuDaLeiList", dictInfoKeMuDaLeiList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);
		modelAndView.addObject("dictInfomuqianxueliList",
				dictInfomuqianxueliList);
		modelAndView.addObject("dictInfoshenfenList", dictInfoshenfenList);
		modelAndView.addObject("shoukefangshiList", shoukefangshiList);
		modelAndView.addObject("districtList", districtList);

		modelAndView.setViewName("mobile/updateTeaching");

		return modelAndView;
	}

	@RequestMapping("mUpdateTeaching")
	@ResponseBody
	public Map<String, Object> mUpdateTeaching(Teacher teacher,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Teacher sessionTeacher = (Teacher) session.getAttribute("teacher");

		teacher.setTeacherId(sessionTeacher.getTeacherId());

		map = teacherService.mUpdateTeaching(teacher, session);

		return map;
	}

	@RequestMapping("mTakeOrderListPage")
	public ModelAndView mTakeOrderListPage(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		// 判断是否有教员登录
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			modelAndView.setViewName("redirect:/mobile.action");
			return modelAndView;
		} else {
			List<TakeOrders> takeOrdersList = takeOrdersService
					.findTakeOrdersListByTeacherId(teacher.getTeacherId());

			List<District> districtList = districtService.findAllDistrictList();

			modelAndView.addObject("takeOrdersList", takeOrdersList);
			modelAndView.addObject("districtList", districtList);

			modelAndView.setViewName("mobile/takeOrderList");
			return modelAndView;
		}

	}
	
	@RequestMapping("mAppointTeacherList")
	public ModelAndView mAppointTeacherList(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			modelAndView.setViewName("redirect:/mobile.action");
			return modelAndView;
		} else {

			List<MemberOrderTeacher> memberOrderTeacherList = memberOrderTeacherService
					.findMemberOrderTeacherByTeacherId(teacher.getTeacherId());

			List<District> districtList = districtService.findAllDistrictList();
			
			modelAndView.addObject("memberOrderTeacherList",
					memberOrderTeacherList);
			modelAndView.addObject("districtList", districtList);
			
			modelAndView.setViewName("mobile/appointTeacherList");
			return modelAndView;
		}
	}
	
	@RequestMapping("mAppointTeacherInfo")
	public ModelAndView mAppointTeacherInfo(int mosId, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			modelAndView.setViewName("redirect:/mobile.action");
			return modelAndView;
		} else {

			MemberOrderTeacher memberOrderTeacher = memberOrderTeacherService
					.findMemberOrderTeacherByMosId(mosId);

			Member member = memberService.findByMemberId(memberOrderTeacher
					.getMemberId());

			String phone = "";

			if (member != null) {
				if (memberOrderTeacher.getState() == 1
						|| memberOrderTeacher.getState() == 2
						|| memberOrderTeacher.getState() == 6) {
					phone = "13********";
				} else {
					phone = member.getPhone();
				}
			}

			modelAndView.addObject("memberOrderTeacher", memberOrderTeacher);
			modelAndView.addObject("phone", phone);

			modelAndView.setViewName("mobile/appointTeacherInfo");
		}

		return modelAndView;
	}
}
