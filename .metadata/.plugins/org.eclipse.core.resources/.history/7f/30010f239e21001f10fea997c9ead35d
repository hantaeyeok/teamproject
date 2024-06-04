<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <section class="section">
        <div class="container">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="${path}">Home</a></li>
                    <li><a href="${path}/community">고객지원ㄴ</a></li>
                    <li class="is-active"><a href="#" aria-current="page">FAQ</a></li>
                </ul>
            </nav>
            <h2 class="title">FAQ List</h2>
            <table class="table is-fullwidth">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Content</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="faq" items="${faqList}">
                        <tr>
                            <td><a href="${path}/faq/getFaq.do?fno=${faq.fno}">${faq.ftitle}</a></td>
                            <td>${faq.fcontent}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="${path}/faq/insFaq.do">질문등록</a>
    </section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
