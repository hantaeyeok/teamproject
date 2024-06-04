<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제품 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
        .product-card {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            border: 1px solid #e1e1e1;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .product-card img {
            max-width: 150px;
            margin-right: 20px;
        }
        .product-info {
            flex: 1;
        }
    </style>
</head>
<body>
<header>
<jsp:include page="../include/header.jsp"></jsp:include>
</header>
    <section class="section">
        <div class="container">
            <h1 class="title">제품 목록</h1>
            <a href="${path}/product/productRegister.do" class="button is-primary">제품 등록</a>
            <div class="product-list">
                <c:forEach var="product" items="${productList}">
                    <div class="product-card">
                        <div class="product-image">
                            <a href="${path}/product/getProduct.do?pno=${product.pno}"><img src="${path}/resources/upload/${product.img}" alt="${product.pname}"></a>
                        </div>
                        <div class="product-info">
                            <h2 class="title is-4">${product.pname}</h2>
                            <p class="subtitle is-6">${product.cate}</p>
                            <p class="has-text-weight-bold"><fmt:formatNumber value="${product.price}" type="currency"/></p>
                            <p>${product.com}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
