<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 수정</title>
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
            <h3 class="mb-4">회원 정보 수정</h3>
            <form action="/member/update" method="post" onsubmit="return checkValues()">
                <input type="hidden" name="id" value="${member.id}">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">이메일</label>
                    <input type="text" id="inputEmail" class="form-control-plaintext" name="email"
                           value="${member.email}" readonly>
                </div>
                <div class="mb-3">
                    <label for="inputPwd" class="form-label">비밀번호</label>
                    <input oninput="passwordCheck()" type="text" id="inputPwd" class="form-control" name="password">
                </div>
                <div class="mb-3">
                    <label for="inputPwdCheck" class="form-label">비밀번호 확인</label>
                    <input oninput="passwordCheck()" type="text" id="inputPwdCheck" class="form-control">
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="inputNick" class="form-label">닉네임</label>
                    <input type="text" id="inputNick" class="form-control" name="nickName" value="${member.nickName}">
                </div>
                <input type="hidden" name="inserted" value="${member.inserted}">
                <div class="mb-3">
                    <button class="btn btn-secondary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function passwordCheck() {
        const password = document.querySelector("#inputPwd").value;
        const passwordCheck = document.querySelector("#inputPwdCheck").value;

        if (password != passwordCheck) {
            // 메세지 보여주기
            document.querySelector("#passwordMessage").textContent = "패스워드가 일치하지 않습니다.";
        } else {
            document.querySelector("#passwordMessage").textContent = "";
        }
    }

    function checkValues() {
        const password = document.getElementById("inputPwd").value;
        const passwordCheck = document.getElementById("inputPwdCheck").value;
        if (password != "" && password == passwordCheck) {
            return true;
        } else {
            alert("패스워드가 일치하지 않습니다.");
            return false;
        }
    }
</script>
</body>
</html>
