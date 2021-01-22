package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.GradePrice;
import com.jiajiao.dao.GradePriceDao;

@Repository("gradePriceDao")
public class GradePriceDaoImpl implements GradePriceDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<GradePrice> findAllCoursePriceList() {

		String sql = "SELECT pId,gradeId,b.content as gradeName,tminPrice,tmaxPrice,sminPrice,smaxPrice,gradeType,c.content AS gradeTypeName "+
					" FROM t_gradeprice a,t_dictinfo b,t_dictinfo c "+
					" WHERE a.gradeId=b.dictId AND a.gradeType=c.dictId";

		RowMapper<GradePrice> rowMapper = new BeanPropertyRowMapper<GradePrice>(
				GradePrice.class);

		List<GradePrice> gradePriceList = jdbcTemplate.query(sql, rowMapper);

		return gradePriceList;
	}

}
