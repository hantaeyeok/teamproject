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
<jsp:include page="../include/header.jsp"></jsp:include>
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
		           <th>Nno</th>
		           <td>${notice.nno}</td>
		       </tr>
		       <tr>
		           <th>Title</th>
		           <td>${notice.title}</td>
		       </tr>
		       <tr>
		           <th>Content</th>
		           <td>${notice.content}</td>
		       </tr>
		       <tr>
		           <th>Author</th>
		           <td>${notice.author}</td>
		       </tr>
		       <tr>
		           <th>View Count</th>
		           <td>${notice.vcnt}</td>
		       </tr>
		       <tr>
		           <th>Resdate</th>
		           <td><fmt:formatDate value="${notice.resdate}" pattern="yyyy-MM-dd"/></td>
		       </tr>
		       <tr>
		           <th>img1</th>
		           <td><img src="${path}/resources/upload/${notice.img1}"/></td>
		       </tr>
		       <tr>
		           <th>img2</th>
		            <td><img src="${path}/resources/upload/${notice.img2}"/></td>
		       </tr>
		   </table>
	   <a href="${path}/notice/upNotice.do?nno=${notice.nno}">Edit</a>
	   <a href="${path}/notice/delNotice.do?nno=${notice.nno}">Delete</a>
	   <a href="${path}/notice/noticeList.do">Back to List</a>
	   </div>
    </section>
    </div>

<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
