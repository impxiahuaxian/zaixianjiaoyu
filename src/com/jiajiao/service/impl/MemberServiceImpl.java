package com.jiajiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.Member;
import com.jiajiao.dao.MemberDao;
import com.jiajiao.service.MemberService;
import com.jiajiao.utils.MD5Utils;

@Service("memberService")
@Transactional
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberDao memberDao;

	@Override
	public int registerMember(String phone, String pwd) {

		return memberDao.registerMember(phone, pwd);
	}

	@Override
	public Member findByPhone(String phone) {

		return memberDao.findByPhone(phone);
	}

	@Override
	public Member login(String phone, String pwd) {
		return memberDao.login(phone, pwd);
	}

	@Override
	public int updateMemberInfo(String name, int gender, String wxNumber,
			int districtId, String address, int memberId) {
		return memberDao.updateMemberInfo(name, gender, wxNumber, districtId,
				address, memberId);
	}

	@Override
	public int changePasswordByMemberId(String password, int memberId) {
		return memberDao.changePasswordByMemberId(password, memberId);
	}

	@Override
	public Member findByMemberId(int memberId) {
		return memberDao.findByMemberId(memberId);
	}

	@Override
	public List<Member> findAllMember() {
		return memberDao.findAllMember();
	}

	@Override
	public int changeMemberUse(int id, int isUse) {
		return memberDao.changeMemberUse(id, isUse);
	}

	@Override
	public Map<String, Object> updateMemberInfo(Member member) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = memberDao.updateMemberInfo(member.getName(), member
				.getGender(), member.getWxNumber(), member.getDistrictId(),
				member.getAddress(), member.getMemberId());

		if (row != 0) {
			row = memberDao.changePasswordByMemberId(MD5Utils.MD5(member
					.getPassword()), member.getMemberId());
		}

		if (row != 0) {
			map.put("success", true);
			map.put("message", "修改成功！");
		} else {
			map.put("success", false);
			map.put("message", "修改失败！");
		}

		return map;
	}

	@Override
	public int countMemberTotal() {

		return memberDao.countMemberTotal();
	}

	@Override
	public int countBanMemberTotal() {
		return memberDao.countBanMemberTotal();
	}

	@Override
	public Map<String, Object> mUpdateMemberInfo(Member member) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = memberDao.updateMemberInfo(member.getName(), member
				.getGender(), member.getWxNumber(), member.getDistrictId(),
				member.getAddress(), member.getMemberId());

		if (row != 0) {
			map.put("success", true);
			map.put("message", "修改成功！");
		} else {
			map.put("success", false);
			map.put("message", "修改失败！");
		}

		return map;
	}
}
