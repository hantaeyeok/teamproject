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
<jsp:include page="../include/header.jsp"></jsp:include>
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
                      <th>Nno</th>
                      <th>Title</th>
                      <th>Content</th>
                      <th>Author</th>
                      <th>View Count</th>
                      <th>Resdate</th>
                      <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="notice" items="${noticeList}">
            <tr>
                <td>${notice.nno}</td>
                <td><a href="${path}/notice/getNotice.do?nno=${notice.nno}">${notice.title}</a></td>
                <td>${notice.content}</td>
                <td>${notice.author}</td>
                <td>${notice.vcnt}</td>
                <td><fmt:formatDate value="${notice.resdate}" pattern="yyyy-MM-dd"/></td>
                <td>
                    <a href="${path}/notice/upNotice.do?nno=${notice.nno}">Edit</a>
                    <a href="${path}/notice/delNotice.do?nno=${notice.nno}">Delete</a>
                </td>
            </tr>
        </c:forEach>
               </tbody>
            </table>
    <a href="${path}/notice/insNotice.do">Insert Notice</a>
            <div class="btn-group"></div>
       </div>
    </section>
    </div>

<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
