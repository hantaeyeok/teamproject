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
    <title>제품 등록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section class="section">
    <div class="container">
        <h1 class="title">제품 등록</h1>
        <form action="${path}/product/insProduct.do" method="post" enctype="multipart/form-data">
            <div class="field">
                <label class="label">카테고리</label>
                <div class="control">
                    <select name="pcate" id="pcate" required>
                        <option value="">카테고리를 선택하세요</option>
                        <option value="notebook">노트북</option>
                        <option value="phone">스마트폰</option>
                        <option value="tablet">태블릿</option>
                        <option value="watch">스마트워치</option>
                        <option value="earphone">이어폰</option>
                        <option value="new">신상품</option>
                    </select>
                </div>
            </div>
            <div class="field">
                <label class="label">제품명</label>
                <div class="control">
                    <input class="input" type="text" name="pname" placeholder="제품명" required>
                </div>
            </div>
            <div class="field">
                <label class="label">가격</label>
                <div class="control">
                    <input class="input" type="number" name="price" placeholder="가격" required>
                </div>
            </div>
            
            <div class="field">
                <label class="label">상세설명1</label>
                <div class="control">
                    <textarea class="textarea" name="pcontext1" placeholder="상세설명1" required></textarea>
                </div>
            </div>
            <div class="field">
                <label class="label">상세설명2</label>
                <div class="control">
                    <textarea class="textarea" name="pcontext2" placeholder="상세설명2" required></textarea>
                </div>
            </div>
            <div class="field">
                <label class="label">썸네일 이미지</label>
                <div class="control">
                    <input class="input" type="file" name="img1" id="img1" required>
                </div>
            </div>
            <div class="field">
                <label class="label">상세페이지 이미지 1</label>
                <div class="control">
                    <input class="input" type="file" name="img2" id="img2" >
                </div>
            </div>
            <div class="field">
                <label class="label">상세페이지 이미지 2</label>
                <div class="control">
                    <input class="input" type="file" name="img3" id="img3" >
                </div>
            </div>
            <div class="field">
                <label class="label">상세페이지 이미지 3</label>
                <div class="control">
                    <input class="input" type="file" name="img4" id="img4" >
                </div>
            </div>
            
            <div class="field">
                <label class="label">a/s기간</label>
                <div class="control">
                    <input class="input" type="number" name="asdate" placeholder="as기간" required>
                </div>
            </div>
            
            
            
            <div class="field is-grouped">
                <div class="control">
                    <button type="submit" class="button is-link">등록</button>
                </div>
                <div class="control">
                    <button type="reset" class="button is-link is-light">취소</button>
                </div>
            </div>
        </form>
    </div>
</section>
<footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
