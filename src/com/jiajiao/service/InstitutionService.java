package com.jiajiao.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.jiajiao.bean.Institution;

public interface InstitutionService {

	List<Institution> findAll(int display);

	Institution findByIid(int iId);

	List<Institution> findTopThreeInstitution();

	int addViewNum(int iId);

	int stopInstitution(int iId);

	int startInstitution(int iId);

	Map<String, Object> updateInstitution(HttpServletRequest request)throws IllegalStateException, IOException;

	int updatePhoto(int iId, String photo);

	Map<String, Object> pubInstitutionInfo(HttpServletRequest request) throws IllegalStateException, IOException;

}
