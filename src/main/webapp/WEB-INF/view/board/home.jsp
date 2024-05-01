<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>메인 화면</title>
</head>
<body>
<h3>메인 화면</h3>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성 일시</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.title}</td>
            <td>${board.writer}</td>
            <td>${board.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
