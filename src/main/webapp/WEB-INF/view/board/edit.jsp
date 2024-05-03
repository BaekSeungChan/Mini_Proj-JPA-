<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
<h1>${board.id}번 게시글 수정</h1>
<form method="post" action="/board/edit" >
    <input type="hidden" name="id" value="${board.id}">
    <input type="text" name="writer" placeholder="작성자"  value="${board.writer}" required> <br><br>
    <input type="text" name="title" placeholder="제목"  value="${board.title}" required> <br><br>
    <textarea name="content" placeholder="내용" rows="5" cols="60">${board.content}</textarea> <br><br>
    <button type="submit">수정</button>
</form>
</body>
</html>
