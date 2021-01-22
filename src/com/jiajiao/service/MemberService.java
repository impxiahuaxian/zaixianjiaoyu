package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.Member;

public interface MemberService {
	public int registerMember(String phone, String pwd);

	public Member findByPhone(String phone);

	public Member login(String phone, String pwd);

	public int updateMemberInfo(String name, int gender, String wxNumber,
			int districtId, String address, int memberId);

	public int changePasswordByMemberId(String password, int memberId);

	public Member findByMemberId(int memberId);

	public List<Member> findAllMember();

	public int changeMemberUse(int id, int isUse);

	public Map<String, Object> updateMemberInfo(Member member);

	public int countMemberTotal();

	public int countBanMemberTotal();

	public Map<String, Object> mUpdateMemberInfo(Member member);
}
