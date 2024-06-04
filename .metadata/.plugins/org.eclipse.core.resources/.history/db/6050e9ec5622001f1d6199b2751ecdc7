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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판등록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <header class="insqna_header"></header>
    <div class="container">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="${path}">홈</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li class="is-active"><a href="#" aria-current="page">질문 답변</a></li>
            </ul>
        </nav>
        <hr>
        <h2 class="title is-3 has-text-centered">QNA 등록</h2>
        <div class="box">
            <form action="${path}/qna/insQna.do" method="post" enctype="multipart/form-data">
               <div class="field">
                <label class="label">카테고리</label>
                <div class="control">
                    <select name="qcate" id="qcate" required>
                        <option value="">카테고리를 선택하세요</option>
                        <option value="제품">제품</option>
                        <option value="배송">배송</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
            	</div>
                
                <div class="field">
                    <label class="label" for="title">글제목:</label>
                    <div class="control">
                        <input class="input" type="text" id="title" name="title" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label" for="content">내용:</label>
                    <div class="control">
                        <textarea class="textarea" id="content" name="content" required placeholder="내용을 입력해주세요"></textarea>
                    </div>
                </div>
              <div class="field">
              
                <label class="label">사진첨부1</label>
                <div class="control">
                    <input class="input" type="file" name="qimg1" id="qimg1">
                </div>
            </div>
            <div class="field">
                <label class="label">사진첨부2</label>
                <div class="control">
                    <input class="input" type="file" name="qimg2" id="qimg2">
                </div>
            </div>
                
                <input type="hidden" name="parno" value="0">
                <input type="hidden" name="plevel" value="1">
                <input type="hidden" name="hits" value="0">
                <div class="buttons is-right">
                    <button class="button is-primary" type="submit">등록하기</button>
                    <button class="button is-light" type="button" onclick="history.back()">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
