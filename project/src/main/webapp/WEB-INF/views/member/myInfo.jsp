<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="full-wrap">
	<header id="hd" class="header">
		<div class="container">
			<jsp:include page="../include/header.jsp"></jsp:include>
		</div>
	</header>
</div>
<div class="container">
	<main class="contents">
		<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			  <ul>
			    <li><a href="${path }">Home</a></li>
			    <li><a href="${path }">마이페이지</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">마이페이지</h2>
    		<hr>
    		<div class="page-wrap">
	    		<div class="clr-fix">
	                <table class="table_form">
	                    <tbody>
		                    <tr>
		                        <th>아이디</th>
		                        <td>${cus.id }</td>
		                    </tr>
		                    <tr>
		                        <th>이름</th>
		                        <td>${cus.name }</td>
		                    </tr>
		                    <tr>
		                        <th>전화번호</th>
		                        <td>${cus.tel }</td>
		                    </tr>
		                    <tr>
		                        <th>이메일</th>
		                        <td>${cus.email }</td>
		                    </tr>
		                    <tr>
		                        <th>생년월일</th>
		                        <td><fmt:formatDate value="${cus.birth }" pattern="yyyy년 MM월 dd일"/></td>
		                    </tr>
		                    <tr>
		                        <th>주소</th>
		                        <td>
		                            기본 주소 : ${cus.addr1 } <br>
		                            상세 주소 : ${cus.addr2 }
		                        </td>
		                    </tr>
		                    <tr>
		                        <td colspan="2">
		                        	<div class="buttons">
			                            <c:if test="${cus.mcode!=2 }">
			                                <a href="${path }/admin/memberDelete.do?id=${aid }" class="button is-danger is-dark">직권 강퇴</a>
			                                <a href="${path }/admin/list.do" class="button is-primary">회원 목록</a>
			                            </c:if>
			                            <c:if test="${cus.mcode==2 }">
			                            	<a href="${path }/member/myUpdate.do" class="button is-warning">회원 정보수정</a>
			                            	<a href="${path }/member/pwUpdate.do" class="button is-warning">비밀번호 수정</a>
			                                <a href="${path }/member/memberDelete.do?id=${cus.id }" class="button is-danger is-dark">회원 탈퇴</a>
			                            </c:if>
			                        </div>    
		                        </td>
		                    </tr>
	                    </tbody>
	                </table>
	            </div>
	        </div>    
        </section>
	</main>
</div>
<!-- 푸터 부분 인클루드 -->
<div class="full-wrap">
	<footer id="ft">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</div>
</body>
</html>