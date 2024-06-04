<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Edit Sales</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="section">
    <div class="container">
        <h1 class="title">Edit Sales</h1>
        <form action="${path}/sales/saveSales.do" method="post">
            <input type="hidden" name="sno" value="${sales.sno}">
            <div class="field">
                <label class="label">Product No</label>
                <div class="control">
                    <input class="input" type="text" name="pno" value="${sales.pno}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Amount</label>
                <div class="control">
                    <input class="input" type="number" name="amount" value="${sales.amount}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Total</label>
                <div class="control">
                    <input class="input" type="number" name="tot" value="${sales.tot}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">ID</label>
                <div class="control">
                    <input class="input" type="text" name="id" value="${sales.id}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Pay Method</label>
                <div class="control">
                    <input class="input" type="text" name="paymethod" value="${sales.paymethod}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Address</label>
                <div class="control">
                    <input class="input" type="text" name="addr" value="${sales.addr}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Tel</label>
                <div class="control">
                    <input class="input" type="text" name="tel" value="${sales.tel}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Delivery Company</label>
                <div class="control">
                    <input class="input" type="text" name="delcom" value="${sales.delcom}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Delivery Tel</label>
                <div class="control">
                    <input class="input" type="text" name="deltel" value="${sales.deltel}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Delivery No</label>
                <div class="control">
                    <input class="input" type="text" name="delno" value="${sales.delno}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Delivery Status</label>
                <div class="control">
                    <input class="input" type="text" name="delstatus" value="${sales.delstatus}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Status</label>
                <div class="control">
                    <input class="input" type="text" name="st" value="${sales.st}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">GT ID</label>
                <div class="control">
                    <input class="input" type="text" name="gtid" value="${sales.gtid}" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Receiver Name</label>
                <div class="control">
                    <input class="input" type="text" name="rname" value="${sales.rname}" required>
                </div>
            </div>
            <div class="field is-grouped">
                <div class="control">
                    <button class="button is-primary" type="submit">Save</button>
                </div>
                <div class="control">
                    <a class="button is-light" href="${path}/sales/getSalesList.do">Cancel</a>
                </div>
            </div>
        </form>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
