<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert FAQ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <section class="section">
        <div class="container">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="${path}">Home</a></li>
                    <li><a href="${path}/faqList">FAQ List</a></li>
                    <li class="is-active"><a href="#" aria-current="page">Insert FAQ</a></li>
                </ul>
            </nav>
            <h2 class="title">Insert FAQ</h2>
            <form action="${path}/faq/insFaq.do" method="post">
                <div class="field">
                    <label class="label">Title</label>
                    <div class="control">
                        <input class="input" type="text" name="ftitle" required />
                    </div>
                </div>
                <div class="field">
                    <label class="label">Content</label>
                    <div class="control">
                        <textarea class="textarea" name="fcontent" required></textarea>
                    </div>
                </div>
                <div class="control">
                    <button class="button is-link" type="submit">Submit</button>
                </div>
            </form>
            <a href="${path}/faq/faqList.do" class="button is-link">Back to FAQ List</a>
        </div>
    </section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
