<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>getNotice(공지사항 상세보기)</title>
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
        <h2 class="page_title">공지사항 상세보기</h2>
        <div class="page_wrap clr-fix">
		   <table border="1">
		       <tr>
		           <th>번호</th>
		           <td>${notice.nno}</td>
		       </tr>
		       <tr>
		           <th>제목</th>
		           <td>${notice.title}</td>
		       </tr>
		       <tr>
		           <th>내용</th>
		           <td>${notice.content}</td>
		       </tr>
		       <tr>
		           <th>작성자</th>
		           <td>${notice.author}</td>
		       </tr>
		       <tr>
		           <th>조회수</th>
		           <td>${notice.vcnt}</td>
		       </tr>
		       <tr>
		           <th>등록 일</th>
		           <td><fmt:formatDate value="${notice.resdate}" pattern="yyyy-MM-dd"/></td>
		       </tr>
		       <tr>
		           <th>이미지1</th>
		           <td><img src="${path}/resources/upload/${notice.img1}"/></td>
		       </tr>
		       <tr>
		           <th>이미지2</th>
		           <td><img src="${path}/resources/upload/${notice.img2}"/></td>
		       </tr>
		   </table>
	<!-- mcode 로 권한 부여할 부분 :  -->
	   <a href="${path}/notice/upNotice.do?nno=${notice.nno}">공지사항 수정</a>
	   <a href="${path}/notice/delNotice.do?nno=${notice.nno}">공지사항 삭제</a>
	   
	   <!-- 여기는 모든 사용자 다가능해야함. -->
	   <a href="${path}/notice/noticeList.do">돌아가기</a>
	   </div>
    </section>
    </div>
<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
