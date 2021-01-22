package com.jiajiao.service;

import java.util.List;

import com.jiajiao.bean.DictInfo;

public interface DictInfoService {
	public List<DictInfo> findByCode(String code);
}
