package com.project.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Sales;
import com.project.per.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	@Override
    public List<Sales> getSalesList() {
        return salesDAO.getSalesList();
    }

    @Override
    public Sales getSales(int sno) {
        return salesDAO.getSales(sno);
    }

    @Override
    public void insSales(Sales sales) {
        salesDAO.insSales(sales);
    }

    @Override
    public void upSales(Sales sales) {
        salesDAO.upSales(sales);
    }

    @Override
    public void delSales(int sno) {
        salesDAO.delSales(sno);
    }
	
}
