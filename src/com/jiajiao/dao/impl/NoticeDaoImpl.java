package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Notice;
import com.jiajiao.dao.NoticeDao;

@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insert(Notice notice) {

		String sql = "INSERT INTO t_notice(title,content,type,source,viewNum,display,pubTime,sort) "
				+ "VALUES(?,?,?,?,?,?,now(),?)";
		int row = jdbcTemplate.update(sql, notice.getTitle(), notice
				.getContent(), notice.getType(), notice.getSource(), notice
				.getViewNum(), notice.getDisplay(), notice.getSort());

		return row;
	}

	@Override
	public List<Notice> findAllNotice() {
		String sql = " SELECT nId,title,type,source,viewNum,pubTime,sort,display FROM t_notice ";

		try {
			RowMapper<Notice> rowMapper = new BeanPropertyRowMapper<Notice>(
					Notice.class);

			List<Notice> noticeList = jdbcTemplate.query(sql, rowMapper);

			return noticeList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int changeNoticeDisplay(int id, int display) {
		String sql = "UPDATE t_notice set display=? WHERE nId=? ";

		int row = jdbcTemplate.update(sql, display, id);

		return row;
	}

	@Override
	public Notice findBynId(int nId) {
		String sql = "  SELECT  nId,title,type,content,source,viewNum,display,pubTime,sort "
				+ " FROM t_notice  WHERE nId = ? ";

		try {
			RowMapper<Notice> rowMapper = new BeanPropertyRowMapper<Notice>(
					Notice.class);
			Notice notice = jdbcTemplate.queryForObject(sql, rowMapper, nId);

			return notice;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int updateNotice(Notice notice) {
		String sql = "UPDATE t_notice set title=?,type=?,content=?,source=?,viewNum=?,"
				+ "display=?,sort=? WHERE nId=? ";

		int row = jdbcTemplate.update(sql, notice.getTitle(), notice.getType(),
				notice.getContent(), notice.getSource(), notice.getViewNum(),
				notice.getDisplay(), notice.getSort(), notice.getnId());

		return row;
	}

	@Override
	public List<Notice> findTopFourNoticeByType(int type) {

		String sql = " SELECT nId,title " + "FROM t_notice "
				+ "WHERE t_notice.type=? "
				+ "ORDER BY sort desc, pubTime desc " + "LIMIT 0,4 ";

		try {
			RowMapper<Notice> rowMapper = new BeanPropertyRowMapper<Notice>(
					Notice.class);

			List<Notice> noticeList = null;

			noticeList = jdbcTemplate.query(sql, rowMapper, type);

			return noticeList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int addNoticeViewNum(int nId) {
		String sql = "UPDATE t_notice set viewNum=viewNum+1 WHERE nId=? ";

		int row = jdbcTemplate.update(sql, nId);

		return row;
	}

	@Override
	public List<Notice> findTopTwelveNotice() {
		String sql = " SELECT nId,title FROM t_notice ORDER BY sort desc,pubTime desc LIMIT 0,12  ";

		try {
			RowMapper<Notice> rowMapper = new BeanPropertyRowMapper<Notice>(
					Notice.class);

			List<Notice> noticeList = jdbcTemplate.query(sql, rowMapper);

			return noticeList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<Notice> pageFindAllNoticeListByType(int type, int pageSize,
			int currentPage) {
		int start = (currentPage - 1) * pageSize + 1;

		String sql = " SELECT nId,title,pubTime " + "FROM t_notice ";

		if (type == 0) {
			sql += "ORDER BY sort desc, pubTime desc " + " limit "
					+ (start - 1) + "," + pageSize;
		} else {
			sql += "WHERE t_notice.type=? "
					+ "ORDER BY sort desc, pubTime desc " + " limit "
					+ (start - 1) + "," + pageSize;
		}

		try {
			RowMapper<Notice> rowMapper = new BeanPropertyRowMapper<Notice>(
					Notice.class);

			List<Notice> noticeList = jdbcTemplate.query(sql, rowMapper, type);

			return noticeList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int pageFindAllNoticeListCountByType(int type) {

		String sql = "";

		if (type == 0) {
			sql = "SELECT COUNT(nId) FROM t_notice ";
		} else {
			sql = "SELECT COUNT(nId) FROM t_notice WHERE t_notice.type=?";
		}

		int count = jdbcTemplate.queryForObject(sql, Integer.class, type);

		return count;
	}

	@Override
	public List<Notice> pageFindNoticeListByType(int type, int pageSize,
			Integer pageNo) {

		RowMapper<Notice> rowMapper = new BeanPropertyRowMapper<Notice>(
				Notice.class);

		int start = (pageNo - 1) * pageSize + 1;
		try {

			String sql = " SELECT nId,title "
					+ "FROM t_notice "
					+ "WHERE type=?  AND display=1  ORDER BY sort desc, pubTime desc "
					+ " limit " + (start - 1) + "," + pageSize;

			List<Notice> noticeList = jdbcTemplate.query(sql, rowMapper, type);

			return noticeList;

		} catch (Exception e) {
			return null;
		}
	}
}
