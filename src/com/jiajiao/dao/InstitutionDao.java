package com.jiajiao.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jiajiao.bean.Institution;

public interface InstitutionDao {

	public List<Institution> findAll(int display);

	public Institution findByIid(int iId);

	public List<Institution> findTopThreeInstitution();

	public int addViewNum(int iId);

	public int updateInstitutionDisPlay(int iId, int display);

	public int updateInstitution(Institution institution);

	public int updatePhoto(int iId, String photo);

	public int insert(Institution institution);

}
