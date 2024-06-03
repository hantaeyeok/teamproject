package com.project.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Product;
import com.project.per.ProductDAO;

@Service 
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Product> getProductList() {
		return productDAO.getProductList();
	}

	@Override
	public Product getProduct(int pno) {
		return productDAO.getProduct(pno);
	}

	@Override
	public void insProduct(Product product) {
		productDAO.insProduct(product);
	}

	@Override
	public void upProduct(Product product) {
		productDAO.upProduct(product);
	}

	@Override
	public void delProduct(int pno) {
		productDAO.delProduct(pno);
	}

	@Override
	public int getTotalCount() {
		return productDAO.getTotalCount();
	}

	@Override
	public List<Product> getProductCateList(String pcate) {
		return productDAO.getProductCateList(pcate);
	}
	
	
}
