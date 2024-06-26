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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                                    <th>이미지</th>
                                    <th>제품명</th>
                                    <th>수량</th>
                                    <th>단가</th>
                                    <th>총 가격</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${basket}">
                                    <tr>
                                        <td><img src="${path}/resources/upload/${item.product.img1}" style="width:100px; height:100px;"/></td>
                                        <td>${item.product.pname}</td>
                                        <td>${item.quantity}</td>
                                        <td><fmt:formatNumber value="${item.product.price}" type="currency"/></td>
                                        <td><fmt:formatNumber value="${item.product.price * item.quantity}" type="currency"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="field">
                            <label class="label">배송 정보</label>
                            <div class="control">
                                <label>주문자: </label>
                                <strong>${member.name}</strong>
                                <br>
                                <label>수신자</label>
                                <input type="text" name="rname" id="rname" class="input" value="${member.name}" required>
                                <br>
                                <label>우편번호</label>
                                <input type="text" name="postcode" id="postcode" class="input" value="${member.postcode}" required>
                                <br>
                                <button type="button" id="isAddrBtn" class="button is-link" onclick="findAddr()">주소 입력</button>
                                <input type="hidden" name="addr" id="addr" value="${member.addr1}"/>
                                <br>
                                <label>기본 주소</label>
                                <input type="text" name="addr1" id="addr1" class="input" value="${member.addr1}" required>
                                <br>
                                <label>상세 주소</label>
                                <input type="text" name="addr2" id="addr2" class="input" value="${member.addr2}" required>
                                <br>
                                <label>연락처</label>
                                <input type="tel" name="tel" id="tel" class="input" value="${member.tel}" required>
                            </div>
                        </div>
                        <hr>
                        <div class="field">
                            <label class="label">결제 정보</label>
                            <div class="control">
                                <input type="hidden" name="paymethod" id="paymethod" />
                                <input type="hidden" name="paynum" id="paynum" />
                                <input type="hidden" name="gtid" id="gtid" value="${gtid}" />
                                <input type="hidden" name="impUid" id="impUid" value="${code}" />
                                <input type="hidden" name="merchantUid" id="merchantUid" />
                                <button type="button" id="payBtn" class="button is-danger">결제</button>
                                <div id="msg"></div>
                            </div>
                        </div>
                        <div class="buttons">
                            <button type="submit" class="button is-danger" id="salesBtn">구매</button>
                            <a href="${path}/product/listAll.do" class="button is-primary">상품 목록으로</a>
                        </div>
                    </form>
                    
                   <script>
                function findAddr() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            console.log(data);
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
            	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				
				<!-- 결제 API -->
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
				<script>
				$(document).ready(function(){
					
					$("#addr2").focusout(function(){
						$("#addr").val($("#addr1").val()+"   "+$("#addr2").val()+"   "+$("#postcode").val());
					});
					
					$(".change_item").css("display", "none");
					$(".result_item").css("display", "none");
					$("#salesBtn").css("display", "none");
					
					$("#cnt").on("change", function(){
						$("#amount").val(parseInt($("#price").val())*parseInt($("#cnt").val()));
						$(".change_item").css("display", "");	
					});
					
					$("#cnt").on("keyup", function(){
						$("#amount").val(parseInt($("#price").val())*parseInt($("#cnt").val()));
						$(".change_item").css("display", "");	
					});
					
					$("#payBtn").click(function(){
						var money = parseInt($("#amount").val());
						var code = `${code}`;
						var merchantUid = 'merchant_' + new Date().getTime();
						console.log("결제");
				        IMP.init(code); // 가맹점 식별코드로 Iamport 초기화
				        IMP.request_pay({ // 결제 요청
				            pg: "danal_tpay",   // PG사 설정
				            pay_method: "card", // 결제 방법
				            merchant_uid: merchantUid, // 주문 번호
				            name: $("#pname").val(), // 상품 이름
				            amount: money, // 결제 가격
				            buyer_email: $("#email").val(),
				            buyer_name: $("#name").val(), // 구매자 이름 (buyer_ 부분은 꼭 작성하지 않아도된다. (선택사항))
				            buyer_tel: $("#custel").val(), // 구매자 연락처
				            buyer_postcode: $("#cuspostcode").val(), // 구매자 우편번호
				            buyer_addr: $("#cusaddr").val() // 구매자 주소
				        }, function(rsp){
				        	
				        	var gt_id = "12345678";	//거래 승인 번호
				        	var card_name = "삼성카드";
				        	var card_number = "1234567890123";
				        	var pay_method = "card";
				        	var amount = money;
				        	
				        	if (rsp.success) {
				        		//결제 성공시 처리하는 구문들
					        	gt_id = rsp.apply_num;
					        	pay_method = rsp.pay_method;
					        	
					        	console.log('PG사 구분코드 : ' + rsp.pg_provider);
					        	console.log('고유ID : ' + rsp.imp_uid);
					        	console.log('상점 거래ID : ' + rsp.merchant_uid);
					        	console.log('결제 수단 : ' + rsp.pay_method);
					        	console.log('결제 금액 : ' + rsp.paid_amount);
					        	console.log('거래 매출전표 URL : ' + rsp.receipt_url);
					        	console.log('결제 통화 : '+rsp.currency);
					        	console.log('거래 승인번호 : ' + rsp.apply_num);
					        	
					        	if(rsp.pay_method=='card') { //카드인 경우
					        		console.log('신용 카드 이름 : ' + rsp.card_name);
					        		console.log('신용 카드 번호 : ' + rsp.card_number);
						        	card_name = rsp.card_name;
						        	card_number = rsp.card_number;
					        	}
					        	
					        	if(rsp.pay_method=='vbank') { //가상 계좌인 경우
						        	console.log('가상계좌 입금 계좌번호 : ' + rsp.vbank_num);
						        	console.log('가상계좌 입금 은행명 : ' + rsp.vbank_name);
						        	console.log('가상계좌 입금 예금주 : ' + rsp.vbank_holder);
					        	}
					        	
					        	if(rsp.pay_method=='trans') { //실시간 계좌이체인 경우
					        		//결제 응답 파라미터 참조
					        	}
					        	
					        	if(rsp.pay_method=='phone') { //휴대폰 소액결제인 경우
					        		//결제 응답 파라미터 참조	
					        	}						        	

					        	if(rsp.pay_method=='samsung') { //삼성페이인 경우
					        		//결제 응답 파라미터 참조
					        	}
					        	
					        	if(rsp.pay_method=='kakaopay') { //카카오페이인 경우
					        		//결제 응답 파라미터 참조
					        	}
					        	
					        	if(rsp.pay_method=='naverpay') { //네이버페이인 경우
					        		//결제 응답 파라미터 참조
					        	}
					        	
					        	//여기에 나머지 코딩
					        	
					        	
				        	} else {
				        		//결제가 실패되었을 경우
				        		console.log('에러 코드 : '+rsp.error_code);
				        		console.log('에러 메시지 : '+rsp.error_msg);
				        	}
				        	
				        	console.log('결제 상태 : '+rsp.status);
				        	
				        	
				        	/* 아래 코드는 부분은 원래 if (rsp.success) { ... } 블록의 가장 아래에 넣어야 합니다.
				        		연습이므로 밖에 기술하였음
				        	*/
				        	
				        	pay_num = card_name+" : "+card_number;
				        	
				        	var msg = "";
				        	msg += "결제수단 : "+pay_method+"<br>";
				        	msg += "결제번호 : "+pay_num+"<br>";
				        	msg += "결제금액 : "+money+"<br>";
				        	msg += "거래 승인 번호 : "+gt_id+"<br>";
				        	
				        	$("#status").val("pay");
				        	$("#merchantUid").val(merchantUid);
				        	
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
			<!-- 
				<script>
			
				$(document).ready(function(){
				    // #ck2 checkbox가 클릭되었을 때
				    $("#ck2").click(function(){
				        // 체크 상태를 확인하여 작업을 수행
				        if($(this).is(':checked')){
				            // 체크되었을 때 실행할 작업
				       		$("#rname").val($("#name").val());
				       		$("#addr1").val($("#cusaddr").val());
				       		$("#addr2").val($("#cusaddr2").val());
				       		$("#postcode").val($("#cuspostcode").val());
				       		$("#tel").val($("#custel").val());
				       		$("#isAddrBtn").css("display","none");
				        } else {
				            // 체크가 해제되었을 때 실행할 작업
				       		$("#rname").val("");
				       		$("#addr1").val("");
				       		$("#addr2").val("");
				       		$("#postcode").val("");
				       		$("#tel").val("");
				       		$("#isAddrBtn").css("display","inline-block");
				        }
				    });
				});
				</script>
				 -->
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
