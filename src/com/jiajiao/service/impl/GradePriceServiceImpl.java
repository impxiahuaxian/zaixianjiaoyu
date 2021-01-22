package com.jiajiao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiajiao.bean.GradePrice;
import com.jiajiao.dao.GradePriceDao;
import com.jiajiao.service.GradePriceService;

@Service("gradePriceService")
public class GradePriceServiceImpl implements GradePriceService {

	@Resource
	private GradePriceDao gradePriceDao;

	@Override
	public List<GradePrice> findAllCoursePriceList() {

		return gradePriceDao.findAllCoursePriceList();
	}

}
