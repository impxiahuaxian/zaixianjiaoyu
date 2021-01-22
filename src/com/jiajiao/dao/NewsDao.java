package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.News;

public interface NewsDao {

	public int insert(News news);

	public List<News> findTopEightNewsByDegree(int degree);

	public News findBynId(int nId);

	public List<News> PageFindNewsBydegree(int degree, int pageSize,
			int currentPage);

	public int pagefindAllNewsListCoutByGrade(int degree);

	public List<News> findTopTenNews();

	public List<News> findNewsByDegree(int degree);

	public int updateNews(News news);

	public int changeNewsDisplay(int id, int display);

	public List<News> findTopSixNews();

	public int addNewsViewNum(int nId);

	public List<News> findTopFiveNews();

	public List<News> pageFindNewsListByDegree(int degree, int pageSize,
			int pageNo);

}
