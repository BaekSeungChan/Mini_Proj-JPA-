<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title></title>
</head>
<body>
<h1>${board.id}번 글 상세</h1>
    <table border="1" width="500">
        <tr>
            <th width="25%">번호</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.writer}</td>
        </tr>
        <tr height="200" valign="top">
            <th>내용</th>
            <td>${board.content}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.readCount}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>
                <fmt:formatDate value="${board.writeTime}" pattern="y년 M월 d일 E a h시 m분 s초" />
            </td>
        </tr>
        <tr>
            <th>변경일</th>
            <td>
                <fmt:formatDate value="${board.editTime}" pattern="y년 M월 d일 E a h시 m분 s초" />
            </td>
        </tr>
    </table>

    <h2><a href="/board/list">목록</a></h2>
    <h2><a href="/board/edit?id=${board.id}">수정</a></h2>
    <h2><a href="/board/delete?id=${board.id}">삭제</a></h2>
</body>
</html>
