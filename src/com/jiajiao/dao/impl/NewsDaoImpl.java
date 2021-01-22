package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.News;
import com.jiajiao.dao.NewsDao;

@Repository("newsDao")
public class NewsDaoImpl implements NewsDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insert(News news) {
		String sql = "INSERT INTO t_news(title,degree,content,source,viewNum,display,pubTime,sort) "
				+ "VALUES(?,?,?,?,?,?,now(),?)";
		int row = jdbcTemplate.update(sql, news.getTitle(), news.getDegree(),
				news.getContent(), news.getSource(), news.getViewNum(), news
						.getDisplay(), news.getSort());

		return row;
	}

	@Override
	public List<News> findTopEightNewsByDegree(int degree) {
		String sql = " SELECT nId,title " + "FROM t_news "
				+ "WHERE t_news.degree=? "
				+ "ORDER BY sort desc, pubTime desc " + "LIMIT 0,8 ";

		try {
			RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(
					News.class);

			List<News> newsList = null;

			newsList = jdbcTemplate.query(sql, rowMapper, degree);

			return newsList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public News findBynId(int nId) {
		String sql = "  SELECT  nId,title,degree,content,source,viewNum,display,pubTime,sort "
				+ " FROM t_news  WHERE nId = ? ";

		try {
			RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(
					News.class);
			News news = jdbcTemplate.queryForObject(sql, rowMapper, nId);

			return news;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int pagefindAllNewsListCoutByGrade(int degree) {

		String sql = "SELECT COUNT(nId) FROM t_news WHERE t_news.degree=?";

		int count = jdbcTemplate.queryForObject(sql, Integer.class, degree);

		return count;
	}

	@Override
	public List<News> PageFindNewsBydegree(int degree, int pageSize,
			int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;

		String sql = " SELECT nId,title,pubTime " + "FROM t_news "
				+ "WHERE t_news.degree=? "
				+ "ORDER BY sort desc, pubTime desc " + " limit " + (start - 1)
				+ "," + pageSize;

		try {
			RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(
					News.class);

			List<News> newsList = jdbcTemplate.query(sql, rowMapper, degree);

			return newsList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<News> findTopTenNews() {
		String sql = " SELECT nId,title " + "FROM t_news "
				+ "ORDER BY sort desc, pubTime desc " + "LIMIT 0,10 ";

		try {
			RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(
					News.class);

			List<News> newsList = jdbcTemplate.query(sql, rowMapper);

			return newsList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<News> findNewsByDegree(int degree) {
		String sql = " SELECT nId,title,degree,source,viewNum,display,pubTime,sort  "
				+ "FROM t_news WHERE degree=? "
				+ " ORDER BY sort desc, pubTime desc ";

		try {
			RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(
					News.class);

			List<News> newsList = jdbcTemplate.query(sql, rowMapper, degree);

			return newsList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int updateNews(News news) {

		String sql = "UPDATE t_news set title=?,degree=?,content=?,source=?,viewNum=?,"
				+ "display=?,sort=? WHERE nId=? ";

		int row = jdbcTemplate.update(sql, news.getTitle(), news.getDegree(),
				news.getContent(), news.getSource(), news.getViewNum(), news
						.getDisplay(), news.getSort(), news.getnId());

		return row;
	}

	@Override
	public int changeNewsDisplay(int id, int display) {

		String sql = "UPDATE t_news set display=? WHERE nId=? ";

		int row = jdbcTemplate.update(sql, display, id);

		return row;
	}

	@Override
	public List<News> findTopSixNews() {

		String sql = " SELECT nId,title FROM t_news  ORDER BY sort desc,pubTime desc LIMIT 0,6";

		try {
			RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(
					News.class);

			List<News> newsList = jdbcTemplate.query(sql, rowMapper);

			return newsList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int addNewsViewNum(int nId) {
		String sql = "UPDATE t_news set viewNum=viewNum+1 WHERE nId=? ";

		int row = jdbcTemplate.update(sql, nId);

		return row;
	}

	@Override
	public List<News> findTopFiveNews() {
		String sql = " SELECT nId,title " + "FROM t_news "
				+ "ORDER BY sort desc, pubTime desc " + "LIMIT 0,5 ";

		try {
			RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(
					News.class);

			List<News> newsList = jdbcTemplate.query(sql, rowMapper);

			return newsList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<News> pageFindNewsListByDegree(int degree, int pageSize,
			int pageNo) {
		RowMapper<News> rowMapper = new BeanPropertyRowMapper<News>(News.class);

		int start = (pageNo - 1) * pageSize + 1;
		try {

			String sql = " SELECT nId,title "
					+ "FROM t_news "
					+ "WHERE degree=?  AND display=1  ORDER BY sort desc, pubTime desc "
					+ " limit " + (start - 1) + "," + pageSize;

			List<News> newsList = jdbcTemplate.query(sql, rowMapper, degree);

			return newsList;

		} catch (Exception e) {
			return null;
		}
	}
}
