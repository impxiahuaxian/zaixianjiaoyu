package com.jiajiao.dao;

import java.util.List;

import com.jiajiao.bean.Notice;

public interface NoticeDao {

	public int insert(Notice notice);

	public List<Notice> findAllNotice();

	public int changeNoticeDisplay(int id, int display);

	public Notice findBynId(int nId);

	public int updateNotice(Notice notice);

	public List<Notice> findTopFourNoticeByType(int type);

	public int addNoticeViewNum(int nId);

	public List<Notice> findTopTwelveNotice();

	public List<Notice> pageFindAllNoticeListByType(int type, int pageSize,
			int currentPage);

	public int pageFindAllNoticeListCountByType(int type);

	public List<Notice> pageFindNoticeListByType(int type, int pageSize,
			Integer pageNo);

}
