<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QNA 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <div class="container">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="${path}">홈</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li class="is-active"><a href="#" aria-current="page">QNA</a></li>
            </ul>
        </nav>
        <h2 class="title is-3">QNA 목록</h2>
        <div class="table-container">
            <table class="table is-fullwidth is-striped">
                <thead>
                    <tr>
                    	<th>분류</th>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
              		<c:forEach var="qna" items="${qnaList}">
                        <c:if test="${qna.parno == 0}">
                            <tr>
                            	<td>${qna.qcate}</td>
                                <td>${qna.no}</td>
                                <td><a href="${path}/qna/getQna.do?no=${qna.no}">${qna.title}</a></td>
                                <td>${qna.id}</td>
                                <td>${qna.hits}</td>
                                <td><fmt:formatDate value="${qna.resdate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            <c:forEach var="answer" items="${qnaList}">
                                <c:if test="${answer.parno == qna.no}">
                                    <tr style="background-color: #f9f9f9;">
                                    	<td></td>
                                    	<td></td>
                                        <td style="padding-left: 30px;">↳ ${answer.title}</td>
                                        
                                        <td>${answer.id}</td>
                                        <td>${answer.hits}</td>
                                        <td><fmt:formatDate value="${answer.resdate}" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <div class="buttons is-right">
                <a href="${path}/qna/insQna.do" class="button is-primary">질문등록</a>
            </div>
        </div>
    </div>
<jsp:include page="../include/footer.jsp"></jsp:include>
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<!-- 답글 레벨을 표시하기 위해 FontAwesome 아이콘을 사용  -->
</body>
</html>
 <!-- 
                    <c:forEach var="qna" items="${qnaList}">
                        <tr>
                            <td>${qna.no}</td>
                            <td>
                                <c:forEach var="i" begin="1" end="${qna.plevel}">
                                    <span class="icon is-small"><i class="fas fa-reply"></i></span>
                                </c:forEach>
                                <a href="${path}/qna/getQna.do?no=${qna.no}">${qna.title}</a>
                            </td>
                            <td>${qna.content}</td>
                            <td>${qna.id}</td>
                            <td>${qna.hits}</td>
                            <td><fmt:formatDate value="${qna.resdate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                  -->
                  <!-- 
                   <c:forEach var="qna" items="${qnaList}">
                    <tr class="${qna.parno != 0 ? 'nested' : ''}">
                        <td>${qna.no}</td>
                        <td><a href="${path}/qna/getQna.do?no=${qna.no}">${qna.title}</a></td>
                        <td>${qna.id}</td>
                        <td>${qna.hits}</td>
                        <td><fmt:formatDate value="${qna.resdate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
                -->
                <!-- 
                 <c:if test="${qna.parno == 0}">
                        <c:forEach var="answer" items="${qnaList}">
                            <c:if test="${answer.parno == qna.no}">
                                <div class="box" style="margin-left: 20px;">
                                    <h4 class="title is-5">답변: ${answer.title}</h4>
                                    <p>작성자: ${answer.id}</p>
                                    <p>작성일: <fmt:formatDate value="${answer.resdate}" pattern="yyyy년 MM월 dd일"/></p>
                                    <p>내용: ${answer.content}</p>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                     -->