package com.jiajiao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.DictInfo;
import com.jiajiao.dao.DictInfoDao;
import com.jiajiao.service.DictInfoService;

@Service("dictInfoService")
@Transactional
public class DictInfoServiceImpl implements DictInfoService {

	// @Autowired
	// @Qualifier("dictInfoDao")
	@Resource(name = "dictInfoDao")
	private DictInfoDao dictInfoDao;

	/*
	 * 查询数据字典数据
	 */
	public List<DictInfo> findByCode(String code) {
		List<DictInfo> dictList = dictInfoDao.findByCode(code);
		return dictList;
	}
}
