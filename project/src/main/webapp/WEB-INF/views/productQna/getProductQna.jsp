<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QnA 상세보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section>
    <div class="container">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="${path}">홈</a></li>
                <li><a href="${path}/product/getProduct.do?pno=${productQna.pno}">제품</a></li>
                <li class="is-active"><a href="#" aria-current="page">QnA 상세보기</a></li>
            </ul>
        </nav>
        <hr>
        <h2 class="title is-3 has-text-centered">QnA 상세보기</h2>
        <div class="box">
            <table class="table is-fullwidth">
                <tbody>
                    <tr>
                        <th>제목</th>
                        <td>${productQna.title}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>${productQna.content}</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${productQna.name}</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><fmt:formatDate value="${productQna.resdate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td>${productQna.hits}</td>
                    </tr>
                    <!-- 이미지 없을 경우 이미지 없애는 부분 만들기 -->
                    <tr>
                        <th>질문 이미지1</th>
                        <td><img src="${path}/resources/upload/${productQna.qimg1}" alt="질문 이미지 1"></td>
                    </tr>
                    <tr>
                        <th>질문 이미지2</th>
                        <td><img src="${path}/resources/upload/${productQna.qimg2}" alt="질문 이미지 2"></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="has-text-right">
                            <a href="${path}/productQna/upProductQna.do?no=${productQna.no}" class="button is-small is-warning">수정</a>
                            <form action="${path}/productQna/delProductQna.do" method="post" style="display:inline;">
                                <input type="hidden" name="no" value="${productQna.no}">
                                <input type="hidden" name="pno" value="${productQna.pno}">
                                <button type="submit" class="button is-small is-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<section>
	<div class="container">
        <h2 class="title is-4 has-text-centered">답변</h2>
        <div class="box">
            <c:if test="${not empty answerList}">
                <table class="table is-fullwidth">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>액션</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="answer" items="${answerList}">
                            <tr class="answer-row">
                                <td>${answer.no}</td>
                                <td><a href="#" class="answer-toggle" data-id="${answer.no}">${answer.title}</a></td>
                                <td>${answer.name}</td>
                                <td><fmt:formatDate value="${answer.resdate}" pattern="yyyy-MM-dd"/></td>
                                <td>
                                    <a href="${path}/productQna/upProductQnaAnswer.do?no=${answer.no}" class="button is-small is-warning">수정</a>
                                    <form action="${path}/productQna/delProductQna.do" method="post" style="display:inline;">
                                        <input type="hidden" name="no" value="${answer.no}">
                                        <input type="hidden" name="pno" value="${productQna.pno}">
                                        <button type="submit" class="button is-small is-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                                    </form>
                                </td>
                            </tr>
                            <tr id="answer-detail-${answer.no}" class="answer-detail" style="display: none;">
                                <td colspan="5">
                                    <p><strong>내용:</strong> ${answer.content}</p>
                                    <c:if test="${not empty answer.pimg1}">
                                        <p><strong>이미지1:</strong> <img src="${path}/resources/upload/${answer.pimg1}" alt="답변 이미지 1"></p>
                                    </c:if>
                                    <c:if test="${not empty answer.pimg2}">
                                        <p><strong>이미지2:</strong> <img src="${path}/resources/upload/${answer.pimg2}" alt="답변 이미지 2"></p>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty answerList}">
                <p>등록된 답변이 없습니다.</p>
            </c:if>
        </div>
     </div>
</section>   
<section>
	<div class="container">
        <div class="box">
            <form action="${path}/productQna/insAnswer.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="parno" value="${productQna.no}">
                <div class="field">
                    <label class="label">답변 제목</label>
                    <div class="control">
                        <input class="input" type="text" name="title" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label">답변 내용</label>
                    <div class="control">
                        <textarea class="textarea" name="content" required></textarea>
                    </div>
                </div>
                <div class="field">
                    <label class="label">답변 이미지1</label>
                    <div class="control">
                        <input class="input" type="file" name="pimg1">
                    </div>
                </div>
                <div class="field">
                    <label class="label">답변 이미지2</label>
                    <div class="control">
                        <input class="input" type="file" name="pimg2">
                    </div>
                </div>
                <div class="buttons is-right">
                    <button class="button is-primary" type="submit">답변 등록</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
	//상세보기 토글 스크립트
    $(document).ready(function(){
        $(".answer-toggle").click(function(e){
            e.preventDefault();
            var answerId = $(this).data("id");
            $("#answer-detail-" + answerId).toggle();
        });
    });
</script>
<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
