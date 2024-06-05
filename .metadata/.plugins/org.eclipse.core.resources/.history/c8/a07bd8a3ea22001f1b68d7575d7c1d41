<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Edit Inventory</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="section">
    <div class="container">
        <h1 class="title">Edit Inventory</h1>
        <form action="${path}/inventory/saveInventory.do" method="post">
            <input type="hidden" name="ino" value="${inventory.ino}">
            <div class="field">
                <label class="label">Product Name</label>
                <div class="control">
                    <input class="input" type="text" name="pname" value="${inventory.pname}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Initial Price</label>
                <div class="control">
                    <input class="input" type="number" name="iprice" value="${inventory.iprice}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Original Price</label>
                <div class="control">
                    <input class="input" type="number" name="oprice" value="${inventory.oprice}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Amount</label>
                <div class="control">
                    <input class="input" type="number" name="amount" value="${inventory.amount}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Remark</label>
                <div class="control">
                    <input class="input" type="text" name="remark" value="${inventory.remark}">
                </div>
            </div>
            <div class="field">
                <div class="control">
                    <button class="button is-primary" type="submit">Save</button>
                    <a class="button is-light" href="${path}/inventory/getInventoryList.do">Cancel</a>
                </div>
            </div>
        </form>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
