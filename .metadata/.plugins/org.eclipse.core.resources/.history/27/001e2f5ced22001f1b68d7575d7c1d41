<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sales List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="section">
    <div class="container">
        <h1 class="title">Sales List</h1>
        <table class="table is-fullwidth is-striped">
            <thead>
                <tr>
                    <th>Product No</th>
                    <th>Amount</th>
                    <th>Total</th>
                    <th>ID</th>
                    <th>Pay Method</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sales" items="${salesList}">
                    <tr>
                        <td>${sales.pno}</td>
                        <td>${sales.amount}</td>
                        <td>${sales.tot}</td>
                        <td>${sales.id}</td>
                        <td>${sales.paymethod}</td>
                        <td>${sales.addr}</td>
                        <td>
                            <a class="button is-small is-info" href="${path}/sales/getSales.do?sno=${sales.sno}">View</a>
                            <a class="button is-small is-warning" href="${path}/sales/upSales.do?sno=${sales.sno}">Edit</a>
                            <a class="button is-small is-danger" href="${path}/sales/delSales.do?sno=${sales.sno}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a class="button is-primary" href="${path}/sales/insSales.do">Add New Sales</a>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
