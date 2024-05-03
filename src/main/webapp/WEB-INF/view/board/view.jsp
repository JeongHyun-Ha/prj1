<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>게시물</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-4">
            <div>
                <h3>${board.id} 번 게시물</h3>
            </div>
            <div class="mb-3">
                <label for="inputTitle" class="form-label">제목</label>
                <input class="form-control" id="inputTitle" type="text" value="${board.title}" readonly>
            </div>
            <div class="mb-3">
                <label for="inputContent" class="form-label">본문</label>
                <textarea class="form-control" id="inputContent" cols="30" rows="10"
                          readonly>${board.content}</textarea>
            </div>
            <div class="mb-3">
                <label for="inputWriter" class="form-label">작성자</label>
                <input class="form-control" id="inputWriter" type="text" value="${board.writer}" readonly>
            </div>
            <div class="mb-3">
                <label for="inputInserted" class="form-label">작성 일시</label>
                <input class="form-control" id="inputInserted" type="datetime-local" readonly value="${board.inserted}">
            </div>
            <sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal.member" var="member"/>
                <c:if test="${member.id eq board.memberId}">
                    <div>
                        <form id="deleteBtn" action="/delete" method="post" onsubmit="return confirm('삭제 하시겠습니까?')">
                            <input type="hidden" name="id" value="${board.id}">
                        </form>
                        <button form="deleteBtn" class="btn btn-danger">삭제</button>
                        <a href="/update?id=${board.id}" class="btn btn-success">수정</a>
                    </div>
                </c:if>
            </sec:authorize>
        </div>
    </div>
</div>
</body>
</html>
