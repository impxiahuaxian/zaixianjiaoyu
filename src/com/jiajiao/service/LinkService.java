package com.jiajiao.service;

import java.util.List;

import com.jiajiao.bean.Link;

public interface LinkService {

	/**
	 * 发布申请友情链接
	 * 
	 * @param link
	 * @return
	 */
	public int pubLinkInfo(Link link);

	public  List<Link> findAllLink();

	public int changeDisplay(int id, int i);

	public List<Link> findDisplayLink();

	public Link findByLid(int id);

	public int updateLinkInfo(Link link);
}
