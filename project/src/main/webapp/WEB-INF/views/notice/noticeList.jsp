<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Notice List(공지사항)</title>
</head>
<body>
<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>
    <div class="boarddiv">
      <section class="page" id="page1">
        <div class="breadcrumb">
            <p><a href="${path}">홈</a><a href="${path}/community">커뮤니티</a><span>공지사항</span></p>
        </div>
        <hr>
        <h2 class="page_title">공지사항 목록</h2>
        <div class="page_wrap clr-fix" style="padding-bottom: 90px;">
            <table class="tb1">
                <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>내용</th>
                      <th>저자</th>
                      <th>조회수</th>
                      <th>등록일</th>
                      <th>비고</th>
                    </tr>
                </thead>
           		<tbody>
           			 <c:forEach var="notice" items="${noticeList}">
		            	<tr>
		                <td>${notice.nno}</td>
		                <td><a href="${path}/notice/getNotice.do?nno=${notice.nno}">${notice.title}</a></td>
		                <!--타이틀 말고 다른 부분 클릭하고 상세보기 들어가려면 위에 a태그 위치 변경 -->
		                <td>${notice.content}</td>
		                <td>${notice.author}</td>
		                <td>${notice.vcnt}</td>
		                <td><fmt:formatDate value="${notice.resdate}" pattern="yyyy-MM-dd"/></td>
		                <!-- 이부분 수정 삭제 mcode 권한으로 c태그 사용 : 사용하며 비고 같이 수정해야함. -->
		                <td>
		                    <a href="${path}/notice/upNotice.do?nno=${notice.nno}">공지사항 수정</a>
		                    <a href="${path}/notice/delNotice.do?nno=${notice.nno}">공지사항 삭제</a>
		                </td>
           				</tr>
        			</c:forEach>
               </tbody>
            </table>
        <!-- mcode 부분 : 클릭하고 상세보기  -->
    	<a href="${path}/notice/insNotice.do">공지사항 추가</a>
        	<div class="btn-group"></div>
       </div>
    </section>
   </div>
<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
