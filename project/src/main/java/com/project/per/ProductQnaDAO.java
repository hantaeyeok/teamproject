package com.project.per;

import java.util.List;

import com.project.domain.ProductQna;

public interface ProductQnaDAO {
	List<ProductQna> getProductQnaList(int pno);
	ProductQna getProductQna(int no);
	void insProductQna(ProductQna productQna);
	void upProductQna(ProductQna productQna);
	void delProductQna(int no);
	List<ProductQna> getAnswers(int parno);
	int getProductPlevel(int parno);
	void delProductAnswers(int parno);
	void upHits(int no);
}

