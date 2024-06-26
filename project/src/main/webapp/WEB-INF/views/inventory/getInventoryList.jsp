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
        <h2> 인벤토리:재고, 입고가격, 출고가격 설정</h2>
        <table class="table is-fullwidth is-striped">
            <thead>
                <tr>
                    <th>제품 이름</th>
                    <th>Initial Price(입고가격)</th>
                    <th>Original Price(출고가격)</th>
                    <th>수량</th>
                    <th>비고</th>
                    <th>옵션</th>
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
                     	<a class="button is-small is-warning" href="${path}/inventory/upInventory.do?ino=${inventory.ino}">인벤토리 수정하기</a>
        				<a class="button is-small is-danger" href="${path}/inventory/delInventory.do?ino=${inventory.ino}">삭제하기</a>
                     </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- 인벤토리 : 재고 , 입고가격, 출고가격 설정 -->
        <a class="button is-small is-info" href="${path}/inventory/getInventory.do?ino=${inventory.ino}">인벤토리 상세보기</a>
        <a class="button is-small is-info" href="${path}/inventory/insInventory.do">재고 추가하기</a>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
