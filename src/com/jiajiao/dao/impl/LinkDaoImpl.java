package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Link;
import com.jiajiao.dao.LinkDao;

@Repository("linkDao")
public class LinkDaoImpl implements LinkDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insert(Link link) {

		String sql = "INSERT INTO t_link(webName,webUrl,webDescribe,contactName,webPhone,display,sort,pubTime)"
				+ " VALUES(?,?,?,?,?,?,?,now())";

		int row = jdbcTemplate.update(sql, link.getWebName(), link.getWebUrl(),
				link.getWebDescribe(), link.getContactName(), link
						.getWebPhone(), link.getDisplay(), link.getSort());

		return row;

	}

	@Override
	public List<Link> find(int display) {

		String sql = " SELECT lId,webName,webUrl,webDescribe,contactName,webPhone,display,sort,pubTime "
				+ " FROM t_link ";

		if (display != -1) {
			sql = sql + " WHERE display = ? ";
		}

		sql = sql + " ORDER BY sort DESC, pubTime DESC ";

		try {
			RowMapper<Link> rowMapper = new BeanPropertyRowMapper<Link>(
					Link.class);

			List<Link> linkList = null;

			if (display != -1) {

				linkList = jdbcTemplate.query(sql, rowMapper, display);

			} else {

				linkList = jdbcTemplate.query(sql, rowMapper);

			}

			return linkList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int updateDisplay(int id, int i) {

		String sql = "update t_link set display=? where lid=?";

		int row = jdbcTemplate.update(sql, new Object[] { i, id });

		return row;
	}

	@Override
	public Link findByLid(int id) {

		String sql = " SELECT lid,webName,webUrl,webDescribe,contactName,webPhone,display,sort  "
				+ " from t_link  WHERE lid = ? ";

		try {
			RowMapper<Link> rowMapper = new BeanPropertyRowMapper<Link>(
					Link.class);
			Link link = jdbcTemplate.queryForObject(sql, rowMapper, id);

			return link;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int update(Link link) {
		String sql = " update t_link "
				+ " set webName=?,webUrl=?,webDescribe=?,contactName=?,webPhone=?, display=?,sort=? "
				+ " where lid=?";

		int row = jdbcTemplate.update(sql, new Object[] { link.getWebName(),
				link.getWebUrl(), link.getWebDescribe(), link.getContactName(),
				link.getWebPhone(), link.getDisplay(), link.getSort(),link.getLid() });

		return row;
	}
}
