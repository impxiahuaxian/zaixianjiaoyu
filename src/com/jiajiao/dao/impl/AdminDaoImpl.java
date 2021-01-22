package com.jiajiao.dao.impl;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Admin;
import com.jiajiao.dao.AdminDao;
import com.jiajiao.utils.MD5Utils;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public Admin getByUsernameAndPwd(String username, String password) {
		try {
			String sql = "select aId,username,password from t_admin where username=? AND password=?";

			RowMapper<Admin> rowMapper = new BeanPropertyRowMapper<Admin>(
					Admin.class);
			Admin admin = jdbcTemplate.queryForObject(sql, rowMapper, username,
					MD5Utils.MD5(password));

			return admin;
			
		} catch (Exception e) {
			return null;
		}

	}

}
