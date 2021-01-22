package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Paper;
import com.jiajiao.dao.PaperDao;

@Repository("paperDao")
public class PaperDaoImpl implements PaperDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insert(Paper paper) {

		String sql = "INSERT INTO t_paper(title,degree,grade,course,content,downLink,downPwd,pubTime,sort) "
				+ "VALUES(?,?,?,?,?,?,?,now(),?)";

		int row = jdbcTemplate.update(sql, paper.getTitle(), paper.getDegree(),
				paper.getGrade(), paper.getCourse(), paper.getContent(), paper
						.getDownLink(), paper.getDownPwd(), paper.getSort());

		return row;
	}

	@Override
	public Paper findByPid(int id) {
		String sql = "  SELECT  pId,title,degree,grade,course,content,downLink,downPwd,view,downNum,pubTime,sort "
				+ " FROM t_paper  WHERE pId = ? ";

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);
			Paper paper = jdbcTemplate.queryForObject(sql, rowMapper, id);

			return paper;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Paper> findPaperByGrade(int grade) {
		String sql = " SELECT pId,title,degree,grade,content,course,downLink,downPwd,view,downNum,pubTime,sort "
				+ "FROM t_paper "
				+ "WHERE t_paper.grade=?   AND display=1 "
				+ "ORDER BY sort desc, pubTime desc ";

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);

			List<Paper> paperList = null;

			paperList = jdbcTemplate.query(sql, rowMapper, grade);

			return paperList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<Paper> findTopEightPaperByGrade(int grade) {

		String sql = " SELECT pId,title " + "FROM t_paper "
				+ "WHERE t_paper.grade=? AND display=1 "
				+ "ORDER BY sort desc, pubTime desc " + "LIMIT 0,8 ";

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);

			List<Paper> paperList = null;

			paperList = jdbcTemplate.query(sql, rowMapper, grade);

			return paperList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<Paper> pageFindPaperByGrade(int grade, int pageSize,
			int currentPage) {
		int start = (currentPage - 1) * pageSize + 1;

		String sql = " SELECT pId,title " + "FROM t_paper "
				+ "WHERE t_paper.grade=?   AND display=1 "
				+ "ORDER BY sort desc, pubTime desc " + " limit " + (start - 1)
				+ "," + pageSize;

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);

			List<Paper> paperList = jdbcTemplate.query(sql, rowMapper, grade);

			return paperList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int pageFindAllPaperListCoutByGrade(int grade) {
		String sql = "SELECT COUNT(pid) FROM t_paper WHERE t_paper.grade=?   AND display=1";

		int count = jdbcTemplate.queryForObject(sql, Integer.class, grade);

		return count;
	}

	@Override
	public int pageConditionFindAllPaperListCoutByGrade(int grade, int course) {

		String sql = "SELECT COUNT(pid) FROM t_paper "
				+ "WHERE 1=1  AND display=1 ";

		int count = 0;

		if (grade == 0 && course == 0) {
			count = jdbcTemplate.queryForObject(sql, Integer.class);
		} else if (grade == 0 && course != 0) {
			sql += " and course=? ";
			count = jdbcTemplate.queryForObject(sql, Integer.class, course);
		} else if (grade != 0 && course == 0) {
			sql += "  and grade=? ";
			count = jdbcTemplate.queryForObject(sql, Integer.class, grade);
		} else if (grade != 0 && course != 0) {
			sql += "  and grade=? and course=?  ";
			count = jdbcTemplate.queryForObject(sql, Integer.class, grade,
					course);
		}

		return count;
	}

	@Override
	public List<Paper> pageConditionFindPaperByGrade(int grade, int course,
			int pageSize, int currentPage) {

		RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
				Paper.class);

		List<Paper> paperList = null;

		int start = (currentPage - 1) * pageSize + 1;

		try {

			String sql = " SELECT pId,title " + "FROM t_paper "
					+ "WHERE 1=1  AND display=1 ";

			if (grade == 0 && course == 0) {
				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper);

			} else if (grade == 0 && course != 0) {

				sql += " and course=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, course);

			} else if (grade != 0 && course == 0) {

				sql += " and grade=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, grade);

			} else if (grade != 0 && course != 0) {

				sql += " and grade=? and course=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, grade, course);

			}

			return paperList;

		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Paper> findTopTenPaper() {

		String sql = " SELECT pId,title " + "FROM t_paper WHERE  display=1 "
				+ "ORDER BY sort desc, pubTime desc " + "LIMIT 0,10 ";

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);

			List<Paper> paperList = null;

			paperList = jdbcTemplate.query(sql, rowMapper);

			return paperList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<Paper> findPaperByDegree(int degree) {
		String sql = " SELECT pId,title,course,display,degree,grade,downLink,downPwd,view,downNum,pubTime,sort "
				+ "FROM t_paper "
				+ "WHERE t_paper.degree=? "
				+ "ORDER BY sort desc, pubTime desc ";

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);

			List<Paper> paperList = null;

			paperList = jdbcTemplate.query(sql, rowMapper, degree);

			return paperList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int ChangePaperDisplay(int id, int display) {

		String sql = "UPDATE t_paper SET display=? WHERE pId=?";

		int row = jdbcTemplate.update(sql, display, id);

		return row;
	}

	@Override
	public int update(Paper paper) {
		String sql = "UPDATE t_paper SET title=?,degree=?,grade=?,course=?,content=?,"
				+ "downLink=?,downPwd=?,view=?,downNum=?,sort=? WHERE pId=?";

		int row = jdbcTemplate.update(sql, paper.getTitle(), paper.getDegree(),
				paper.getGrade(), paper.getCourse(), paper.getContent(), paper
						.getDownLink(), paper.getDownPwd(), paper.getView(),
				paper.getDownNum(), paper.getSort(), paper.getpId());

		return row;
	}

	@Override
	public List<Paper> findTopSixPaper() {
		String sql = " SELECT pId,title FROM t_paper  ORDER BY sort desc,pubTime desc LIMIT 0,6";

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);

			List<Paper> paperList = jdbcTemplate.query(sql, rowMapper);

			return paperList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int addPaperViewNum(int id) {
		String sql = "UPDATE t_paper set view=view+1 WHERE pId=? ";

		int row = jdbcTemplate.update(sql, id);

		return row;

	}

	@Override
	public List<Paper> findTopFivePaperListByDegree(int degree) {
		String sql = " SELECT pId,title FROM t_paper WHERE degree=?  ORDER BY sort desc,pubTime desc LIMIT 0,5";

		try {
			RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
					Paper.class);

			List<Paper> paperList = jdbcTemplate.query(sql, rowMapper, degree);

			return paperList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<Paper> pageFindPaperListByConDition(int degree, int grade,
			int course, int pageSize, int currentPage) {

		RowMapper<Paper> rowMapper = new BeanPropertyRowMapper<Paper>(
				Paper.class);

		List<Paper> paperList = null;

		int start = (currentPage - 1) * pageSize + 1;

		try {

			String sql = " SELECT pId,title " + "FROM t_paper "
					+ "WHERE 1=1  AND display=1 ";

			if (degree == 0 && grade == 0 && course == 0) {
				// 1.degree不限 grade不限 course不限

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper);

			} else if (degree != 0 && grade == 0 && course == 0) {
				// 2.degree有 grade不限 course不限

				sql += " and degree=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, degree);

			} else if (degree == 0 && grade != 0 && course == 0) {
				// 3.degree不限 grade有 course不限
				sql += " and grade=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, grade);

			} else if (degree == 0 && grade == 0 && course != 0) {
				// 4.degree不限 grade不限 course有
				sql += " and course=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, grade, course);

			} else if (degree != 0 && grade != 0 && course == 0) {
				// 5.degree有 grade有 course不限
				sql += " and degree=? and grade=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, degree, grade);

			} else if (degree != 0 && grade == 0 && course != 0) {
				// 6.degree有 grade不限 course有
				sql += " and degree=? and course=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, degree, course);

			} else if (degree == 0 && grade != 0 && course != 0) {
				// 7.degree不限 grade有 course有
				sql += " and grade=? and course=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, grade, course);

			} else if (degree != 0 && grade != 0 && course != 0) {
				// 8.degree有 grade有 course有
				sql += " and degree=? and grade=? and course=? ";

				sql += " ORDER BY sort desc, pubTime desc " + " limit "
						+ (start - 1) + "," + pageSize;

				paperList = jdbcTemplate.query(sql, rowMapper, degree, grade,
						course);

			}

			return paperList;

		} catch (Exception e) {
			return null;
		}

	}
}
