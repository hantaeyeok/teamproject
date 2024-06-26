package com.project.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.domain.Sales;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override 
	public List<Sales> getSalesList() {
		return sqlSession.selectList("sales.getSalesList");
	}

	@Override
	public Sales getSales(int sno) {
		return sqlSession.selectOne("sales.getSales",sno);
	}

	@Override
	public void insSales(Sales sales) {
		sqlSession.insert("sales.insSales",sales);
	}

	@Override
	public void upSales(Sales sales) {
		sqlSession.update("sales.upSales",sales);
	}

	@Override
	public void delSales(int sno) {
		sqlSession.delete("sales.delSales",sno);
	}
	
	
}
