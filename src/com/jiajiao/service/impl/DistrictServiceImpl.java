package com.jiajiao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.District;
import com.jiajiao.dao.DistrictDao;
import com.jiajiao.service.DistrictService;

@Service
@Transactional
public class DistrictServiceImpl implements DistrictService {

	@Resource
	private DistrictDao districtDao;

	@Override
	public List<District> findAllDistrictList() {
		return districtDao.findAllDistrictList();
	}

}
