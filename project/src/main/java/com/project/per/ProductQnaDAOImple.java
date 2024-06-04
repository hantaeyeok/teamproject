package com.project.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.domain.ProductQna;

@Repository
public class ProductQnaDAOImple implements ProductQnaDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductQna> getProductQnaList(int pno) {
		return sqlSession.selectList("productqna.getProductQnaList",pno);
	}

	@Override
	public ProductQna getProductQna(int no) {
		return sqlSession.selectOne("productqna.getProductQna",no);
	}

	@Override
	public void insProductQna(ProductQna productQna) {
		int plevel;
	    if (productQna.getParno() == 0) {
	        plevel = 0; // 최상위 글인 경우 plevel을 0으로 설정
	    } else {
	    	plevel = getProductPlevel(productQna.getParno()) + 1; // 부모 글의 plevel을 가져와서 1을 더한 값으로 설정
	    }
	    productQna.setPlevel(plevel);
		sqlSession.insert("productqna.insProductQna",productQna);
	}

	@Override
	public void upProductQna(ProductQna productQna) {
		sqlSession.update("productqna.upProductQna",productQna);
	}

	@Override
	public void delProductQna(int no) {
		sqlSession.delete("productqna.delProductQna",no);
	}

	@Override
	public List<ProductQna> getAnswers(int parno) {
		return sqlSession.selectList("productqna.getAnswers",parno);
	}

	@Override
	public int getProductPlevel(int parno) {
		return sqlSession.selectOne("productqna.getProductPlevel",parno);
	}

	@Override
	public void delProductAnswers(int parno) {
		sqlSession.delete("productqna.delProductAnswers",parno);
	}

	@Override
	public void upHits(int no) {
		sqlSession.update("productqna.upHits",no);
		
	}
	
	
	
}
