package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.Paper;

public interface PaperDao {

	public int insert(Paper paper);

	public Paper findByPid(int id);

	public List<Paper> findPaperByGrade(int grade);

	public List<Paper> findTopEightPaperByGrade(int grade);

	public int pageFindAllPaperListCoutByGrade(int grade);

	public List<Paper> pageFindPaperByGrade(int grade, int pageSize,
			int currentPage);

	public int pageConditionFindAllPaperListCoutByGrade(int grade, int course);

	public List<Paper> pageConditionFindPaperByGrade(int grade,int course, int pageSize,
			int currentPage);

	public List<Paper> findTopTenPaper();

	public List<Paper> findPaperByDegree(int degree);

	public int ChangePaperDisplay(int id, int display);

	public int update(Paper paper);

	public List<Paper> findTopSixPaper();

	public int addPaperViewNum(int id);

	public List<Paper> findTopFivePaperListByDegree(int degree);

	public List<Paper> pageFindPaperListByConDition(int degree, int grade,
			int course,int pageSize,int currentPage);
	
	
}
