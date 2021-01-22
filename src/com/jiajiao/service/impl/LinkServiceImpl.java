package com.jiajiao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.Link;
import com.jiajiao.dao.LinkDao;
import com.jiajiao.service.LinkService;

@Service("linkService")
@Transactional
public class LinkServiceImpl implements LinkService {

	@Resource
	private LinkDao linkDao;

	@Override
	public int pubLinkInfo(Link link) {

		link.setDisplay(0);
		link.setSort(0);
		return linkDao.insert(link);
	}

	@Override
	public List<Link> findAllLink() {

		int display = -1;// 代表查询所有的

		return linkDao.find(display);
	}

	@Override
	public int changeDisplay(int id, int i) {

		return linkDao.updateDisplay(id, i);
	}

	@Override
	public List<Link> findDisplayLink() {

		return linkDao.find(1);
	}

	@Override
	public Link findByLid(int id) {
		return linkDao.findByLid(id);
	}

	@Override
	public int updateLinkInfo(Link link) {
		return linkDao.update(link);
	}

}
