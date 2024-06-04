<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sales Detail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="section">
    <div class="container">
        <h1 class="title">Sales Detail</h1>
        <table class="table is-fullwidth">
            <tr>
                <th>Product No</th>
                <td>${sales.pno}</td>
            </tr>
            <tr>
                <th>Amount</th>
                <td>${sales.amount}</td>
            </tr>
            <tr>
                <th>Total</th>
                <td>${sales.tot}</td>
            </tr>
            <tr>
                <th>ID</th>
                <td>${sales.id}</td>
            </tr>
            <tr>
                <th>Pay Method</th>
                <td>${sales.paymethod}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${sales.addr}</td>
            </tr>
            <tr>
                <th>Tel</th>
                <td>${sales.tel}</td>
            </tr>
            <tr>
                <th>Delivery Company</th>
                <td>${sales.delcom}</td>
            </tr>
            <tr>
                <th>Delivery Tel</th>
                <td>${sales.deltel}</td>
            </tr>
            <tr>
                <th>Delivery No</th>
                <td>${sales.delno}</td>
            </tr>
            <tr>
                <th>Delivery Status</th>
                <td>${sales.delstatus}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>${sales.st}</td>
            </tr>
            <tr>
                <th>Resdate</th>
                <td>${sales.resdate}</td>
            </tr>
            <tr>
                <th>GT ID</th>
                <td>${sales.gtid}</td>
            </tr>
            <tr>
                <th>Receiver Name</th>
                <td>${sales.rname}</td>
            </tr>
        </table>
        <a class="button is-light" href="${path}/sales/getSalesList.do">Back</a>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
