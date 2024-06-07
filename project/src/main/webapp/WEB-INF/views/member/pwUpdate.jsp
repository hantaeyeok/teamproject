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
	<title>비밀번호 수정</title>
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
			    <li><a href="${path }">비밀번호 수정</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<div class="page-wrap">
	    		<div class="clr-fix">
	                <h2 class="page-title">비밀번호 수정</h2>
		            <hr>
		            <form action="${path }/member/pwUpdatePro.do" method="post">
		                <div class="table_form_wrap">
		                    <table class="table_form">
		                        <tbody>
		                        <tr>
		                            <th><label for="pw">변경할 비밀번호</label></th>
		                            <td><input type="password" name="pw" id="pw"  class="input" value="" <%-- pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" --%> required>
		                                <p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th><label for="pw2">변경할 비밀번호 확인</label></th>
		                            <td><input type="password" name="pw2" id="pw2"  class="input" value="" required></td>
		                        </tr>
		                        <tr>
		                            <td colspan="2">
		                            	<div class="buttons">
			                                <input type="submit" class="button is-warning" value="비밀번호 수정">
			                                <a href="${path }/member/myInfo.do" class="button is-info">취소</a>
		                                </div>
		                            </td>
		                        </tr>
		                        </tbody>
		                    </table>
		                </div>
		            </form>
		            <script>
		                function updateCheck(f){
		                    if(f.userpw.value!=f.userpw2.value){
		                        alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
		                        return false;
		                    }
		                }
		            </script>
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