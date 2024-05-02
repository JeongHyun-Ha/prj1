<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 정보</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mb-4">회원 정보</h3>
            <div>
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">이메일</label>
                    <input type="text" id="inputEmail" readonly class="form-control" value="${member.email}">
                </div>
                <div class="mb-3">
                    <label for="inputPwd" class="form-label">비밀번호</label>
                    <input type="text" id="inputPwd" readonly class="form-control" value="${member.password}">
                </div>
                <div class="mb-3">
                    <label for="inputNick" class="form-label">닉네임</label>
                    <input type="text" id="inputNick" readonly="" class="form-control" value="${member.nickName}">
                </div>
                <div class="mb-3">
                    <label for="inputInserted" class="form-label">가입 일시</label>
                    <input type="text" id="inputInserted" readonly class="form-control" value="${member.inserted}">
                </div>
                <div>
                    <button class="btn btn-danger" form="formDelete">회원 탈퇴</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="d-none">
    <form action="/member/delete" id="formDelete" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?')">
        <input type="hidden" name="id" value="${member.id}">
    </form>
</div>
</body>
</html>
