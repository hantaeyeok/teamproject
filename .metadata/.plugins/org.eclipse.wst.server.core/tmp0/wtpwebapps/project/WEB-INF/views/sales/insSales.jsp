<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구매하기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        #tb1 tr td, #tb1 tr th { line-height:48px; padding-top:0px; }
        #tb1 tr td div { line-height:48px; margin-top:10px; }
        #tb1 tr td div input { height:42px; margin-top:5px; }
    </style>
</head>
<body>
<div class="full-wrap">
    <header id="hd">
        <div class="container">
            <jsp:include page="../include/header.jsp"></jsp:include>
        </div>
    </header>
    <main id="contents" class="contents">
        <div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="${path}">Home</a></li>
                    <li><a href="${path}/product/listAll.do">상품</a></li>
                    <li class="is-active"><a href="#" aria-current="page">구매</a></li>
                </ul>
            </nav>
        </div>
        <section class="page" id="page1">
            <h2 class="page-title">상품 구매</h2>
            <div class="page-wrap">
                <div class="clr-fix">
                    <br>
                    <form action="${path}/sales/insSales.do" method="post">
                        <table class="table" id="tb1">
                            <thead>
                                <tr>
                                    <th>제품명</th>
                                    <th>수량</th>
                                    <th>단가</th>
                                    <th>총 가격</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${basket}">
                                    <tr>
                                        <td>${item.product.pname}</td>
                                        <td>${item.quantity}</td>
                                        <td><fmt:formatNumber value="${item.product.price}" type="currency"/></td>
                                        <td><fmt:formatNumber value="${item.product.price * item.quantity}" type="currency"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <hr>
                        <div class="field">
                            <label class="label">결제 정보</label>
                            <div class="control">
                                <input type="hidden" name="paymethod" id="paymethod" />
                                <input type="hidden" name="paynum" id="paynum" />
                                <button type="button" id="payBtn" class="button is-danger">결제</button>
                                <div id="msg"></div>
                            </div>
                        </div>
                        <hr>
                        <div class="field">
                            <label class="label">배송 정보</label>
                            <div class="control">
                                <label>주문자: </label>
                                <strong>${cus.name}</strong>
                                <br>
                                <label>수신자</label>
                                <input type="text" name="rname" id="rname" class="input" required />
                                <br>
                                <label>우편번호</label>
                                <input type="text" name="postcode" id="postcode" class="input" required>
                                <br>
                                <button type="button" id="isAddrBtn" class="button is-link" onclick="findAddr()">주소 입력</button>
                                <input type="hidden" name="addr" id="addr" />
                                <br>
                                <label>기본 주소</label>
                                <input type="text" name="addr1" id="addr1" class="input" required>
                                <br>
                                <label>상세 주소</label>
                                <input type="text" name="addr2" id="addr2" class="input" required>
                                <br>
                                <label>연락처</label>
                                <input type="tel" name="tel" id="tel" class="input" required>
                            </div>
                        </div>
                        <hr>
                        <div class="buttons">
                            <button type="submit" class="button is-danger" id="salesBtn">구매</button>
                            <a href="${path}/product/listAll.do" class="button is-primary">상품 목록으로</a>
                        </div>
                    </form>
                    
                    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <script>
                    function findAddr() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                var roadAddr = data.roadAddress;
                                var jibunAddr = data.jibunAddress;
                                document.getElementById("postcode").value = data.zonecode;
                                if(roadAddr !== '') {
                                    document.getElementById("addr1").value = roadAddr;
                                } else if(jibunAddr !== ''){
                                    document.getElementById("addr1").value = jibunAddr;
                                }
                                document.getElementById("addr2").focus();
                            }
                        }).open();
                    }
                    </script>
                    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
                    <script>
                    $(document).ready(function(){
                        $("#addr2").focusout(function(){
                            $("#addr").val($("#addr1").val() + " " + $("#addr2").val() + " " + $("#postcode").val());
                        });
                        
                        $("#payBtn").click(function(){
                            var money = 0;
                            $(".totalPrice").each(function(){
                                money += parseInt($(this).text().replace(/[^0-9]/g, ""));
                            });
                            var code = `${code}`;
                            console.log("결제");
                            IMP.init(code);
                            IMP.request_pay({
                                pg: "danal_tpay",
                                pay_method: "card",
                                merchant_uid: 'merchant_' + new Date().getTime(),
                                name: "상품 결제",
                                amount: money,
                                buyer_email: "${cus.email}",
                                buyer_name: "${cus.name}",
                                buyer_tel: "${cus.tel}",
                                buyer_postcode: "${cus.postcode}",
                                buyer_addr: "${cus.addr1} ${cus.addr2}"
                            }, function(rsp){
                                var gt_id = "12345678";
                                var card_name = "삼성카드";
                                var card_number = "1234567890123";
                                var pay_method = "card";
                                var amount = money;
                                
                                if (rsp.success) {
                                    gt_id = rsp.apply_num;
                                    pay_method = rsp.pay_method;
                                    
                                    console.log('PG사 구분코드 : ' + rsp.pg_provider);
                                    console.log('고유ID : ' + rsp.imp_uid);
                                    console.log('상점 거래ID : ' + rsp.merchant_uid);
                                    console.log('결제 수단 : ' + rsp.pay_method);
                                    console.log('결제 금액 : ' + rsp.paid_amount);
                                    console.log('거래 매출전표 URL : ' + rsp.receipt_url);
                                    console.log('결제 통화 : ' + rsp.currency);
                                    console.log('거래 승인번호 : ' + rsp.apply_num);
                                    
                                    if(rsp.pay_method=='card') {
                                        console.log('신용 카드 이름 : ' + rsp.card_name);
                                        console.log('신용 카드 번호 : ' + rsp.card_number);
                                        card_name = rsp.card_name;
                                        card_number = rsp.card_number;
                                    }
                                    
                                    if(rsp.pay_method=='vbank') {
                                        console.log('가상계좌 입금 계좌번호 : ' + rsp.vbank_num);
                                        console.log('가상계좌 입금 은행명 : ' + rsp.vbank_name);
                                        console.log('가상계좌 입금 예금주 : ' + rsp.vbank_holder);
                                    }
                                    
                                    if(rsp.pay_method=='trans') {}
                                    
                                    if(rsp.pay_method=='phone') {}
                                    
                                    if(rsp.pay_method=='samsung') {}
                                    
                                    if(rsp.pay_method=='kakaopay') {}
                                    
                                    if(rsp.pay_method=='naverpay') {}
                                    
                                } else {
                                    console.log('에러 코드 : '+rsp.error_code);
                                    console.log('에러 메시지 : '+rsp.error_msg);
                                }
                                
                                console.log('결제 상태 : '+rsp.status);
                                
                                pay_num = card_name + " : " + card_number;
                                
                                var msg = "";
                                msg += "결제수단 : " + pay_method + "<br>";
                                msg += "결제번호 : " + pay_num + "<br>";
                                msg += "결제금액 : " + amount + "<br>";
                                msg += "거래 승인 번호 : " + gt_id + "<br>";
                                
                                $("#paymethod").val(pay_method);  
                                $("#paynum").val(pay_num);
                                $("#gtid").val(gt_id);
                                
                                $("#msg").html(msg);
                                $(".result_item").css("display", "");
                                $("#salesBtn").css("display", "inline-block");
                            });
                        });
                    });
                    </script>
                </div>
            </div>
        </section>
    </main>
    <footer id="ft">
        <jsp:include page="../include/footer.jsp"></jsp:include>
    </footer>
</div>
</body>
</html>
