<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
        .login-form {
            width: 400px;
            margin: 100px auto;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .is-grouped .control {
        	display: flex;
            margin: 0 auto;
        }
    </style>
    <script>
    	//로그인 성공 시
        function loginSuccess(sid) {
            window.opener.postMessage({ sid: sid }, "http://localhost:8091");
            window.close();
        }
        
        //취소 버튼 클릭 시
        function cancel() {
            window.close(); //창 닫기
        }
        
        //회원가입 버튼 클릭 시
        function signUp() {
        	if (window.opener) {
                window.opener.location.href = "${path}/member/agree.do";
                window.close(); // 현재 로그인 창을 닫습니다.
            }
        }
    </script>
</head>
<body>
    <section class="section">
        <div class="container login-form">
            <h1 class="title has-text-centered">로그인</h1>
            <form action="${path}/member/loginPro.do" method="post">
                <div class="field">
                    <label class="label">아이디</label>
                    <div class="control">
                        <input class="input" type="text" name="id" placeholder="아이디" required>
                    </div>
                </div>

                <div class="field">
                    <label class="label">비밀번호</label>
                    <div class="control">
                        <input class="input" type="password" name="pw" placeholder="비밀번호" required>
                    </div>
                </div>

                <div class="field is-grouped">
                    <div class="control">
                        <button type="submit" class="button is-link">로그인</button>
                    </div>
                    <div class="control">
                        <button type="reset" class="button is-link is-light" onclick="cancel()">취소</button>
                    </div>
                </div>
                
                <div class="field is-grouped">
                    <div class="control">
                        <button type="button" class="button is-link is-light" onclick="cancel()">아이디 찾기</button>
                    </div>
                    <div class="control">
                        <button type="button" class="button is-link is-light" onclick="cancel()">비밀번호 찾기</button>
                    </div>
                    <div class="control">
                        <button type="button" class="button is-link is-light" onclick="signUp()">회원가입</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
</body>
</html>
