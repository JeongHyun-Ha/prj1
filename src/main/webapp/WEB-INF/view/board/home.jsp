<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>게시물 목록</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<%-- 게시글 목록 --%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3>메인 화면</h3>
            <c:if test="${delete eq '1'}">
                ${deleteId}번 게시물이 삭제되었습니다.
            </c:if>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col" style="width: 250px">제목</th>
                    <th scope="col" style="width: 100px">작성자</th>
                    <th scope="col" style="width: 200px">작성 일시</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardList}" var="board">
                    <tr>
                        <td>${board.id}</td>
                        <td>
                            <c:url value="/board" var="viewLink">
                                <c:param name="id" value="${board.id}"/>
                            </c:url>
                            <a href="${viewLink}">${board.title}</a>
                        </td>
                        <td>${board.writer}</td>
                        <td>${board.inserted}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%-- 페이징 --%>
<div class="container mt-3">
    <div class="row justify-content-center">
        <div class="col-8">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageInfo.currentPageNumber > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=1" aria-label="Previous">
                                <span aria-hidden="true"><<</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.prevPageNumber > 0}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${pageInfo.prevPageNumber}" aria-label="Previous">
                                <span aria-hidden="true"><</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="${pageInfo.beginPageNumber}" end="${pageInfo.endPageNumber}" var="pageNumber">
                        <c:url var="pageLink" value="/">
                            <c:param name="page" value="${pageNumber}"/>
                        </c:url>
                        <li class="page-item ${pageInfo.currentPageNumber eq pageNumber ? 'active' : ''}">
                            <a class="page-link" href="${pageLink}">${pageNumber}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageInfo.nextPageNumber < pageInfo.lastPageNumber}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${pageInfo.nextPageNumber}" aria-label="Next">
                                <span aria-hidden="true">></span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.currentPageNumber < pageInfo.lastPageNumber}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${pageInfo.lastPageNumber}" aria-label="Next">
                                <span aria-hidden="true">>></span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
