<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>게시물 조회</title>
</head>
<body>
<h3>${board.id} 번 게시물</h3>
<div>
    제목
    <input type="text" value="${board.title}" readonly>
</div>
<div>
    본문
    <textarea id="" cols="30" rows="10" readonly>${board.content}</textarea>
</div>
<div>
    작성자
    <input type="text" value="${board.writer}" readonly>
</div>
<div>
    작성 시간
    <input type="datetime-local" readonly value="${board.inserted}">
</div>
</body>
</html>
