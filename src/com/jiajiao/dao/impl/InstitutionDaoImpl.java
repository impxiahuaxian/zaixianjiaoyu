package com.jiajiao.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Institution;
import com.jiajiao.dao.InstitutionDao;

@Repository("institutionDao")
public class InstitutionDaoImpl implements InstitutionDao {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Institution> findAll(int display) {

		String sql = "SELECT iId,iName,kemudalei,course,contactName,contactPhone,teachingType,teachingPrice,isListen,qq,logo,areaId,address,lng,lat,photo,pubTime,sort,introduce,viewNum,display "
				+ " FROM t_institution ";

		if (display != -1) {
			sql = sql + " WHERE display = ? ";
		}

		sql = sql + " ORDER BY sort DESC, pubTime DESC ";

		try {
			RowMapper<Institution> rowMapper = new BeanPropertyRowMapper<Institution>(
					Institution.class);

			List<Institution> institutionList = null;

			if (display != -1) {

				institutionList = jdbcTemplate.query(sql, rowMapper, display);

			} else {

				institutionList = jdbcTemplate.query(sql, rowMapper);

			}

			return institutionList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public Institution findByIid(int iId) {

		String sql = " SELECT iId,iName,kemudalei,course,contactName,contactPhone,teachingType,teachingPrice,isListen,qq,logo,areaId,address,lng,lat,photo,pubTime,sort,introduce,viewNum,display  "
				+ " from t_institution  WHERE iId = ? ";

		try {
			RowMapper<Institution> rowMapper = new BeanPropertyRowMapper<Institution>(
					Institution.class);
			Institution institution = jdbcTemplate.queryForObject(sql,
					rowMapper, iId);

			return institution;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Institution> findTopThreeInstitution() {

		String sql = " SELECT iId,iName,kemudalei,course,contactName,contactPhone,teachingType,teachingPrice,isListen,qq,logo,areaId,address,lng,lat,photo,pubTime,sort,introduce,viewNum,display "
				+ " FROM t_institution "
				+ " where display=1 "
				+ " ORDER BY sort DESC " + "LIMIT 0,3 ";

		try {
			RowMapper<Institution> rowMapper = new BeanPropertyRowMapper<Institution>(
					Institution.class);

			List<Institution> institutionList = null;

			institutionList = jdbcTemplate.query(sql, rowMapper);

			return institutionList;

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public int addViewNum(int iId) {

		String sql = " update t_institution set viewNum=viewNum+1 where iId=?";

		int row = jdbcTemplate.update(sql, new Object[] { iId });

		return row;
	}

	@Override
	public int updateInstitutionDisPlay(int iId, int display) {

		String sql = " update t_institution set display=? where iId=?";

		int row = jdbcTemplate.update(sql, new Object[] { display, iId });

		return row;

	}

	@Override
	public int updateInstitution(Institution institution) {

		String sql = " UPDATE t_institution SET  iName=?,kemudalei=?,course=?,contactName=?,contactPhone=?,teachingType=?,teachingPrice=?, "
				+ " isListen=?,qq=?,logo=?,areaId=?,address=?,lng=?,lat=?,sort=?,introduce=? WHERE iId=?";

		int row = jdbcTemplate.update(sql, new Object[] {
				institution.getiName(), institution.getKemudalei(),
				institution.getCourse(), institution.getContactName(),
				institution.getContactPhone(), institution.getTeachingType(),
				institution.getTeachingPrice(), institution.getIsListen(),
				institution.getQq(), institution.getLogo(),
				institution.getAreaId(), institution.getAddress(),
				institution.getLng(), institution.getLat(),
				institution.getSort(), institution.getIntroduce(),
				institution.getiId() });

		return row;
	}

	@Override
	public int updatePhoto(int iId, String photo) {

		String sql = " UPDATE t_institution SET  photo=? WHERE iId=?";

		int row = jdbcTemplate.update(sql, new Object[] { photo, iId });

		return row;
	}

	@Override
	public int insert(Institution institution) {

		String sql = "INSERT INTO t_institution(iName,kemudalei,course,contactName,contactPhone,teachingType,teachingPrice,isListen, "
				+ "qq,logo,areaId,address,lng,lat,pubTime,sort,introduce) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,?)";

		int row = jdbcTemplate.update(sql, institution.getiName(), institution
				.getKemudalei(), institution.getCourse(), institution
				.getContactName(), institution.getContactPhone(), institution
				.getTeachingType(), institution.getTeachingPrice(), institution
				.getIsListen(), institution.getQq(), institution.getLogo(),
				institution.getAreaId(), institution.getAddress(), institution
						.getLng(), institution.getLat(), institution.getSort(),
				institution.getIntroduce());

		return row;
	}
}
