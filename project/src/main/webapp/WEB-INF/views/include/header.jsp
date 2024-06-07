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
    
     
	//header 새창 관련 함수
	  function openLoginWindow() {
	      var loginWindow = window.open("${hpath}/member/login.do", "Login", "width=900,height=600");
	      window.addEventListener("message", receiveMessage, false);
	
	      function receiveMessage(event) {
	          if (event.origin !== "http://localhost:8091") {
	              return;
	          }
	          sessionStorage.setItem('sid', event.data.sid);
	          
	          if (loginWindow) {
	              loginWindow.close();
	          }
	          window.location.reload();
	      }
	  }

	//로그아웃 함수
	function logout() {
	    sessionStorage.removeItem('sid');
	    window.location.href = '${hpath}/member/logout.do';
	}
	
	//장바구니 숫자 올라가는 함수
	function updateCartCount() {
	    var cartCountElement = document.getElementById('cart-count');
	    var basket = JSON.parse(sessionStorage.getItem('basket')) || [];
	    cartCountElement.textContent = basket.length;
	}
	
	//장바구니 데이터 임시 저장하는 함후 
	function syncBasketWithSession() {
	    fetch("${hpath}/basket/syncBasket.do")
	        .then(response => response.json())
	        .then(data => {
	            sessionStorage.setItem('basket', JSON.stringify(data));
	            updateCartCount();
	        });
	}
	
	window.onload = function() {
	    updateCartCount();
	    syncBasketWithSession();
	};
    </script>
    <style>
        .navbar-dropdown {
            min-width: 250px;
        }
        .cart-count {
            position: absolute;
            top: 5px;
            right: 5px;
            background: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
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
                        <a class="navbar-item" id="memberPageLink" href="${hpath}/member/myInfo.do">마이페이지</a>
                        <c:if test="${sessionScope.smcode!=2}">
                            <a class="navbar-item" id="adminPageLink" href="${hpath}/admin/adminHome.do">관리자페이지</a>
                        </c:if>
                    </c:when>
                </c:choose>
            </div>
            <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                    	<c:if test="${empty sessionScope.sid }">
	                        <a class="button is-light" id="loginButton" onclick="openLoginWindow()">로그인</a>
	                        <a class="button is-primary" id="signupButton" href="${hpath}/member/agree.do">회원가입</a>
                        </c:if>
                        <c:if test="${not empty sessionScope.sid }">
                        	<a class="button is-danger" id="logoutButton" onclick="logout()">로그아웃</a>
                        </c:if>
                    </div>
                    <a href="${hpath}/basket/basketList.do" class="button is-light">
                            장바구니
                            <span id="cart-count" class="cart-count">0</span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</body>
</html>
