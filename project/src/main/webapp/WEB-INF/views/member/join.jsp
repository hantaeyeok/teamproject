<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
        .join-form {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
    </style>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script>
        function findPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById('addr1').value = data.address;
                }
            }).open();
        }
        
        function equalPasswords(){
            var pw = document.getElementById('pw').value;
            var pw1 = document.getElementById('pw1').value;
            if(pw != pw1){
                alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
                return false;
            }
            return true;
        }
        
        function checkId() {
            var id = document.getElementById('id').value;
            if (id === "") {
                alert("아이디를 입력해주세요.");
                return false;
            }
            
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "${path}/member/idCheck.do", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.result) {
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("이미 사용 중인 아이디입니다.");
                    }
                }
            };
            xhr.send("id=" + id);
        }
    </script>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section class="section">
    <div class="container join-form">
        <h1 class="title has-text-centered">회원가입</h1>
        <form action="${path}/member/join.do" method="post" onsubmit="return equalPasswords();">
            <div class="field">
                <label class="label">아이디</label>
                <div class="control">
                    <input class="input" type="text" id="id" name="id" placeholder="아이디" required>
                    <button type="button" class="button is-link" onclick="checkId()">ID 중복확인</button>
                </div>
            </div>

            <div class="field">
                <label class="label">비밀번호</label>
                <div class="control">
                    <input class="input" id="pw" type="password" name="pw" placeholder="비밀번호" required>
                </div>
            </div>
            
            <div class="field">
                <label class="label">비밀번호확인</label>
                <div class="control">
                    <input class="input" id="pw1"  type="password" name="pw1" placeholder="비밀번호 확인" required>
                </div>
            </div>

            <div class="field">
                <label class="label">이름</label>
                <div class="control">
                    <input class="input" type="text" name="name" placeholder="이름" required>
                </div>
            </div>

            <div class="field">
                <label class="label">이메일</label>
                <div class="control">
                    <input class="input" type="email" name="email" placeholder="이메일" required>
                </div>
            </div>

            <div class="field">
                <label class="label">생년월일</label>
                <div class="control">
                    <input class="input" type="date" name="birth" required>
                </div>
            </div>
            
            <div class="field">
                <label class="label">전화번호</label>
                <div class="control">
                    <input class="input" type="tel" name="tel" placeholder="전화번호" required>
                </div>
            </div>

            <div class="field">
                <label class="label">우편번호</label>
                <div class="control">
                    <input class="input" type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
                    <button type="button" class="button is-link" onclick="findPostcode()">우편번호 찾기</button>
                </div>
            </div>

            <div class="field">
                <label class="label">주소</label>
                <div class="control">
                    <input class="input" type="text" id="addr1" name="addr1" placeholder="주소" readonly>
                </div>
            </div>
            
            <div class="field">
                <label class="label">상세주소</label>
                <div class="control">
                    <input class="input" type="text" id="addr2" name="addr2" placeholder="상세주소">
                </div>
            </div>

            <div class="field is-grouped">
                <div class="control">
                    <button type="submit" class="button is-link">회원가입</button>
                </div>
                <div class="control">
                    <button type="reset" class="button is-link is-light">취소</button>
                </div>
            </div>
        </form>
    </div>
</section>
<footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
