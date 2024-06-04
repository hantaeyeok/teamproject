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
    <title>상품 정보 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="full-wrap">
    <!-- 헤더 부분 인클루드 -->
    <header id="hd">
        <div class="container">
            <jsp:include page="../include/header.jsp"></jsp:include>
        </div>
    </header>
    <main id="contents" class="contents">
        <div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="${path2}">Home</a></li>
                    <li><a href="${path2}/product/list.do">상품</a></li>
                    <li class="is-active"><a href="#" aria-current="page">상품 정보 수정</a></li>
                </ul>
            </nav>
        </div>
        <section class="section">
            <div class="container">
                <h1 class="title">상품 정보 수정</h1>
                <div class="box">
                    <form action="${path2}/product/updatePro.do" method="post" enctype="multipart/form-data">
                        <div class="field">
                            <label class="label" for="cate">카테고리</label>
                            <div class="control">
                                <div class="select">
                                    <select name="cate" id="cate" required>
                                        <option value="">선택 안함</option>
                                        <option value="beer" ${product.cate == 'beer' ? 'selected' : ''}>맥주</option>
                                        <option value="soju" ${product.cate == 'soju' ? 'selected' : ''}>소주</option>
                                        <option value="wine" ${product.cate == 'wine' ? 'selected' : ''}>와인</option>
                                        <option value="others" ${product.cate == 'others' ? 'selected' : ''}>기타 주류</option>
                                        <option value="new" ${product.cate == 'new' ? 'selected' : ''}>신제품</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="pname">상품명</label>
                            <div class="control">
                                <input type="hidden" name="pno" id="pno" value="${product.pno}" readonly>
                                <input class="input" type="text" name="pname" id="pname" maxlength="100" value="${product.pname}" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="context">상품 설명</label>
                            <div class="control">
                                <textarea class="textarea" name="context" id="context" rows="8">${product.context}</textarea>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="price">가격</label>
                            <div class="control">
                                <input class="input" type="number" min="0" step="100" name="price" id="price" value="${product.price}" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="img">상품 메인이미지</label>
                            <div class="control">
                                <input class="input" type="file" name="img" id="img" accept="image/*">
                                <br>현재 이미지: <img src="${path2}/uploads/${product.img}" width="100">
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="img2">상품 상세 이미지</label>
                            <div class="control">
                                <input class="input" type="file" name="img2" id="img2" accept="image/*">
                                <br>현재 이미지: <img src="${path2}/uploads/${product.img2}" width="100">
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="img3">상품 썸네일 이미지</label>
                            <div class="control">
                                <input class="input" type="file" name="img3" id="img3" accept="image/*">
                                <br>현재 이미지: <img src="${path2}/uploads/${product.img3}" width="100">
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="com">제조사</label>
                            <div class="control">
                                <textarea class="textarea" name="com" id="com" rows="8" maxlength="980">${product.com}</textarea>
                            </div>
                        </div>
                        <div class="field is-grouped">
                            <div class="control">
                                <button class="button is-danger" type="submit">수정 완료</button>
                            </div>
                            <div class="control">
                                <a class="button is-primary" href="${path2}/product/productList.do">상품 목록</a>
                            </div>
                            <div class="control">
                                <a class="button is-success" href="${path2}/product/getProduct.do?pno=${product.pno}">상품 정보 상세보기</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
        <jsp:include page="../include/footer.jsp"></jsp:include>
    </footer>
</div>
</body>
</html>
