package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.District;
import com.jiajiao.dao.DistrictDao;

@Repository("districtDao")
public class DistrictDaoImpl implements DistrictDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<District> findAllDistrictList() {

		String sql = "SELECT districtId,district  FROM t_district ";

		RowMapper<District> rowMapper = new BeanPropertyRowMapper<District>(
				District.class);

		List<District> districtList = jdbcTemplate.query(sql, rowMapper);

		return districtList;
	}

}
