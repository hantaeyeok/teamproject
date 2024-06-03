<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="full-wrap">
    <main id="contents" class="contents">
        <div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
            <nav class="breadcrumb" aria-label="breadcrumbs">
              <ul>
                <li><a href="${path2}">Home</a></li>
                <li><a href="${path2}/product/list.do">상품</a></li>
                <li class="is-active"><a href="#" aria-current="page">목록</a></li>
              </ul>
            </nav>
        </div>
        <section class="page" id="page1">
            <h2 class="page-title">제품 목록</h2>
            <c:if test="${sessionScope.sid == 'admin'}">
            	<a href="${path2}/product/insProduct.do" class="button is-primary">제품 등록</a>
            </c:if>
            <div class="tab_box">
                <div class="tabs">
                  <ul>
                    <li><a href="${path2}/product/productList.do" class="navbar-item" title="전체">전체 상품</a></li>
                    <li><a href="${path2}/product/getProductCateList.do?cate=beer" class="navbar-item" title="맥주">beer</a></li>
                    <li><a href="${path2}/product/getProductCateList.do?cate=soju" class="navbar-item" title="소주">soju</a></li>
                    <li><a href="${path2}/product/getProductCateList.do?cate=wine" class="navbar-item" title="와인">wine</a></li>
                    <li><a href="${path2}/product/getProductCateList.do?cate=others" class="navbar-item" title="기타 주류">others</a></li>
                    <li><a href="${path2}/product/getProductCateList.do?cate=new" class="navbar-item" title="신상품">new</a></li>
                  </ul>
                </div>
            </div>
            
            <div class="page-wrap">
                <div class="clr-fix">
                    <br>
                    <div class="product-list">
                        <c:forEach var="product" items="${productList}">
                            <div class="product-card">
                                <div class="product-image">
                                    <a href="${path2}/product/getProduct.do?pno=${product.pno}"><img src="${path2}/resources/upload/${product.img1}" alt="${product.pname}"></a>
                                </div>
                                <div class="product-info">
                                    <h2 class="title is-4">${product.pname}</h2>
                                    <p class="subtitle is-6">${product.cate}</p>
                                    <p class="has-text-weight-bold"><fmt:formatNumber value="${product.price}" type="currency"/></p>
                                    <p>${product.com}</p>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${empty productList}">
                            <p><strong>상품이 존재하지 않습니다.</strong></p>
                        </c:if>
                    </div>
                    <hr>
                  
                </div>
            </div>
        </section>
    </main>


</div>

 <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
