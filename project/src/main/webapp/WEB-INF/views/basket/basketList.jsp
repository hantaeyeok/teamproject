<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section class="section">
    <div class="container">
        <h1 class="title">장바구니</h1>
        <div class="box">
            <c:if test="${not empty basket}">
                <table class="table is-fullwidth">
                    <thead>
                        <tr>
                        	<th>사진</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>합계</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${basket}">
                            <tr>
                            	<td><img src="${path}/resources/upload/${item.product.img1}" style="width:100px; height:100px;"/></td>
                                <td>${item.product.pname}</td>
                                <td><fmt:formatNumber value="${item.product.price}" type="currency"/></td>
                                <td>
                                    <form id="${item.product.pno}" action="${path}/basket/updateBasket.do" method="post" style="display: inline;">
                                        <input type="hidden" name="productPno" value="${item.product.pno}">
                                        <button type="button" onclick="changeQuantity(${item.product.pno}, -1, ${item.inventory.amount})" class="button is-small">-</button>
                                        <input type="number" name="quantity" value="${item.quantity}" readonly style="width: 50px; text-align: center;">
                                        <button type="button" onclick="changeQuantity(${item.product.pno}, 1, ${item.inventory.amount})" class="button is-small">+</button>
                                    </form>
                                </td>
                                <td><fmt:formatNumber value="${item.product.price * item.quantity}" type="currency"/></td>
                                <td>
                                    <form action="${path}/basket/removeBasket.do" method="post">
                                        <input type="hidden" name="productPno" value="${item.product.pno}">
                                        <button type="submit" class="button is-danger">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="buttons is-right">
                    <a href="${path}/sales/buySalesList.do" class="button is-primary">주문하기</a>
                </div>
            </c:if>
            <c:if test="${empty basket}">
                <p>장바구니가 비어 있습니다.</p>
            </c:if>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
<script>
    function changeQuantity(productPno, delta, maxQuantity) {
    	var form = document.getElementById(productPno);
    	if (form) {
            const quantityInput = form.querySelector('input[name="quantity"]');
            if (quantityInput) {
                var newQuantity = parseInt(quantityInput.value) + delta;
                if (newQuantity < 1) newQuantity = 1;
                if (newQuantity > maxQuantity) newQuantity = maxQuantity;
                quantityInput.value = newQuantity;
                form.submit();
            }
        }
        
    }
</script>
</body>
</html>
