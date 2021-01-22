package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.DictInfo;

public interface DictInfoDao {

	/**
	 * 根据code查询
	 * 
	 * @param code
	 * @return List<DictInfo>
	 */
	public List<DictInfo> findByCode(String code);
	
	
}
