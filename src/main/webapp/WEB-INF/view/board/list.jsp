<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>
<h1>자유 게시판</h1>
<h2><a href="/board/write">글쓰기</a></h2>
<table border="1" width="600">
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
    <c:forEach var="board" items="${list}">
        <tr>
            <td>${board.id}</td>
            <td align="left">
                <a href="/board/detail?id=${board.id}">
                    ${board.title}
                </a>
            </td>
            <td>${board.writer}</td>
            <td>${board.writeTime}</td>
            <td>${board.readCount}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
