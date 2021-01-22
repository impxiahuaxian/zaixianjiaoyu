package com.jiajiao.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.baidu.ueditor.ActionEnter;
import com.jiajiao.bean.News;
import com.jiajiao.bean.Notice;
import com.jiajiao.bean.Paper;
import com.jiajiao.service.NewsService;
import com.jiajiao.service.NoticeService;
import com.jiajiao.service.PaperService;
import com.jiajiao.utils.PageUtil;

@Controller
@RequestMapping("paper")
public class PaperController {

	@Resource
	private PaperService paperService;

	@Resource
	private NewsService newsService;

	@Resource
	private NoticeService noticeService;

	@RequestMapping("pubPaperPage")
	public ModelAndView pubPaperPage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/publishPaper");

		return modelAndView;
	}

	@RequestMapping(value = "/enter", method = RequestMethod.GET)
	public void enterUE(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setHeader("Content-Type", "text/html");
		String rootPath = request.getSession().getServletContext().getRealPath(
				"/");

		System.out.println(rootPath);
		try {
			String exec = new ActionEnter(request, rootPath).exec();
			PrintWriter writer = response.getWriter();
			writer.write(exec);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("pubPaper")
	@ResponseBody
	public Map<String, Object> pubPaper(Paper paper) {
		Map<String, Object> map = new HashMap<String, Object>();

		map = paperService.pubPaper(paper);

		return map;
	}

	/**
	 * ueditor上传图片的方法
	 * 
	 * @param upfile
	 *            上传图片的文件
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/uploadimage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadNewsImg(
			@RequestParam(value = "upfile", required = false) MultipartFile upfile,
			HttpServletRequest request, HttpServletResponse response) {
		Date date = new Date();
		String upLoadPath = "\\upload\\file\\"
				+ new SimpleDateFormat("yyyy\\MM\\").format(date);
		String path = upLoadPath;
		// 图片后缀
		String last = upfile.getOriginalFilename().substring(
				upfile.getOriginalFilename().lastIndexOf("."),
				upfile.getOriginalFilename().length());

		String uuid = UUID.randomUUID().toString().replace("-", "");
		String fileName = uuid + last;

		File fileT = new File(path, fileName);
		if (!fileT.exists()) {
			fileT.mkdirs();
		}
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			upfile.transferTo(fileT);
		} catch (IllegalStateException e) {
			// logger.error("富文本编辑器图片上传失败，参数异常：" + e);
		} catch (IOException e1) {
			// logger.error("富文本编辑器图片上传失败io异常：" + e1);
		}
		result.put("state", "SUCCESS");
		result.put("url", upLoadPath.replace("\\", "/") + fileName);
		result.put("original", "");
		result.put("type", last);
		result.put("size", upfile.getSize());
		result.put("title", fileName);
		return result;
	}

	/**
	 * ueditor文件上传方法
	 * 
	 * @param upfile
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadFile(
			@RequestParam(value = "upfile", required = false) MultipartFile upfile,
			HttpServletRequest request, HttpServletResponse response) {
		Date date = new Date();
		String upLoadPath = "\\upload\\file\\"
				+ new SimpleDateFormat("yyyy\\MM\\").format(date);
		String path = upLoadPath;
		// 附件后缀
		String last = upfile.getOriginalFilename().substring(
				upfile.getOriginalFilename().lastIndexOf("."),
				upfile.getOriginalFilename().length());

		String uuid = UUID.randomUUID().toString().replace("-", "");
		String fileName = uuid + last;

		File fileT = new File(path, fileName);
		if (!fileT.exists()) {
			fileT.mkdirs();
		}
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			upfile.transferTo(fileT);
		} catch (IllegalStateException e) {
			// logger.error("富文本编辑器文件上传失败，参数异常：" + e);
		} catch (IOException e1) {
			// logger.error("富文本编辑器文件上传失败io异常：" + e1);
		}
		result.put("state", "SUCCESS");
		result.put("url", upLoadPath.replace("\\", "/") + fileName);
		result.put("original", "");
		result.put("type", last);
		result.put("size", upfile.getSize());
		result.put("title", fileName);
		return result;
	}

	@RequestMapping("paperInfo")
	public ModelAndView paperInfo(int pId) {
		ModelAndView modelAndView = new ModelAndView();

		Paper paper = paperService.findPaperInfo(pId);

		// 查找最新的12条通知公告
		List<Notice> noticeList = noticeService.findTopTwelveNotice();

		// 查找最新的10条试题
		List<Paper> topTenPaperList = paperService.findTopTenPaper();

		// 查找最新的10条资讯
		List<News> newsList = newsService.findTopTenNews();

		modelAndView.addObject("paper", paper);
		modelAndView.addObject("topTenPaperList", topTenPaperList);
		modelAndView.addObject("newsList", newsList);
		modelAndView.addObject("noticeList", noticeList);

		modelAndView.setViewName("paperInfo");

		return modelAndView;
	}

	@RequestMapping("paperPage")
	public ModelAndView paperPage() {
		ModelAndView modelAndView = new ModelAndView();

		List<Paper> oneGradePaperList = paperService
				.findTopEightPaperByGrade(1);
		List<Paper> SecondGradePaperList = paperService
				.findTopEightPaperByGrade(2);
		List<Paper> thirdGradePaperList = paperService
				.findTopEightPaperByGrade(3);
		List<Paper> fourthGradePaperList = paperService
				.findTopEightPaperByGrade(4);
		List<Paper> fifthGradePaperList = paperService
				.findTopEightPaperByGrade(5);
		List<Paper> sixthGradePaperList = paperService
				.findTopEightPaperByGrade(6);
		List<Paper> newMoonPaperList = paperService.findTopEightPaperByGrade(7);
		List<Paper> lunarCalendarPaperList = paperService
				.findTopEightPaperByGrade(8);
		List<Paper> gradePaperList = paperService.findTopEightPaperByGrade(9);
		List<Paper> higherPaperList = paperService.findTopEightPaperByGrade(10);
		List<Paper> highPaperList = paperService.findTopEightPaperByGrade(11);
		List<Paper> threePaperList = paperService.findTopEightPaperByGrade(12);

		List<News> primaryNewsList = newsService.findTopEightNewsByDegree(1);
		List<News> juniorNewsList = newsService.findTopEightNewsByDegree(2);
		List<News> highNewsList = newsService.findTopEightNewsByDegree(3);

		modelAndView.addObject("oneGradePaperList", oneGradePaperList);
		modelAndView.addObject("SecondGradePaperList", SecondGradePaperList);
		modelAndView.addObject("thirdGradePaperList", thirdGradePaperList);
		modelAndView.addObject("fourthGradePaperList", fourthGradePaperList);
		modelAndView.addObject("fifthGradePaperList", fifthGradePaperList);
		modelAndView.addObject("sixthGradePaperList", sixthGradePaperList);
		modelAndView.addObject("newMoonPaperList", newMoonPaperList);
		modelAndView
				.addObject("lunarCalendarPaperList", lunarCalendarPaperList);
		modelAndView.addObject("gradePaperList", gradePaperList);
		modelAndView.addObject("higherPaperList", higherPaperList);
		modelAndView.addObject("highPaperList", highPaperList);
		modelAndView.addObject("threePaperList", threePaperList);

		modelAndView.addObject("primaryNewsList", primaryNewsList);
		modelAndView.addObject("juniorNewsList", juniorNewsList);
		modelAndView.addObject("highNewsList", highNewsList);

		modelAndView.setViewName("papers");

		return modelAndView;
	}

	@RequestMapping("primaryPaperList")
	public ModelAndView primaryPaperList(HttpServletRequest request, int grade) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView = conPaperList(request, grade, 0, "primaryPaperList");

		return modelAndView;
	}

	@RequestMapping("juniorPaperList")
	public ModelAndView juniorPaperList(HttpServletRequest request, int grade) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView = conPaperList(request, grade, 0, "juniorPaperList");

		return modelAndView;
	}

	@RequestMapping("highPaperList")
	public ModelAndView highPaperList(HttpServletRequest request, int grade) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView = conPaperList(request, grade, 0, "highPaperList");

		return modelAndView;
	}

	@RequestMapping("conPrimaryPaperList")
	public ModelAndView conPrimaryPaperList(HttpServletRequest request,
			int grade, int course) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView = conPaperList(request, grade, course, "primaryPaperList");

		return modelAndView;
	}

	@RequestMapping("conJuniorPaperList")
	public ModelAndView conJuniorPaperList(HttpServletRequest request,
			int grade, int course) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView = conPaperList(request, grade, course, "juniorPaperList");

		return modelAndView;
	}

	@RequestMapping("conHighPaperList")
	public ModelAndView conHighPaperList(HttpServletRequest request, int grade,
			int course) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView = conPaperList(request, grade, course, "highPaperList");

		return modelAndView;
	}

	public ModelAndView conPaperList(HttpServletRequest request, int grade,
			int course, String viewName) {

		ModelAndView modelAndView = new ModelAndView();

		int pageSize = 18;// 每页显示数目
		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);

		int rsCount = paperService.pageConditionFindAllPaperListCoutByGrade(
				grade, course);// 算出总条数
		util.setRsCount(rsCount);
		util.getPageCount();

		int currentPage = util.getCurrentPage();

		List<Paper> paperList = paperService.pageConditionFindPaperByGrade(
				grade, course, pageSize, currentPage);

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		// 查找最新的12条通知公告
		List<Notice> noticeList = noticeService.findTopTwelveNotice();

		// 查找最新的10条试题
		List<Paper> topTenPaperList = paperService.findTopTenPaper();

		// 查找最新的10条资讯
		List<News> newsList = newsService.findTopTenNews();

		modelAndView.addObject("pageTool", pageTool);
		modelAndView.addObject("paperList", paperList);

		modelAndView.addObject("topTenPaperList", topTenPaperList);
		modelAndView.addObject("newsList", newsList);

		modelAndView.addObject("noticeList", noticeList);

		modelAndView.addObject("grade", grade);
		modelAndView.addObject("course", course);

		modelAndView.setViewName(viewName);

		return modelAndView;
	}

	@RequestMapping("mPaperList")
	public ModelAndView mPaperList(int degree, int grade, int course) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("degree", degree);
		modelAndView.addObject("grade", grade);
		modelAndView.addObject("course", course);

		if (degree == 1) {
			// 小学试题
			modelAndView.setViewName("mobile/primaryPaperList");
		} else if (degree == 2) {
			// 初中试题
			modelAndView.setViewName("mobile/juniorPaperList");
		} else if (degree == 3) {
			// 高中试题
			modelAndView.setViewName("mobile/highPaperList");
		}

		return modelAndView;
	}

	@RequestMapping(value = { "/mPaperListQuery" })
	@ResponseBody
	public Object mPaperListQuery(Model model, int degree, int grade,
			int course, Integer pageNo) throws Exception {

		if (pageNo == null) {

			pageNo = 1;

		}

		int pageSize = 20;

		List<Paper> paperList = paperService.pageFindPaperListByConDition(
				degree, grade, course, pageSize, pageNo);

		return paperList;

	}

	@RequestMapping("mPaperInfo")
	public ModelAndView mPaperInfo(int pId) {

		ModelAndView modelAndView = new ModelAndView();

		Paper paper = paperService.findPaperInfo(pId);

		modelAndView.addObject("paper", paper);

		modelAndView.setViewName("mobile/paperInfo");

		return modelAndView;
	}
}
