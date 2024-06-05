<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Inventory List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="section">
    <div class="container">
        <h1 class="title">Inventory List</h1>
        <table class="table is-fullwidth is-striped">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Initial Price</th>
                    <th>Original Price</th>
                    <th>Amount</th>
                    <th>Remark</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="inventory" items="${inventoryList}">
                    <tr>
                        <td>${inventory.pname}</td>
                        <td>${inventory.iprice}</td>
                        <td>${inventory.oprice}</td>
                        <td>${inventory.amount}</td>
                        <td>${inventory.remark}</td>
                        <td>
                            <a class="button is-small is-info" href="${path}/inventory/getInventory.do?ino=${inventory.ino}">View</a>
                            <a class="button is-small is-warning" href="${path}/inventory/upInventory.do?ino=${inventory.ino}">Edit</a>
                            <a class="button is-small is-danger" href="${path}/inventory/delInventory.do?ino=${inventory.ino}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a class="button is-primary" href="${path}/inventory/insInventory.do">Add New Inventory</a>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
