<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>하이트진로</title>
    <link rel="stylesheet" href="${hpath}/resources/css/common.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <script>
    
        function checkLogin() {
            var sid = sessionStorage.getItem('sid');
            if (sid) {
                document.getElementById('loginButton').style.display = 'none';
                document.getElementById('logoutButton').style.display = 'block';
                document.getElementById('signupButton').style.display = 'none';
            } else {
                document.getElementById('loginButton').style.display = 'block';
                document.getElementById('logoutButton').style.display = 'none';
                document.getElementById('signupButton').style.display = 'block';
            }
        }
        window.onload = checkLogin;

        
        //header 새창 관련 함수
        function openLoginWindow() {
            var loginWindow = window.open("${hpath}/member/login.do", "Login", "width=600,height=600");
            window.addEventListener("message", receiveMessage, false);

            function receiveMessage(event) {
                if (event.origin !== "http://localhost:8091") {
                    return;
                }
                sessionStorage.setItem('sid', event.data.sid);
                checkLogin();
                if (loginWindow) {
                    loginWindow.close();
                }
                window.location.reload();
            }
        }

        //로그아웃 함수
        function logout() {
            sessionStorage.removeItem('sid');
            checkLogin();
            window.location.href = '${hpath}/member/logout.do';
        }
    </script>
    <style>
        .navbar-dropdown {
            min-width: 250px;
        }
    </style>
</head>
<body>
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="${hpath}/">
                <img src="${hpath}/resources/img/include/logo_hitejinro.png" width="112" height="28">
            </a>
        </div>

        <div id="navbarBasicExample" class="navbar-menu">
            <div class="navbar-start">
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="#">회사소개</a>
                    <div class="navbar-dropdown">
                        <a class="navbar-item" href="${hpath}/about">하이트진로 소개</a>
                        <a class="navbar-item" href="${hpath}/history">하이트진로 연혁</a>
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="#">제품</a>
                    <div class="navbar-dropdown">
                    	<a class="navbar-item" href="${hpath}/product/productList.do">전체상품</a>
                        <a class="navbar-item" href="${hpath}/product/getProductCateList.do?pcate=notebook">노트북</a>
                        <a class="navbar-item" href="${hpath}/product/getProductCateList.do?pcate=phone">스마트폰</a>
                        <a class="navbar-item" href="${hpath}/product/getProductCateList.do?pcate=tablet">태플릿</a>
                        <a class="navbar-item" href="${hpath}/product/getProductCateList.do?pcate=watch">스마트워치</a>
                        <a class="navbar-item" href="${hpath}/product/getProductCateList.do?pcate=earphone">이어폰</a>
                        <a class="navbar-item" href="${hpath}/product/getProductCateList.do?pcate=new">신상품</a>
                        
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="#">고객지원</a>
                    <div class="navbar-dropdown">
                        <a class="navbar-item" href="${hpath}/notice/noticeList.do">공지사항</a>
                        <a class="navbar-item" href="${hpath}/faq/faqList.do">FAQ</a>
                        <a class="navbar-item" href="${hpath}/qna/qnaList.do">QNA</a>
                        <a class="navbar-item" href="${hpath}/as/as.do">A/S</a>
                        <a class="navbar-item" href="${hpath}/free/freeList.do">제품등록</a>
                        
                    </div>
                </div>
                <a class="navbar-item" href="${hpath}/purchase">구매하기</a>
                <c:choose>
                    <c:when test="${not empty sessionScope.sid}">
                        <a class="navbar-item" id="memberPageLink" href="${hpath}/member/memberPage.do">마이페이지</a>
                        <c:if test="${sessionScope.sid == 'admin'}">
                            <a class="navbar-item" id="adminPageLink" href="${hpath}/admin/adminHome.do">관리자페이지</a>
                        </c:if>
                    </c:when>
                </c:choose>
            </div>
            <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                        <a class="button is-light" id="loginButton" onclick="openLoginWindow()">로그인</a>
                        <a class="button is-danger" id="logoutButton" onclick="logout()" style="display: none;">로그아웃</a>
                        <a class="button is-primary" id="signupButton" href="${hpath}/member/join.do">회원가입</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</body>
</html>
