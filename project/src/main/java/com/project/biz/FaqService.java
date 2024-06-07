package com.project.biz;

import java.util.List;

import com.project.domain.Faq;

public interface FaqService {
	public List<Faq> getFaqList();
	public Faq getFaq(int fno);
	public void insFaq(Faq faq);
	public void upFaq(Faq faq);
	public void delFaq(int fno);
}