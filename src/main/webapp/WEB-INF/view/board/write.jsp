<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
<h1>게시글 작성</h1>
<form method="post" action="/board/write" >
    <input type="text" name="writer" placeholder="작성자" required> <br><br>
    <input type="text" name="title" placeholder="제목" required> <br><br>
    <textarea name="content" placeholder="내용" rows="5" cols="60"></textarea> <br><br>
    <button type="submit">등록</button>
</form>
</body>
</html>
