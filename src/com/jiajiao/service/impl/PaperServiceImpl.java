package com.jiajiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.Paper;
import com.jiajiao.dao.PaperDao;
import com.jiajiao.service.PaperService;

@Service("paperService")
@Transactional
public class PaperServiceImpl implements PaperService {

	@Resource
	private PaperDao paperDao;

	@Override
	public Map<String, Object> pubPaper(Paper paper) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = paperDao.insert(paper);
		if (row != 0) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "添加失败");

		}

		return map;
	}

	@Override
	public Paper findPaperInfo(int id) {

		// 设置该条试题浏览量增1
		paperDao.addPaperViewNum(id);

		return paperDao.findByPid(id);
	}

	@Override
	public List<Paper> findPaperByGrade(int grade) {
		return paperDao.findPaperByGrade(grade);
	}

	@Override
	public List<Paper> findTopEightPaperByGrade(int grade) {
		return paperDao.findTopEightPaperByGrade(grade);
	}

	@Override
	public int pageFindAllPaperListCoutByGrade(int grade) {
		return paperDao.pageFindAllPaperListCoutByGrade(grade);
	}

	@Override
	public List<Paper> pageFindPaperByGrade(int grade, int pageSize,
			int currentPage) {
		return paperDao.pageFindPaperByGrade(grade, pageSize, currentPage);
	}

	@Override
	public int pageConditionFindAllPaperListCoutByGrade(int grade, int course) {

		return paperDao.pageConditionFindAllPaperListCoutByGrade(grade, course);
	}

	@Override
	public List<Paper> pageConditionFindPaperByGrade(int grade, int course,
			int pageSize, int currentPage) {

		return paperDao.pageConditionFindPaperByGrade(grade, course, pageSize,
				currentPage);
	}

	@Override
	public List<Paper> findTopTenPaper() {
		return paperDao.findTopTenPaper();
	}

	@Override
	public List<Paper> findPaperByDegree(int degree) {
		return paperDao.findPaperByDegree(degree);
	}

	@Override
	public int ChangePaperDisplay(int id, int display) {
		return paperDao.ChangePaperDisplay(id, display);
	}

	@Override
	public int updatePaper(Paper paper) {

		return paperDao.update(paper);
	}

	@Override
	public List<Paper> findTopSixPaper() {
		return paperDao.findTopSixPaper();
	}

	@Override
	public List<Paper> findTopFivePaperListByDegree(int degree) {
		return paperDao.findTopFivePaperListByDegree(degree);
	}

	@Override
	public List<Paper> pageFindPaperListByConDition(int degree, int grade,
			int course, int pageSize, int currentPag) {
		return paperDao.pageFindPaperListByConDition(degree, grade, course,
				pageSize, currentPag);
	}

}
