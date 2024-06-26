<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html lang="ko">
<head>
	<title>Home</title>
	<jsp:include page="include/head.jsp"></jsp:include> 
</head>
<body>
<header>
	<jsp:include page="include/header.jsp"></jsp:include>
</header>
	<section>
		<h1> !List 바로가기! </h1>
		<h3> <a href="${path}/qna/qnaList.do">qnaList</a> </h3>
		
		<h3> <a href="${path}/fqq/faqList.do">faqList</a> </h3>
		
		<h3> <a href="${path}/product/productList.do">productList</a> </h3>
		
		<h3> <a href="${path}/inventory/getInventoryList.do">getInventoryList</a> </h3>
		
		<h3> <a href="${path}/sales/getSalesList.do">getInventoryList</a> </h3>
		<input type="hidden" name="mcode" value="${member.mcode}"/>
		<p> mcode: ${sessoin.mcode} </p>
		<p> mcode: ${mcode} </p>
		<p> mcode: ${member.mcode} </p>
		<p> mcode: ${member.getMcode()} </p>
		<p> mcode: ${member.getMcode()} </p>
		
		<h3> <a href="${path}/sales/getSalesList.do">getInventoryList</a> </h3>
		<h3> <a href="${path}/sales/getSalesList.do">getInventoryList</a> </h3>
		<h3> <a href="${path}/sales/getSalesList.do">getInventoryList</a> </h3>
	</section>
<footer>
	<jsp:include page="include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
