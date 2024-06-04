<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <div class="container">
        <div class="breadcrumb">
            <p><a href="${path}">홈</a> <a href="${path}/community">커뮤니티</a> <span>공지사항</span></p>
        </div>
        <hr>
        <h2 class="title is-3">공지사항 수정</h2>
        <div class="box">
            <form action="${path}/notice/upProNotice.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="nno" value="${notice.nno}">
                <div class="field">
                    <label class="label">제목</label>
                    <div class="control">
                        <input class="input" type="text" name="title" value="${notice.title}" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label">내용</label>
                    <div class="control">
                        <textarea class="textarea" name="content" required>${notice.content}</textarea>
                    </div>
                </div>
                <div class="field">
                    <label class="label">작성자</label>
                    <div class="control">
                        <input class="input" type="text" name="author" value="${notice.author}" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label">이미지 1</label>
                    <div class="control">
                        <input class="input" type="file" name="img1">
                        <c:if test="${not empty notice.img1}">
                            <img src="${path}/resources/upload/${notice.img1}" alt="Image 1" style="width:100px;height:auto;">
                        </c:if>
                    </div>
                </div>
                <div class="field">
                    <label class="label">이미지 2</label>
                    <div class="control">
                        <input class="input" type="file" name="img2">
                        <c:if test="${not empty notice.img2}">
                            <img src="${path}/resources/upload/${notice.img2}" alt="Image 2" style="width:100px;height:auto;">
                        </c:if>
                    </div>
                </div>
                <div class="field is-grouped">
                    <div class="control">
                        <button type="submit" class="button is-link">수정</button>
                    </div>
                    <div class="control">
                        <a href="${path}/notice/getNotice.do?nno=${notice.nno}" class="button is-light">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
