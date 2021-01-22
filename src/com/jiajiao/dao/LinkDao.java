package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.Link;

public interface LinkDao {

	public int insert(Link link);

	public List<Link> find(int display);

	public int updateDisplay(int id, int i);

	public Link findByLid(int id);

	public int update(Link link);

}
