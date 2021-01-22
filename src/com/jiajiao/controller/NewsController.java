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
@RequestMapping("news")
public class NewsController {

	@Resource
	private NewsService newsService;

	@Resource
	private PaperService paperService;

	@Resource
	private NoticeService noticeService;

	@RequestMapping("pubNewsPage")
	public ModelAndView pubNewsPage() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/publishNews");

		return modelAndView;
	}

	@RequestMapping("pubNews")
	@ResponseBody
	public Map<String, Object> pubNews(News news) {
		Map<String, Object> map = new HashMap<String, Object>();

		map = newsService.pubNews(news);

		return map;
	}

	@RequestMapping("newsInfo")
	public ModelAndView newsInfo(int nId) {
		ModelAndView modelAndView = new ModelAndView();

		News news = newsService.findBynId(nId);

		// 查找最新的12条通知公告
		List<Notice> noticeList = noticeService.findTopTwelveNotice();

		// 查找最新的10条试题
		List<Paper> topTenPaperList = paperService.findTopTenPaper();

		// 查找最新的10条资讯
		List<News> newsList = newsService.findTopTenNews();

		modelAndView.addObject("news", news);
		modelAndView.addObject("topTenPaperList", topTenPaperList);
		modelAndView.addObject("newsList", newsList);
		modelAndView.addObject("noticeList", noticeList);

		modelAndView.setViewName("newsInfo");

		return modelAndView;
	}

	@RequestMapping("newsList")
	public ModelAndView newsList(HttpServletRequest request, int degree) {
		ModelAndView modelAndView = new ModelAndView();

		int pageSize = 18;// 每页显示数目
		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);

		int rsCount = newsService.pagefindAllNewsListCoutByGrade(degree);// 算出总条数
		util.setRsCount(rsCount);
		util.getPageCount();

		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		List<News> newsList = newsService.PageFindNewsBydegree(degree,
				pageSize, currentPage);

		modelAndView.addObject("pageTool", pageTool);
		modelAndView.addObject("newsList", newsList);
		if (degree == 1) {
			modelAndView.addObject("newsType", "小学资讯");
		} else if (degree == 2) {
			modelAndView.addObject("newsType", "初中资讯");
		} else if (degree == 3) {
			modelAndView.addObject("newsType", "高中资讯");
		}

		// 查找最新的12条通知公告
		List<Notice> noticeList = noticeService.findTopTwelveNotice();

		// 查找最新的10条试题
		List<Paper> topTenPaperList = paperService.findTopTenPaper();

		// 查找最新的10条资讯
		List<News> topTenNewsList = newsService.findTopTenNews();

		modelAndView.addObject("topTenPaperList", topTenPaperList);
		modelAndView.addObject("topTenNewsList", topTenNewsList);
		modelAndView.addObject("noticeList", noticeList);

		modelAndView.setViewName("newsList");

		return modelAndView;
	}

	@RequestMapping("degreeNewsList")
	public ModelAndView degreeNewsList(int degree) {
		ModelAndView modelAndView = new ModelAndView();

		List<News> newsList = newsService.findNewsByDegree(degree);

		modelAndView.addObject("newsList", newsList);
		if (degree == 1) {
			modelAndView.addObject("degree", "小学");
		} else if (degree == 2) {
			modelAndView.addObject("degree", "初中");
		} else if (degree == 3) {
			modelAndView.addObject("degree", "高中");
		}

		modelAndView.setViewName("admin/newsList");

		return modelAndView;
	}

	@RequestMapping("preUpdateNewsPage")
	public ModelAndView preUpdateNewsPage(int nId) {
		ModelAndView modelAndView = new ModelAndView();

		News news = newsService.findBynId(nId);

		modelAndView.addObject("news", news);

		modelAndView.setViewName("admin/updateNews");

		return modelAndView;
	}

	@RequestMapping("updateNews")
	@ResponseBody
	public Map<String, Object> updateNews(News news) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = newsService.updateNews(news);

		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "修改失败");

		}

		return map;
	}

	@RequestMapping("stopNews")
	@ResponseBody
	public Map<String, Object> stopNews(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = newsService.changeNewsDisplay(id, 0);
		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "操作失败");

		}

		return map;
	}

	@RequestMapping("startNews")
	@ResponseBody
	public Map<String, Object> startNews(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = newsService.changeNewsDisplay(id, 1);
		if (row == 1) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "操作失败");

		}

		return map;
	}

	@RequestMapping("mNewsList")
	public ModelAndView mNewsList(int degree) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("degree", degree);

		modelAndView.setViewName("mobile/newsList");

		return modelAndView;
	}

	@RequestMapping(value = { "/mNewsListQuery" })
	@ResponseBody
	public Object mNewsListQuery(int degree, Integer pageNo) throws Exception {

		if (pageNo == null) {

			pageNo = 1;

		}

		int pageSize = 20;

		List<News> newsList = newsService.pageFindNewsListByDegree(degree,
				pageSize, pageNo);

		return newsList;

	}

	@RequestMapping("mNewsInfo")
	public ModelAndView mNewsInfo(int nId) {

		ModelAndView modelAndView = new ModelAndView();

		News news = newsService.findBynId(nId);

		modelAndView.addObject("news", news);

		modelAndView.setViewName("mobile/newsInfo");

		return modelAndView;
	}
}
