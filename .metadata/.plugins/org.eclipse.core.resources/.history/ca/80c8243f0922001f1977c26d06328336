<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제품 상세 보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section class="section">
    <div class="container">
        <h1 class="title">제품 상세 보기</h1>
        <div class="box">
            <div class="columns">
                <div class="column is-one-third">
                    <figure class="image">
                        <img src="${path}/resources/upload/${product.img1}" alt="${product.pname}">
                    </figure>
                </div>
                <div class="column">
                    <h2 class="title is-2">${product.pname}</h2>
                    <p class="subtitle is-4">종류 : ${product.pcate}</p>
                    <p>가격 : <fmt:formatNumber value="${product.price}" type="currency"/></p>
                    <p>상세 내용1 : ${product.pcontext1}</p>
                    <p>상세 내용2 : ${product.pcontext2}</p>
                    <!-- 
                    <p>등록 일 :  ${product.resdate}</p>
                     -->
                    <p>등록 일 : <fmt:formatDate value="${product.resdate}" pattern="yyyy년 MM월 dd일"/></p>
                   
                    <div class="field">
                        <label class="label">추가 이미지</label>
                        <div class="control">
                            <figure class="image is-300x300">
                                <img src="${path}/resources/upload/${product.img2}" alt="${product.pname} - 추가 이미지 1">
                            </figure>
                            <br>
                            <figure class="image is-300x300">
                                <img src="${path}/resources/upload/${product.img3}" alt="${product.pname} - 추가 이미지 2">
                            </figure>
                        </div>
                    </div>
                    
                    <div class="field is-grouped">
                        <div class="control">
                            <a href="${path}/product/productList.do" class="button is-link">목록으로</a>
                        </div>
                        <div class="control">
                            <a href="${path}/product/upProduct.do?pno=${product.pno}" class="button is-warning">수정</a>
                        </div>
                        <!-- 
                        <div class="control">
                            <form action="${path}/exproduct/exproductDelete.do" method="post" style="display:inline;">
                                <input type="hidden" name="pno" value="${product.pno}">
                                <button type="submit" class="button is-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                            </form>
                        </div>
                         -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
