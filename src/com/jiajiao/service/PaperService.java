package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.Paper;

public interface PaperService {
	public Map<String, Object> pubPaper(Paper paper);

	public Paper findPaperInfo(int id);

	public List<Paper> findPaperByGrade(int grade);

	public List<Paper> findTopEightPaperByGrade(int grade);

	public List<Paper> pageFindPaperByGrade(int grade, int pageSize,
			int currentPage);

	public int pageFindAllPaperListCoutByGrade(int grade);

	public int pageConditionFindAllPaperListCoutByGrade(int grade, int course);

	public List<Paper> pageConditionFindPaperByGrade(int grade, int course,
			int pageSize, int currentPage);

	public List<Paper> findTopTenPaper();

	public List<Paper> findPaperByDegree(int degree);

	public int ChangePaperDisplay(int id, int display);

	public int updatePaper(Paper paper);

	public List<Paper> findTopSixPaper();

	public List<Paper> findTopFivePaperListByDegree(int degree);

	/**
	 * 手机端分页按条件（学段、年级、科目）查询试题
	 * 
	 * @param degree
	 * @param grade
	 * @param course
	 * @return
	 */
	public List<Paper> pageFindPaperListByConDition(int degree, int grade,
			int course,int pageSize,int currentPage);
}
