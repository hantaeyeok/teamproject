package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SalesInventoryProductVO {
    private int sno;
    private int pno;
    private int amount;
    private int tot;
    private String id;
    private String paymethod;
    private String paynum;
    private String addr;
    private String tel;
    private String delcom;
    private String deltel;
    private String delno;
    private String delstatus;
    private String st;
    private String salesResdate;
    private String gtid;
    private String rname;
    private int ino;
    private String pname;
    private int iprice;
    private int oprice;
    private int inventoryAmount;
    private String remark;
    private String inventoryResdate;
    private String productName;
    private int productPrice;
    private double avgTotalSales;
    private int sumTotalSales;
}

/*
public interface SalesInventoryProductService {
    List<SalesInventoryProductVO> getSalesInventoryProductList();
    SalesStatistics getSalesStatistics();
}

@Service
public class SalesInventoryProductServiceImpl implements SalesInventoryProductService {

    @Autowired
    private SalesInventoryProductMapper salesInventoryProductMapper;

    @Override
    public List<SalesInventoryProductVO> getSalesInventoryProductList() {
        return salesInventoryProductMapper.getSalesInventoryProductList();
    }

    @Override
    public SalesStatistics getSalesStatistics() {
        return salesInventoryProductMapper.getSalesStatistics();
    }
}

//controller
@Controller
@RequestMapping("/salesInventoryProduct/")
public class SalesInventoryProductController {

    @Autowired
    private SalesInventoryProductService salesInventoryProductService;

    @GetMapping("getSalesInventoryProductList.do")
    public String getSalesInventoryProductList(Model model) {
        List<SalesInventoryProductVO> salesInventoryProductList = salesInventoryProductService.getSalesInventoryProductList();
        SalesStatistics salesStatistics = salesInventoryProductService.getSalesStatistics();
        model.addAttribute("salesInventoryProductList", salesInventoryProductList);
        model.addAttribute("salesStatistics", salesStatistics);
        return "salesInventoryProduct/getSalesInventoryProductList";
    }
}


}



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales and Inventory Product List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
    <section class="section">
        <div class="container">
            <h1 class="title">Sales and Inventory Product List</h1>

            <h2 class="subtitle">Statistics</h2>
            <div class="box">
                <p><strong>Average Total Sales:</strong> ${salesStatistics.avgTotalSales}</p>
                <p><strong>Sum Total Sales:</strong> ${salesStatistics.sumTotalSales}</p>
                <p><strong>Total Sales Count:</strong> ${salesStatistics.totalSalesCount}</p>
            </div>

            <h2 class="subtitle">Details</h2>
            <table class="table is-striped is-fullwidth">
                <thead>
                    <tr>
                        <th>SNO</th>
                        <th>PNO</th>
                        <th>Product Name</th>
                        <th>Sales Amount</th>
                        <th>Total</th>
                        <th>Sales Date</th>
                        <th>Inventory Amount</th>
                        <th>Inventory Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${salesInventoryProductList}">
                        <tr>
                            <td>${item.sno}</td>
                            <td>${item.pno}</td>
                            <td>${item.productName}</td>
                            <td>${item.amount}</td>
                            <td>${item.tot}</td>
                            <td><fmt:formatDate value="${item.salesResdate}" pattern="yyyy-MM-dd"/></td>
                            <td>${item.inventoryAmount}</td>
                            <td><fmt:formatDate value="${item.inventoryResdate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</body>
</html>


*/