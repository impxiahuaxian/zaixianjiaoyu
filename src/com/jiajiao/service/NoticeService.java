package com.jiajiao.service;

import java.util.List;
import java.util.Map;

import com.jiajiao.bean.Notice;

public interface NoticeService {

	public Map<String, Object> pubNotice(Notice notice);

	public List<Notice> findAllNotice();

	public int changeNoticeDisplay(int id, int display);

	public Notice findBynId(int nId);

	public int updateNotice(Notice notice);

	public List<Notice> findTopFourNoticeByType(int type);

	public List<Notice> findTopTwelveNotice();

	public int pageFindAllNoticeListCountByType(int type);

	public List<Notice> pageFindAllNoticeListByType(int type, int pageSize,
			int currentPage);

	public List<Notice> pageFindNoticeListByType(int type, int pageSize,
			Integer pageNo);

}
