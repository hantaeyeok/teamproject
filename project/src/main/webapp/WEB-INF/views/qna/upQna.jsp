<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>QNA 수정하기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
</head>
<body>
<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>
	<div class="container mt-5">
        <h2 class="title">질문 수정</h2>
        <form action="${path}/qna/upQna.do" method="post">
            <input type="hidden" name="no" value="${qna.no}">
            <div class="field">
                <label class="label" for="title">제목 : </label>
                <div class="control">
                    <input class="input" type="text" id="title" name="title" value="${qna.title}" required>
                </div>
            </div>
            <div class="field">
                <label class="label" for="content">내용 : </label>
                <div class="control">
                    <textarea class="textarea" id="content" name="content" required>${qna.content}</textarea>
                </div>
            </div>
            <div class="buttons">
                <button type="submit" class="button is-primary">수정하기</button>
                <a href="${path}/qna/getQna.do?no=${qna.no}" class="button is-secondary">돌아가기</a>
            </div>
        </form>
    </div>
<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
