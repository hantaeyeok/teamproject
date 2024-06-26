<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제품 상세 보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section> <!-- 제품상세보기 페이지 -->
   <h1 class="title">제품 상세 보기</h1>
   <div class="box">
      <div class="columns">
         <div class="column is-one-third">
             <figure class="image is-300x300">
                 <img src="${path}/resources/upload/${product.img1}" alt="${product.pname}">
             </figure>
         </div>
         <div class="column">
             <h2 class="title is-2">${product.pname}</h2>
             <p class="subtitle is-4">종류 : ${product.pcate}</p>
             <p>가격 : <fmt:formatNumber value="${product.price}" type="currency"/></p>
             <p>상세 내용1 : ${product.pcontext1}</p>
             <p>상세 내용2 : ${product.pcontext2}</p>
             <p>등록 일 : <fmt:formatDate value="${product.resdate}" pattern="yyyy년 MM월 dd일"/></p>
             <div class="field">
                 <label class="label">추가 이미지</label>
                 <div class="control">
                     <figure class="image is-300x300">
                         <img src="${path}/resources/upload/${product.img2}" alt="${product.pname} - 추가 이미지 1">
                     </figure>
                     <br>
                     <figure class="image is-300x300">
                         <img src="${path}/resources/upload/${product.img3}" alt="${product.pname} - 추가 이미지 2">
                     </figure>
                     <figure class="image is-300x300">
                         <img src="${path}/resources/upload/${product.img4}" alt="${product.pname} - 추가 이미지 3">
                     </figure>
                 </div>
             </div>
             <div class="field is-grouped">
                 <div class="control">
                     <a href="${path}/product/productList.do" class="button is-link">목록으로</a>
                 </div>
                 <div class="control">
                     <a href="${path}/product/upProduct.do?pno=${product.pno}" class="button is-warning">수정</a>
                 </div>
                 <div class="control">
                     <form action="${path}/product/delProduct.do" method="post" style="display:inline;">
                         <input type="hidden" name="pno" value="${product.pno}">
                         <button type="submit" class="button is-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                     </form>
                 </div>
             </div>
         </div>
      </div>
   </div>
 </section>
 <section>
    <h2 class="title is-4 has-text-centered">제품 QnA</h2>
    <div class="box">
        <c:if test="${not empty productQnaList}">
            <table class="table is-fullwidth">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="qna" items="${productQnaList}">
                        <c:if test="${qna.parno == 0}">
                            <tr>
                                <td>${qna.no}</td>
                                <td><a href="${path}/productQna/getProductQna.do?no=${qna.no}">${qna.title}</a></td>
                                <td>${qna.name}</td>
                                <td><fmt:formatDate value="${qna.resdate}" pattern="yyyy-MM-dd"/></td>
                                <td>${qna.hits}</td>
                            </tr>
                            <c:forEach var="answer" items="${productQnaList}">
                                <c:if test="${answer.parno == qna.no}">
                                    <tr style="background-color: #f9f9f9;">
                                        <td></td>
                                        <td style="padding-left: 30px;">↳ ${answer.title}</td>
                                        <td>${answer.name}</td>
                                        <td><fmt:formatDate value="${answer.resdate}" pattern="yyyy-MM-dd"/></td>
                                        <td>${answer.hits}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty productQnaList}">
            <p>등록된 QnA가 없습니다.</p>
        </c:if>
        <div class="buttons is-right">
            <a href="${path}/productQna/insProductQna.do?pno=${product.pno}" class="button is-primary">QnA 등록</a>
        </div>
	</div>
</section>
<section>
    <form id="basketForm" action="${path}/basket/addBasket.do" method="post">
        <input type="hidden" name="productPno" id="productPno" value="${product.pno}">
        <div class="field">
            <label class="label">수량</label>
            <div class="control">
                <input class="input" type="number" name="quantity" id="quantity" placeholder="수량" value="1" required>
            </div>
         </div>
         <button type="submit" class="button is-link">장바구니추가</button>
    </form>
    <form id="purchaseForm" action="${path}/sales/buySalesList.do" method="post">
        <input type="hidden" name="productPno" value="${product.pno}">
        <input type="hidden" name="quantity" id="purchaseQuantity" value="1">
        <button type="submit" class="button is-primary">구매하기</button>
    </form>
</section>
<script>
    document.getElementById('basketForm').addEventListener('submit', function() {
        var quantity = document.getElementById('quantity').value;
        document.getElementById('purchaseQuantity').value = quantity;
    });

    document.getElementById('purchaseForm').addEventListener('submit', function() {
        var quantity = document.getElementById('quantity').value;
        document.getElementById('purchaseQuantity').value = quantity;
    });
    
</script>
<footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
