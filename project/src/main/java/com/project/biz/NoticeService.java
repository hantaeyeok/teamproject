package com.project.biz;

import java.util.List;

import com.project.domain.Notice;

public interface NoticeService {
	public List<Notice> getNoticeList();
	public Notice getNotice(int nno); 
	public void insNotice(Notice notice);
	public void upNotice(Notice notice);
	public void delNotice(int nno);
	public void upHits(int nno);
}
