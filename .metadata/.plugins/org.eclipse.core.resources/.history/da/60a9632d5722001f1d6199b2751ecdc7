<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Question</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <div class="container mt-5">
        <h2 class="title">Edit Question</h2>
        <form action="${path}/qna/upQna.do" method="post">
            <input type="hidden" name="no" value="${qna.no}">
            <div class="field">
                <label class="label" for="title">Title:</label>
                <div class="control">
                    <input class="input" type="text" id="title" name="title" value="${qna.title}" required>
                </div>
            </div>
            <div class="field">
                <label class="label" for="content">Content:</label>
                <div class="control">
                    <textarea class="textarea" id="content" name="content" required>${qna.content}</textarea>
                </div>
            </div>
            <div class="buttons">
                <button type="submit" class="button is-primary">Update</button>
                <a href="${path}/qna/getQna.do?no=${qna.no}" class="button is-secondary">Back to Question</a>
            </div>
        </form>
    </div>
<jsp:include page="../include/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
</body>
</html>
