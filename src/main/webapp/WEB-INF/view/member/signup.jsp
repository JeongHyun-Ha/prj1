<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mb-4">회원 가입</h3>
            <form action="/member/signup" method="post" onsubmit="return checkValues()">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">이메일</label>
                    <div class="input-group">
                        <input name="email" type="text" id="inputEmail" class="form-control" required>
                        <button onclick="emailCheck()" type="button" class="btn btn-outline-secondary"
                                id="btnEmailCheck">중복 확인
                        </button>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPwd" class="form-label">비밀번호</label>
                    <input oninput="passwordCheck()" name="password" type="password" id="inputPwd" class="form-control"
                           required>
                </div>
                <div class="mb-3">
                    <label for="inputPwdCheck" class="form-label">비밀번호 확인</label>
                    <input oninput="passwordCheck()" type="password" id="inputPwdCheck" class="form-control" required>
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="inputNick" class="form-label">닉네임</label>
                    <input name="nickName" type="text" id="inputNick" class="form-control" required>
                </div>
                <div>
                    <button class="btn btn-primary">회원 가입</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    async function emailCheck() {
        const emailValue = document.querySelector("#inputEmail").value;
        const url = "/member/email?email=" + emailValue;

        // ajax 요청
        const response = await fetch(encodeURI(url));
        alert(await response.text());
    }

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
