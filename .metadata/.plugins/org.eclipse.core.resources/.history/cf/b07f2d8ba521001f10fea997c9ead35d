<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="fpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Footer - 하이트진로</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    <style>
        #footer { padding: 40px 100px 40px 0; background: #292929; color: #fff; font-size: 12px; text-align: center;}
        .dropdown.is-active .dropdown-menu { display: block; }
        .dropdown.is-up .dropdown-trigger { border-bottom: none; }
        .dropdown.is-up .dropdown-menu { top: auto; bottom: 100%; margin-bottom: 4px; }
        .policy, .site_sns, .familysite { padding: 10px 0; margin-top: 20px; background-color: #1f1f1f; }
    </style>
</head>
<body>
    <footer id="footer">
        <div class="container">
            <!-- 정책 및 SNS 링크 드롭다운 -->
            <div class="dropdown is-up">
                <div class="dropdown-trigger">
                    <button class="button" aria-haspopup="true" aria-controls="policy-dropdown-menu">
                        <span>정책 및 SNS 링크</span>
                        <span class="icon is-small">
                            <i class="fas fa-angle-up" aria-hidden="true"></i>
                        </span>
                    </button>
                </div>
                <div class="dropdown-menu" id="policy-dropdown-menu" role="menu">
                    <div class="dropdown-content">
                        <a href="/customer/privacy_policy.asp" class="dropdown-item">개인정보처리방침</a>
                        <a href="/customer/cust_agree.asp" class="dropdown-item">회원이용약관</a>
                        <a href="/customer/email_protect.asp" class="dropdown-item">이메일무단수집거부</a>
                        <a href="/esg/partnership.asp" class="dropdown-item">동반성장</a>
                        <a href="/esg/ethical_mng.asp" class="dropdown-item">청음고(부정제보)</a>
                        <a href="/company/rule.asp" class="dropdown-item">공시정보 관리규정</a>
                        <a href="/esg/justice_bsn.asp" class="dropdown-item">공정거래자율준수</a>
                    </div>
                </div>
            </div>

            <!-- 하이트진로 SNS 드롭다운 -->
            <div class="dropdown is-up">
                <div class="dropdown-trigger">
                    <button class="button" aria-haspopup="true" aria-controls="sns-dropdown-menu">
                        <span>하이트진로 SNS</span>
                        <span class="icon is-small">
                            <i class="fas fa-angle-up" aria-hidden="true"></i>
                        </span>
                    </button>
                </div>
                <div class="dropdown-menu" id="sns-dropdown-menu" role="menu">
                    <div class="dropdown-content">
                        <a href="https://www.facebook.com/HITEJINRO.kr" class="dropdown-item" target="_blank">페이스북</a>
                        <a href="https://twitter.com/Beer2DAY" class="dropdown-item" target="_blank">트위터</a>
                        <a href="https://www.youtube.com/user/hitevideo" class="dropdown-item" target="_blank">유튜브</a>
                        <a href="http://www.beer2day.com/" class="dropdown-item" target="_blank">블로그</a>
                        <!-- Additional SNS links -->
                    </div>
                </div>
            </div>

            <!-- 패밀리 사이트 드롭다운 -->
            <div class="dropdown is-up">
                <div class="dropdown-trigger">
                    <button class="button" aria-haspopup="true" aria-controls="family-dropdown-menu">
                        <span>패밀리 사이트</span>
                        <span class="icon is-small">
                            <i class="fas fa-angle-up" aria-hidden="true"></i>
                        </span>
                    </button>
                </div>
                <div class="dropdown-menu" id="family-dropdown-menu" role="menu">
                    <div class="dropdown-content">
                        <a href="http://www.hitejinroholdings.com" class="dropdown-item" target="_blank">하이트진로 홀딩스</a>
                        <a href="https://hitejinroamerica.com" class="dropdown-item" target="_blank">진로 아메리카</a>
                        <a href="http://www.hitejinrobeverage.com" class="dropdown-item" target="_blank">하이트진로음료㈜</a>
                        <a href="http://www.blueheron.co.kr" class="dropdown-item" target="_blank">블루헤런</a>
                        <a href="http://www.jinro.co.jp" class="dropdown-item" target="_blank">진로 재팬</a>
                        <!-- Additional family site links -->
                    </div>
                </div>
            </div>
        </div>
        <div class="address_tel">
            <address class="address">(06075) 서울특별시 강남구 영동대로 714 하이트진로빌딩</address>
            <p class="tel"><strong>대표전화</strong> 02-3219-0114 / <strong>사업자등록번호</strong> 214-81-00777</p>
        </div>
        <p class="copyright">
            Copyright&copy; 2016 HITEJINRO CO.LTD. ALL RIGHTS RESERVED.
        </p>
    </footer>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var dropdowns = document.querySelectorAll('.dropdown');
            dropdowns.forEach(function(dropdown) {
                dropdown.addEventListener('click', function(event) {
                    event.stopPropagation();
                    dropdown.classList.toggle('is-active');
                });
            });

            window.addEventListener('click', function(e) {
                if (!e.target.matches('.dropdown-trigger button')) {
                    dropdowns.forEach(function(dropdown) {
                        if (dropdown.classList.contains('is-active')) {
                            dropdown.classList.remove('is-active');
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
