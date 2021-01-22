package com.jiajiao.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Course;
import com.jiajiao.bean.DataDto;
import com.jiajiao.bean.DictInfo;
import com.jiajiao.bean.FastOrderTeacher;
import com.jiajiao.bean.GradePrice;
import com.jiajiao.bean.News;
import com.jiajiao.bean.Paper;
import com.jiajiao.bean.Teacher;
import com.jiajiao.service.CourseService;
import com.jiajiao.service.DictInfoService;
import com.jiajiao.service.FastOrderTeacherService;
import com.jiajiao.service.GradePriceService;
import com.jiajiao.service.NewsService;
import com.jiajiao.service.PaperService;
import com.jiajiao.service.TeacherService;
import com.jiajiao.utils.CommonUtil;

/**
 * 进入手机官网首页
 */
@Controller
public class MobileController {

	@Resource
	private TeacherService teacherService;

	@Resource
	private CourseService courseService;

	@Resource
	private PaperService paperService;

	@Resource
	private NewsService newsService;

	@Resource
	private GradePriceService gradePriceService;

	@Resource
	private DictInfoService dictInfoService;

	@Resource
	private FastOrderTeacherService fastOrderTeacherService;

	@RequestMapping("mobile")
	public ModelAndView mobile(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		System.out.println("进入移动端官网首页：时间（" + df.format(new Date()) + ")IP:"
				+ CommonUtil.getIpAddress(request));

		int ZHONGXIAOXUE = 1;
		int YISHU = 2;
		int QITA = 3;

		List<Course> zhongxiaoxueCourseList = courseService
				.findCourseListByIsMobileAndKemudalei(ZHONGXIAOXUE);

		List<Course> yishuCourseList = courseService
				.findCourseListByIsMobileAndKemudalei(YISHU);

		List<Course> qitaCourseList = courseService
				.findCourseListByIsMobileAndKemudalei(QITA);

		List<Teacher> zhongXiaoXueTeacherList = teacherService
				.findTeacherListIsZhongXiaoXue(1);

		List<Teacher> yueQiTeacherList = teacherService
				.findTeacherListIsYueQi(1);

		List<Teacher> qiLeiTeacherList = teacherService
				.findTeacherListIsQiLei(1);

		// 前5条小学试题
		List<Paper> topFivePrimaryPaperList = paperService
				.findTopFivePaperListByDegree(1);
		// 前5条初中试题
		List<Paper> topFiveJuniorPaperList = paperService
				.findTopFivePaperListByDegree(2);
		// 前5条高中试题
		List<Paper> topFiveHighPaperList = paperService
				.findTopFivePaperListByDegree(3);
		// 前5条教育资讯
		List<News> newsList = newsService.findTopFiveNews();

		modelAndView
				.addObject("zhongxiaoxueCourseList", zhongxiaoxueCourseList);
		modelAndView.addObject("yishuCourseList", yishuCourseList);
		modelAndView.addObject("qitaCourseList", qitaCourseList);

		modelAndView.addObject("zhongXiaoXueTeacherList",
				zhongXiaoXueTeacherList);
		modelAndView.addObject("yueQiTeacherList", yueQiTeacherList);
		modelAndView.addObject("qiLeiTeacherList", qiLeiTeacherList);

		modelAndView.addObject("topFivePrimaryPaperList",
				topFivePrimaryPaperList);
		modelAndView
				.addObject("topFiveJuniorPaperList", topFiveJuniorPaperList);
		modelAndView.addObject("topFiveHighPaperList", topFiveHighPaperList);
		modelAndView.addObject("newsList", newsList);

		modelAndView.setViewName("mobile/index");

		return modelAndView;
	}

	@RequestMapping("mCost")
	public ModelAndView mCost() {
		ModelAndView modelAndView = new ModelAndView();

		List<GradePrice> gradePriceList = gradePriceService
				.findAllCoursePriceList();

		modelAndView.addObject("gradePriceList", gradePriceList);

		modelAndView.setViewName("mobile/cost");

		return modelAndView;
	}

	@RequestMapping("testPage")
	public String index() {

		return "mobile/test";

	}

	/**
	 * 
	 * 查询订单列表
	 * 
	 * 
	 * 
	 * @param model
	 * 
	 * @param openId
	 * 
	 *            用户授权Id
	 * 
	 * @return
	 * 
	 * @throws Exception
	 */

	@RequestMapping(value = { "/query" })
	@ResponseBody
	public Object query(Model model, Integer pageNo) throws Exception {

		System.out.println("pageNo=" + pageNo);

		if (pageNo == null) {

			pageNo = 1;

		}

		List<DataDto> datas = new ArrayList<DataDto>();

		for (int i = pageNo * 15; i < (pageNo + 1) * 15; i++) {

			DataDto data = new DataDto("10000" + i, "10:" + i, "17." + i);

			datas.add(data);

		}

		System.out.println("datas=" + datas);

		return datas;

	}

	@RequestMapping("mFastAppointTeacher")
	public ModelAndView mFastAppointTeacher() {

		ModelAndView modelAndView = new ModelAndView();

		List<DictInfo> kemudaleiList = dictInfoService.findByCode("kemudalei");

		modelAndView.addObject("kemudaleiList", kemudaleiList);

		modelAndView.setViewName("mobile/fastAppointTeacher");

		return modelAndView;
	}

	@RequestMapping("getCourseBykemudalei")
	@ResponseBody
	public List<Course> getCourseBykemudalei(int id) {

		List<Course> courseList = courseService.findCourseBykemudalei(id);

		return courseList;

	}

	@RequestMapping("mFastOrderTeacher")
	@ResponseBody
	public Map<String, Object> fastOrderTeacher(
			FastOrderTeacher fastOrderTeacher, HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();

		String ip = CommonUtil.getIpAddress(request);// 获取客户端ip地址

		fastOrderTeacher.setIp(ip);

		map = fastOrderTeacherService.orderTeacher(fastOrderTeacher);

		return map;
	}

	@RequestMapping("mOrderTeacherSuccess")
	public ModelAndView mOrderTeacherSuccess() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mobile/orderTeacherSuccess");
		return modelAndView;
	}
	
	@RequestMapping("mFocusWeChat")
	public String mFocusWeChat(){
		return "mobile/focusWeChat";
	}

}
