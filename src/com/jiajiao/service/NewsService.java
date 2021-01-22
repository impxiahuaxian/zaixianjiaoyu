package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.News;

public interface NewsService {

	public Map<String, Object> pubNews(News news);

	public List<News> findTopEightNewsByDegree(int nId);

	public News findBynId(int nId);

	public List<News> PageFindNewsBydegree(int degree, int pageSize,
			int currentPage);

	public int pagefindAllNewsListCoutByGrade(int degree);

	public List<News> findTopTenNews();

	public List<News> findNewsByDegree(int degree);

	public int updateNews(News news);

	public int changeNewsDisplay(int id, int display);

	public List<News> findTopSixNews();

	public List<News> findTopFiveNews();

	public List<News> pageFindNewsListByDegree(int degree, int pageSize,
			Integer pageNo);

}
