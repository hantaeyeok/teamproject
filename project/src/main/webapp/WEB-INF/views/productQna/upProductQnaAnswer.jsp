<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>답변 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>
    <div class="container">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="${path}">홈</a></li>
                <li><a href="#">제품</a></li>
                <li class="is-active"><a href="#" aria-current="page">답변 수정</a></li>
            </ul>
        </nav>
        <hr>
        <h2 class="title is-3 has-text-centered">답변 수정</h2>
        <div class="box">
            <form action="${path}/productQna/upProductQnaAnswer.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="no" value="${productQna.no}">
                <div class="field">
                    <label class="label">제목</label>
                    <div class="control">
                        <input class="input" type="text" name="title" value="${productQna.title}" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label">내용</label>
                    <div class="control">
                        <textarea class="textarea" name="content" required>${productQna.content}</textarea>
                    </div>
                </div>
                <div class="field">
                    <label class="label">답변 이미지1</label>
                    <div class="control">
                        <input class="input" type="file" name="pimg1">
                        <br>현재 이미지: <img src="${path}/resources/upload/${productQna.pimg1}" width="100" height="100">
                    </div>
                </div>
                <div class="field">
                    <label class="label">답변 이미지2</label>
                    <div class="control">
                        <input class="input" type="file" name="pimg2">
						<br>현재 이미지: <img src="${path}/resources/upload/${productQna.pimg2}" width="100" height="100">
                    </div>
                </div>
                <div class="buttons is-right">
                    <button class="button is-primary" type="submit">수정하기</button>
                    <button class="button is-light" type="button" onclick="history.back()">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
