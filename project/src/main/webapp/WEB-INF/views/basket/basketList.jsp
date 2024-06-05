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
        <!-- 수량 변경 가능하게 다시 만들기! -->
        <div class="box">
            <c:if test="${not empty basket}">
                <table class="table is-fullwidth">
                    <thead>
                        <tr>
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
                                <td>${item.product.pname}</td>
                                <td><fmt:formatNumber value="${item.product.price}" type="currency"/></td>
                                <td>
                                    <div class="field has-addons">
                                        <form action="${path}/basket/updateBasket.do" method="post" id="update-form-${item.product.pno}">
                                            <input type="hidden" name="productPno" value="${item.product.pno}">
                                            <div class="control">
                                                <button type="button" class="button is-info" onclick="changeQuantity(${item.product.pno}, -1)">-</button>
                                            </div>
                                            <div class="control">
                                                <input type="number" name="quantity" value="${item.quantity}" class="input" readonly>
                                            </div>
                                            <div class="control">
                                                <button type="button" class="button is-info" onclick="changeQuantity(${item.product.pno}, 1)">+</button>
                                            </div>
                                        </form>
                                    </div>
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
function changeQuantity(productPno, delta) {
    const form = document.getElementById(`update-form-${productPno}`);
    const quantityInput = form.querySelector('input[name="quantity"]');
    let newQuantity = parseInt(quantityInput.value) + delta;
    if (newQuantity < 1) newQuantity = 1;
    quantityInput.value = newQuantity;
    form.submit();
}
</script>
</body>
</html>
