<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 정보 수정</title>
    <style>
    	* { margin: 0; padding: 0; }
        body { width:100%; height: auto; } 
    </style>
</head>
<body>
<div class="full-wrap">
    <!-- 헤더 부분 인클루드 -->
    <header id="hd">
        <div class="container">
            <jsp:include page="../include/header.jsp"></jsp:include>
        </div>
    </header>
    <main id="contents" class="contents">
        <div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="${path2}">Home</a></li>
                    <li><a href="${path2}/product/productList.do">상품</a></li>
                    <li class="is-active"><a href="#" aria-current="page">상품 정보 수정</a></li>
                </ul>
            </nav>
        </div>
        <section class="page" id="page1">
            <h2 class="page-title">상품 정보 수정</h2>
            <div class="page-wrap">
                <div class="clr-fix">
                    <br>
                    <form action="${path2}/product/upProduct.do" method="post" enctype="multipart/form-data" >
                        <table class="table" style="margin:0 auto;">
                            <tbody>
                                <tr>
                                    <th><label for="pcate">카테고리</label></th>
                                    <td>
                                        <select name="pcate" id="pcate" required>
                                            <option value="">선택 안함</option>
                                            <option value="notebook" ${product.pcate == 'notebook' ? 'selected' : ''}>노트북</option>
                                            <option value="phone" ${product.pcate == 'phone' ? 'selected' : ''}>휴대폰</option>
                                            <option value="tablet" ${product.pcate == 'tablet' ? 'selected' : ''}>태블릿</option>
                                            <option value="watch" ${product.pcate == 'watch' ? 'selected' : ''}>스마트워치</option>
                                            <option value="earphone" ${product.pcate == 'earphone' ? 'selected' : ''}>이어폰</option>
                                            <option value="new" ${product.pcate == 'new' ? 'selected' : ''}>신상품</option>
                                          
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="pname">상품명</label></th>
                                    <td>
                                        <input type="hidden" name="pno" id="pno" value="${product.pno}">
                                        <input type="text" name="pname" id="pname" class="input" maxlength="100" value="${product.pname}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="pcontext1">상품 설명1</label></th>
                                    <td>
                                        <textarea name="pcontext1" id="pcontext1" class="textarea" required>${product.pcontext1}</textarea>
                                    </td>
                                </tr>
                                  <tr>
                                    <th><label for="pcontext2">상품 설명2</label></th>
                                    <td>
                                        <textarea name="pcontext2" id="pcontext2" class="textarea" required>${product.pcontext2}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="price">가격</label></th>
                                    <td>
                                        <input type="number" value="${product.price}" name="price" id="price" class="input" required />
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="img1">상품 썸네일 이미지</label></th>
                                    <td>
                                        <input type="file" name="img1" id="img1" accept="image/*" />
                                        <br>현재 이미지: <img src="${path2}/resources/upload/${product.img1}" width="100" height="100";>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="img2">상품 상세 이미지1</label></th>
                                    <td>
                                        <input type="file" name="img2" id="img2" accept="image/*" />
                                        <br>현재 이미지: <img src="${path2}/resources/upload/${product.img2}" width="100" height="100">
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="img3">상품 상세 이미지2</label></th>
                                    <td>
                                        <input type="file" name="img3" id="img3" accept="image/*" />
                                        <br>현재 이미지: <img src="${path2}/resources/upload/${product.img3}" width="100" height="100">
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="img4">상품 상세 이미지3</label></th>
                                    <td>
                                        <input type="file" name="img4" id="img4" accept="image/*" />
                                        <br>현재 이미지: <img src="${path2}/resources/upload/${product.img4}" width="100" height="100">
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="asdate">a/s</label></th>
                                    <td>
                                        <input type="number" value="${product.asdate}" name="asdate" id="asdate" class="input" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <hr>
                        <div class="buttons">
                            <button type="submit" class="button is-danger">수정 완료</button>
                            <a href="${path2}/product/productList.do" class="button is-primary">상품 목록</a>
                            <a href="${path2}/product/getProduct.do?pno=${product.pno}" class="button is-success">상품 정보 상세보기</a>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
        <jsp:include page="../include/footer.jsp"></jsp:include>
    </footer>
</div>
</body>
</html>
