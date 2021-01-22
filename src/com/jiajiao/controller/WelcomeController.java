package com.jiajiao.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Course;
import com.jiajiao.bean.DictInfo;
import com.jiajiao.bean.FastOrderTeacher;
import com.jiajiao.bean.GradePrice;
import com.jiajiao.bean.Link;
import com.jiajiao.bean.News;
import com.jiajiao.bean.Notice;
import com.jiajiao.bean.Orders;
import com.jiajiao.bean.Paper;
import com.jiajiao.bean.Teacher;
import com.jiajiao.service.CourseService;
import com.jiajiao.service.DictInfoService;
import com.jiajiao.service.FastOrderTeacherService;
import com.jiajiao.service.GradePriceService;
import com.jiajiao.service.LinkService;
import com.jiajiao.service.NewsService;
import com.jiajiao.service.NoticeService;
import com.jiajiao.service.OrdersService;
import com.jiajiao.service.PaperService;
import com.jiajiao.service.TeacherService;
import com.jiajiao.utils.CommonUtil;

/**
 * 进入官网首页
 */
@Controller
public class WelcomeController {

	@Resource
	private CourseService courseService;

	@Resource
	private DictInfoService dictInfoService;

	@Resource
	private TeacherService teacherService;

	@Resource
	private OrdersService ordersService;

	@Resource
	private GradePriceService gradePriceService;

	@Resource
	private FastOrderTeacherService fastOrderTeacherService;

	@Resource
	private LinkService linkService;

	@Resource
	private PaperService paperService;

	@Resource
	private NewsService newsService;

	@Resource
	private NoticeService noticeService;

	/**
	 * 进入官网首页
	 * 
	 * @return
	 */
	@RequestMapping("/welcome")
	public ModelAndView welcomePage(HttpServletRequest request) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		System.out.println("进入官网首页：时间（" + df.format(new Date()) + ")IP:"
				+ CommonUtil.getIpAddress(request));

		ModelAndView modelAndView = new ModelAndView();

		List<Course> courseList = courseService.findAllCourseList();

		List<DictInfo> dictInfoList = dictInfoService.findByCode("kemudalei");

		List<DictInfo> dictInfoKeMuXiaoLeiList = dictInfoService
				.findByCode("kemuxiaolei");

		List<Teacher> zhongXiaoXueTeacherList = teacherService
				.findTeacherListIsZhongXiaoXue(0);

		List<Teacher> yueQiTeacherList = teacherService
				.findTeacherListIsYueQi(0);

		List<Teacher> qiLeiTeacherList = teacherService
				.findTeacherListIsQiLei(0);

		List<Orders> ordersList = ordersService.findByStatus(22);

		List<Link> linkList = linkService.findDisplayLink();

		List<Paper> paplerTopSixList = paperService.findTopSixPaper();
		List<News> newsTopSixList = newsService.findTopSixNews();

		List<Notice> topFourNoticeTypeFirstList = noticeService
				.findTopFourNoticeByType(1);// 前4条通知公告
		List<Notice> topFourNoticeTypeSecondList = noticeService
				.findTopFourNoticeByType(2);// 前4条学员必读
		List<Notice> topFourNoticeTypeThirdList = noticeService
				.findTopFourNoticeByType(3);// 前4条教员必读

		modelAndView.addObject("courseList", courseList);
		modelAndView.addObject("dictInfoList", dictInfoList);
		modelAndView.addObject("dictInfoKeMuXiaoLeiList",
				dictInfoKeMuXiaoLeiList);
		modelAndView.addObject("zhongXiaoXueTeacherList",
				zhongXiaoXueTeacherList);
		modelAndView.addObject("yueQiTeacherList", yueQiTeacherList);
		modelAndView.addObject("ordersList", ordersList);
		modelAndView.addObject("qiLeiTeacherList", qiLeiTeacherList);
		modelAndView.addObject("linkList", linkList);
		modelAndView.addObject("paplerTopSixList", paplerTopSixList);
		modelAndView.addObject("newsTopSixList", newsTopSixList);
		modelAndView.addObject("topFourNoticeTypeFirstList",
				topFourNoticeTypeFirstList);
		modelAndView.addObject("topFourNoticeTypeSecondList",
				topFourNoticeTypeSecondList);
		modelAndView.addObject("topFourNoticeTypeThirdList",
				topFourNoticeTypeThirdList);

		modelAndView.setViewName("/index");

		return modelAndView;
	}

	@RequestMapping("costPage")
	public ModelAndView costPage() {
		ModelAndView modelAndView = new ModelAndView();
		List<GradePrice> gradePriceList = gradePriceService
				.findAllCoursePriceList();

		modelAndView.addObject("gradePriceList", gradePriceList);
		modelAndView.setViewName("/cost");
		return modelAndView;
	}

	@RequestMapping("fastOrderTeacher")
	@ResponseBody
	public Map<String, Object> fastOrderTeacher(
			FastOrderTeacher fastOrderTeacher, HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();

		String ip = CommonUtil.getIpAddress(request);// 获取客户端ip地址

		fastOrderTeacher.setIp(ip);

		map = fastOrderTeacherService.orderTeacher(fastOrderTeacher);

		return map;
	}

	@RequestMapping("back")
	public String backplatform() {

		return "admin/login";
	}

	@RequestMapping("aboutUs")
	public String aboutUs() {

		return "help/aboutUs";
	}

	@RequestMapping("iammember")
	public String iammeber() {

		return "help/iammember";
	}

	@RequestMapping("iamteacher")
	public String iamteacher() {

		return "help/iamteacher";
	}

	@RequestMapping("disclaimer")
	public String disclaimer() {

		return "help/disclaimer";
	}

	@RequestMapping("announcement")
	public String announcement() {

		return "help/announcement";
	}

	@RequestMapping("link")
	public String link() {

		return "help/link";
	}

}
