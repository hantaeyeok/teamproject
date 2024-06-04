package com.project.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.ProductQna;
import com.project.per.ProductQnaDAO;

@Service
public class ProductQnaServiceImpl implements ProductQnaService{
	
	 @Autowired
	    private ProductQnaDAO productQnaDAO;

	    @Override
	    public List<ProductQna> getProductQnaList(int pno) {
	        return productQnaDAO.getProductQnaList(pno);
	    }
	    
	    @Transactional
	    @Override
	    public ProductQna getProductQna(int no) {
	        productQnaDAO.upHits(no);
	        return productQnaDAO.getProductQna(no);
	    }

	    @Override
	    public void insProductQna(ProductQna productQna) {
	    	  int plevel;
	          if (productQna.getParno() == 0) {
	              plevel = 0; // 최상위 글인 경우 plevel을 0으로 설정
	          } else {
	              plevel = productQnaDAO.getProductPlevel(productQna.getParno()) + 1; // 부모 글의 plevel을 가져와서 1을 더한 값으로 설정
	          }
	          productQna.setPlevel(plevel);

	    	
	        productQnaDAO.insProductQna(productQna);
	    }

	    @Override
	    public void upProductQna(ProductQna productQna) {
	        productQnaDAO.upProductQna(productQna);
	    }

	    @Override
	    public void delProductQna(int no) {
	        productQnaDAO.delProductQna(no);
	    }

	    @Override
	    public List<ProductQna> getAnswers(int parno) {
	        return productQnaDAO.getAnswers(parno);
	    }

	    @Override
	    public int getProductPlevel(int no) {
	        return productQnaDAO.getProductPlevel(no);
	    }

	    @Override
	    public void delProductAnswers(int parno) {
	        productQnaDAO.delProductAnswers(parno);
	    }

		@Override
		public void upHits(int no) {
			productQnaDAO.upHits(no);
			
		}
	    
	
}
