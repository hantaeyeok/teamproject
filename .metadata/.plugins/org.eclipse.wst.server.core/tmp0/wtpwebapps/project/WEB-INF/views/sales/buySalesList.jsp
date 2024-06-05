<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구매 리스트</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<div class="full-wrap">
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
    <main id="contents" class="contents">
        <div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="${path}">Home</a></li>
                    <li class="is-active"><a href="#" aria-current="page">구매 리스트</a></li>
                </ul>
            </nav>
        </div>
        <section class="page" id="page1">
            <h2 class="page-title">구매 리스트</h2>
            <div class="page-wrap">
                <div class="clr-fix">
                    <br>
                    <table class="table is-fullwidth is-striped">
                        <thead>
                            <tr>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>가격</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${basket}">
                                <tr>
                                    <td>${item.product.pname}</td>
                                    <td>${item.quantity}</td>
                                    <td><fmt:formatNumber value="${item.product.price}" type="currency"/></td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                   <a href="${path}/sales/insSales.do" class="button is-primary">구매하기</a>
                </div>
            </div>
        </section>
    </main>
<footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</div>
</body>
</html>