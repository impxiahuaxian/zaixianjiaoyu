package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.DictInfo;
import com.jiajiao.dao.DictInfoDao;

@Repository("dictInfoDao")
public class DictInfoImpl implements DictInfoDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	public List<DictInfo> findByCode(String code) {
		
		String sql="SELECT dictid dictId,`code`,content,linkDict  FROM t_dictinfo WHERE `code` =?";

		RowMapper<DictInfo> rowMapper = new BeanPropertyRowMapper<DictInfo>(DictInfo.class);
		
		List<DictInfo> dictList= jdbcTemplate.query(sql, rowMapper,code);
		
		return dictList;
	}

}
