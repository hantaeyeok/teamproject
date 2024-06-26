package com.project.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Faq;
import com.project.per.FaqDAO;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public List<Faq> getFaqList() {
		return faqDAO.getFaqList();
	}

	@Override
	public Faq getFaq(int fno) {
		return faqDAO.getFaq(fno);
	}

	@Override
	public void insFaq(Faq faq) {
		faqDAO.insFaq(faq);
	}

	@Override
	public void upFaq(Faq faq) {
		faqDAO.upFaq(faq);
	}

	@Override
	public void delFaq(int fno) {
		faqDAO.delFaq(fno);
	}
	
	

}
