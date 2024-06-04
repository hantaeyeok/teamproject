<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Inventory Detail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="section">
    <div class="container">
        <h1 class="title">Inventory Detail</h1>
        <div class="box">
            <p><strong>Product Name:</strong> ${inventory.pname}</p>
            <p><strong>Initial Price:</strong> ${inventory.iprice}</p>
            <p><strong>Original Price:</strong> ${inventory.oprice}</p>
            <p><strong>Amount:</strong> ${inventory.amount}</p>
            <p><strong>Remark:</strong> ${inventory.remark}</p>
            <p><strong>Date:</strong> <fmt:formatDate value="${inventory.resdate}" pattern="yyyy-MM-dd"/></p>
        </div>
        <a class="button is-primary" href="${path}/inventory/upInventory.do?ino=${inventory.ino}">Edit</a>
        <a class="button is-light" href="${path}/inventory/getInventoryList.do">Back to List</a>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
