package com.project.per;

import java.util.List;

import com.project.domain.Sales;

public interface SalesDAO {
	List<Sales> getSalesList();
    Sales getSales(int sno);
    void insSales(Sales sales);
    void upSales(Sales sales);
    void delSales(int sno);
}
