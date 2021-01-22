package com.jiajiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiajiao.bean.Notice;
import com.jiajiao.dao.NoticeDao;
import com.jiajiao.service.NoticeService;

@Service("noticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {

	@Resource
	private NoticeDao noticeDao;

	@Override
	public Map<String, Object> pubNotice(Notice notice) {
		Map<String, Object> map = new HashMap<String, Object>();

		int row = noticeDao.insert(notice);
		if (row != 0) {
			map.put("success", true);
		} else {
			map.put("success", false);
			map.put("message", "添加失败");

		}

		return map;
	}

	@Override
	public List<Notice> findAllNotice() {

		return noticeDao.findAllNotice();
	}

	@Override
	public int changeNoticeDisplay(int id, int display) {
		return noticeDao.changeNoticeDisplay(id, display);
	}

	@Override
	public Notice findBynId(int nId) {

		// 设置该条公告浏览量增1
		noticeDao.addNoticeViewNum(nId);

		Notice notice = noticeDao.findBynId(nId);

		return notice;
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public List<Notice> findTopFourNoticeByType(int type) {

		return noticeDao.findTopFourNoticeByType(type);
	}

	@Override
	public List<Notice> findTopTwelveNotice() {
		return noticeDao.findTopTwelveNotice();
	}

	@Override
	public List<Notice> pageFindAllNoticeListByType(int type, int pageSize,
			int currentPage) {
		return noticeDao.pageFindAllNoticeListByType(type, pageSize,
				currentPage);
	}

	@Override
	public int pageFindAllNoticeListCountByType(int type) {
		return noticeDao.pageFindAllNoticeListCountByType(type);
	}

	@Override
	public List<Notice> pageFindNoticeListByType(int type, int pageSize,
			Integer pageNo) {
		return noticeDao.pageFindNoticeListByType(type, pageSize, pageNo);
	}

}
