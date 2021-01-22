package com.jiajiao.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jiajiao.bean.Member;
import com.jiajiao.dao.MemberDao;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public int registerMember(String phone, String pwd) {
		String sql = "insert into t_member(phone,password,registTime) value(?,?,now())";
		int rows = jdbcTemplate.update(sql, phone, pwd);
		return rows;
	}

	@Override
	public Member findByPhone(String phone) {

		String sql = " SELECT memberId,name,phone,password,gender,wxNumber,a.districtId,IFNULL(b.district,'') as district,b.district,address,registTime "
				+ " from t_member a LEFT JOIN t_district b   "
				+ " ON a.districtId = b.districtId" + " WHERE a.phone = ? ";

		try {
			RowMapper<Member> rowMapper = new BeanPropertyRowMapper<Member>(
					Member.class);
			Member member = jdbcTemplate.queryForObject(sql, rowMapper, phone);

			return member;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Member login(String phone, String pwd) {

		String sql = " SELECT memberId,name,phone,password,gender,wxNumber,a.districtId,IFNULL(b.district,'') as district,address,registTime,isUse "
				+ " from t_member a LEFT JOIN t_district b   "
				+ " ON a.districtId = b.districtId"
				+ " WHERE a.phone = ? AND a.password = ? ";

		try {
			RowMapper<Member> rowMapper = new BeanPropertyRowMapper<Member>(
					Member.class);
			Member member = jdbcTemplate.queryForObject(sql, rowMapper,
					new Object[] { phone, pwd });

			return member;

		} catch (Exception e) {

			return null;
		}

	}

	@Override
	public int updateMemberInfo(String name, int gender, String wxNumber,
			int districtId, String address, int memberId) {
		String sql = "update t_member set name=?,gender=?,wxNumber=?,districtId=?,address=? where memberId=?";

		int row = jdbcTemplate.update(sql, new Object[] { name, gender,
				wxNumber, districtId, address, memberId });

		return row;
	}

	@Override
	public int changePasswordByMemberId(String password, int memberId) {

		String sql = "update t_member set password=? where memberId=?";

		int row = jdbcTemplate.update(sql, new Object[] { password, memberId });

		return row;
	}

	@Override
	public Member findByMemberId(int memberId) {

		String sql = " SELECT memberId,name,phone,password,gender,wxNumber,a.districtId,IFNULL(b.district,'') as district,b.district,address,registTime "
				+ " from t_member a LEFT JOIN t_district b   "
				+ " ON a.districtId = b.districtId" + " WHERE a.memberId = ? ";

		try {
			RowMapper<Member> rowMapper = new BeanPropertyRowMapper<Member>(
					Member.class);
			Member member = jdbcTemplate.queryForObject(sql, rowMapper,
					memberId);

			return member;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Member> findAllMember() {

		String sql = "SELECT t_member.memberId,name,phone,gender,wxNumber,districtId,address,registTime, "
				+ " isUse,IFNULL(a.orderNum,0) as orderNum,IFNULL(b.appointNum,0) as appointNum "
				+ " FROM t_member  "
				+ " LEFT JOIN ( "
				+ "	SELECT t_orders.publisher1,COUNT(t_orders.publisher1) as orderNum "
				+ "	FROM t_orders "
				+ "	GROUP BY t_orders.publisher1 "
				+ " )a ON a.publisher1=t_member.memberId "
				+ " LEFT JOIN ( "
				+ "	SELECT t_memberorderteacher.memberId,COUNT(t_memberorderteacher.memberId) as appointNum "
				+ "	FROM t_memberorderteacher "
				+ "	GROUP BY t_memberorderteacher.memberId "
				+ " )b ON b.memberId=t_member.memberId "
				+ " ORDER BY registTime DESC ";

		try {
			RowMapper<Member> rowMapper = new BeanPropertyRowMapper<Member>(
					Member.class);

			List<Member> memberList = jdbcTemplate.query(sql, rowMapper);

			return memberList;

		} catch (Exception e) {

			return null;
		}

	}

	@Override
	public int changeMemberUse(int id, int isUse) {
		String sql = "UPDATE t_member SET isUse=? WHERE memberId=?";
		int rows = jdbcTemplate.update(sql, isUse, id);
		return rows;
	}
	
	@Override
	public int countMemberTotal() {
		String sql = "SELECT COUNT(memberId) FROM t_member ";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public int countBanMemberTotal() {
		String sql = "SELECT COUNT(memberId) FROM t_member WHERE isUse=0";

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

}
