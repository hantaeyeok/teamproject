package com.project.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.domain.Inventory;

@Repository
public class InventoryDAOImpl implements InventoryDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Inventory> getInventoryList() {
		return sqlSession.selectList("inventory.getInventoryList");
	}

	@Override
	public Inventory getInventory(int ino) {
		return sqlSession.selectOne("inventory.getInventory",ino);
	}

	@Override
	public void insInventory(Inventory inventory) {
		sqlSession.insert("inventory.insInventory",inventory);
	}

	@Override
	public void upInventory(Inventory inventory) {
		sqlSession.update("inventory.upInventory",inventory);
	}

	@Override
	public void delInventory(int ino) {
		sqlSession.delete("inventory.delInventory",ino);
	}

	@Override
	public Inventory getInventoryPno(int pno) {
		return sqlSession.selectOne("inventory.getInventoryPno", pno);
	}
	
	
}
