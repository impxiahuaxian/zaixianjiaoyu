package com.jiajiao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.News;
import com.jiajiao.bean.Notice;
import com.jiajiao.bean.Paper;
import com.jiajiao.service.NewsService;
import com.jiajiao.service.NoticeService;
import com.jiajiao.service.PaperService;
import com.jiajiao.utils.PageUtil;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Resource
	private NoticeService noticeService;

	@Resource
	private PaperService paperService;

	@Resource
	private NewsService newsService;

	@RequestMapping("pubNoticePage")
	public ModelAndView pubNoticePage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/publishNotice");

		return modelAndView;
	}

	@RequestMapping("pubNotice")
	@ResponseBody
	public Map<String, Object> pubNotice(Notice notice) {
		Map<String, Object> map = new HashMap<String, Object>();

		map = noticeService.pubNotice(notice);

		return map;
	}

	@RequestMapping("noticeList")
	public ModelAndView noticeList() {
		ModelAndView modelAndView = new ModelAndView();

		List<Notice> noticeList = noticeService.findAllNotice();

		modelAndView.addObject("noticeList", noticeList);

		modelAndView.setViewName("admin/noticeList");

		return modelAndView;
	}

	@RequestMapping("preUpdateNoticePage")
	public ModelAndView preUpdateNoticePage(int nId) {
		ModelAndView modelAndView = new ModelAndView();

		Notice notice = noticeService.findBynId(nId);

		modelAndView.addObject("notice", notice);

		modelAndView.setViewName("admin/updateNotice");

		return modelAndView;
	}

	@RequestMapping("updateNotice")
	@ResponseBody
	public Map<String, Object> updateNotice(Notice notice) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = noticeService.updateNotice(notice);

		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "修改失败");

		}

		return map;
	}

	@RequestMapping("stopNotice")
	@ResponseBody
	public Map<String, Object> stopNotice(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = noticeService.changeNoticeDisplay(id, 0);
		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "操作失败");

		}

		return map;
	}

	@RequestMapping("startNotice")
	@ResponseBody
	public Map<String, Object> startNotice(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = noticeService.changeNoticeDisplay(id, 1);
		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "操作失败");

		}

		return map;
	}

	@RequestMapping("noticeInfo")
	public ModelAndView noticeInfo(int nId) {
		ModelAndView modelAndView = new ModelAndView();

		Notice notice = noticeService.findBynId(nId);

		// 查找最新的12条通知公告
		List<Notice> noticeList = noticeService.findTopTwelveNotice();

		// 查找最新的10条试题
		List<Paper> topTenPaperList = paperService.findTopTenPaper();

		// 查找最新的10条资讯
		List<News> newsList = newsService.findTopTenNews();

		modelAndView.addObject("notice", notice);
		modelAndView.addObject("topTenPaperList", topTenPaperList);
		modelAndView.addObject("newsList", newsList);
		modelAndView.addObject("noticeList", noticeList);

		modelAndView.setViewName("noticeInfo");

		return modelAndView;
	}

	@RequestMapping("conNoticeList")
	public ModelAndView conNoticeList(HttpServletRequest request, int type) {

		ModelAndView modelAndView = new ModelAndView();

		int pageSize = 15;// 每页显示数目
		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);

		int rsCount = noticeService.pageFindAllNoticeListCountByType(type);// 算出总条数
		util.setRsCount(rsCount);
		util.getPageCount();

		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		List<Notice> conNoticeList = noticeService.pageFindAllNoticeListByType(
				type, pageSize, currentPage);

		if (type == 0) {
			modelAndView.addObject("noticeType", "常见问题");
		} else if (type == 1) {
			modelAndView.addObject("noticeType", "通知公告");
		} else if (type == 2) {
			modelAndView.addObject("noticeType", "我是学员");
		} else if (type == 3) {
			modelAndView.addObject("noticeType", "我是教员");
		}

		// 查找最新的12条通知公告
		List<Notice> topTwelveNoticeList = noticeService.findTopTwelveNotice();

		// 查找最新的10条试题
		List<Paper> topTenPaperList = paperService.findTopTenPaper();

		// 查找最新的10条资讯
		List<News> newsList = newsService.findTopTenNews();

		modelAndView.addObject("pageTool", pageTool);
		modelAndView.addObject("conNoticeList", conNoticeList);

		modelAndView.addObject("newsList", newsList);
		modelAndView.addObject("topTenPaperList", topTenPaperList);
		modelAndView.addObject("topTwelveNoticeList", topTwelveNoticeList);

		modelAndView.setViewName("noticeList");

		return modelAndView;
	}

	@RequestMapping("mNoticeList")
	public ModelAndView mNoticeList(int type) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("type", type);

		modelAndView.setViewName("mobile/noticeList");

		return modelAndView;
	}

	@RequestMapping(value = { "/mNoticeListQuery" })
	@ResponseBody
	public Object mNoticeListQuery(int type, Integer pageNo) throws Exception {

		if (pageNo == null) {

			pageNo = 1;

		}

		int pageSize = 20;

		List<Notice> noticeList = noticeService.pageFindNoticeListByType(type,
				pageSize, pageNo);

		return noticeList;

	}

	@RequestMapping("mNoticeInfo")
	public ModelAndView mNoticeInfo(int nId) {

		ModelAndView modelAndView = new ModelAndView();

		Notice notice = noticeService.findBynId(nId);

		modelAndView.addObject("notice", notice);

		modelAndView.setViewName("mobile/noticeInfo");

		return modelAndView;
	}
}
