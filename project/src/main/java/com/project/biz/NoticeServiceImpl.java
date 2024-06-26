package com.project.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Notice;
import com.project.per.NoticeDAO;
@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<Notice> getNoticeList() {
		return noticeDAO.getNoticeList();
	}
	
	@Transactional
	@Override
	public Notice getNotice(int nno) {
		noticeDAO.upHits(nno);
		return noticeDAO.getNotice(nno);
	}

	@Override
	public void insNotice(Notice notice) {
		noticeDAO.insNotice(notice);
		
	}

	@Override
	public void upNotice(Notice notice) {
		noticeDAO.upNotice(notice);
		
	}

	@Override
	public void delNotice(int nno) {
		noticeDAO.delNotice(nno);
		
	}

	@Override
	public void upHits(int nno) {
		noticeDAO.upHits(nno);
	}
	
	
}
