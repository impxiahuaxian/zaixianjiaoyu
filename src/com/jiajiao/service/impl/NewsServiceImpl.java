package com.jiajiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.News;
import com.jiajiao.dao.NewsDao;
import com.jiajiao.service.NewsService;

@Service("newsService")
@Transactional
public class NewsServiceImpl implements NewsService {

	@Resource
	private NewsDao newsDao;

	@Override
	public Map<String, Object> pubNews(News news) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = newsDao.insert(news);
		if (row != 0) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "添加失败");

		}

		return map;
	}

	@Override
	public List<News> findTopEightNewsByDegree(int nId) {
		return newsDao.findTopEightNewsByDegree(nId);
	}

	@Override
	public News findBynId(int nId) {

		// 设置该条资讯浏览量增1
		newsDao.addNewsViewNum(nId);

		return newsDao.findBynId(nId);
	}

	@Override
	public List<News> PageFindNewsBydegree(int degree, int pageSize,
			int currentPage) {
		return newsDao.PageFindNewsBydegree(degree, pageSize, currentPage);
	}

	@Override
	public int pagefindAllNewsListCoutByGrade(int degree) {
		return newsDao.pagefindAllNewsListCoutByGrade(degree);
	}

	@Override
	public List<News> findTopTenNews() {
		return newsDao.findTopTenNews();
	}

	@Override
	public List<News> findNewsByDegree(int degree) {
		return newsDao.findNewsByDegree(degree);
	}

	@Override
	public int updateNews(News news) {
		return newsDao.updateNews(news);
	}

	@Override
	public int changeNewsDisplay(int id, int display) {
		return newsDao.changeNewsDisplay(id, display);
	}

	@Override
	public List<News> findTopSixNews() {
		return newsDao.findTopSixNews();
	}

	@Override
	public List<News> findTopFiveNews() {
		return newsDao.findTopFiveNews();
	}

	@Override
	public List<News> pageFindNewsListByDegree(int degree, int pageSize,
			Integer pageNo) {

		return newsDao.pageFindNewsListByDegree(degree, pageSize, pageNo);
	}

}
