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
    <title>productList</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .product-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .product-card img {
            max-width: 100%;
            height: auto;
        }
        .product-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }
        .product-price {
            color: #28a745;
            font-size: 16px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
    <div class="container">
   		 <a href="${path}/product/insProduct.do" class="button is-primary">제품 등록</a>
    <div class="tab_box">
                <div class="tabs">
                  <ul>
                    <li><a href="${path}/product/productList.do" class="navbar-item" title="전체">전체 상품</a></li>
                    <li><a href="${path}/product/getProductCateList.do?pcate=notebook" class="navbar-item" title="노트북">노트북</a></li>
                    <li><a href="${path}/product/getProductCateList.do?pcate=phone" class="navbar-item" title="스마트폰">스마트폰</a></li>
                    <li><a href="${path}/product/getProductCateList.do?pcate=tablet" class="navbar-item" title="태블릿">태블릿</a></li>
                    <li><a href="${path}/product/getProductCateList.do?pcate=watch" class="navbar-item" title="스마트워치">스마트 워치</a></li>
                    <li><a href="${path}/product/getProductCateList.do?pcate=earphone" class="navbar-item" title="이어폰">이어폰</a></li>
                    <li><a href="${path}/product/getProductCateList.do?pcate=new" class="navbar-item" title="신상품">new</a></li>
                  
                  </ul>
                </div>
            </div>
        <h1 class="mt-4">productList</h1>
        <div class="row">
            <c:forEach var="product" items="${productList}">
                <div class="col-md-4">
                    <div class="product-card">
                        <a href="${path}/product/getProduct.do?pno=${product.pno}"><img src="${path}/resources/upload/${product.img1}" alt="${product.pname}"></a>
                        <div class="product-title">${product.pname}</div>
                        <div class="product-price">${product.price}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <footer>
        <jsp:include page="../include/footer.jsp"></jsp:include>
    </footer>
    
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
