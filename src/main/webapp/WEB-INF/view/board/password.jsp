
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/view/board/header.jsp"></jsp:include>


<div class="container-fluid">

    <div class="row mt-4">
        <div class="col-md-10 offset-md-1">
            <h1>비밀번호 확인</h1>
        </div>
    </div>

    <form method="post">
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
                    <label class="form-label text-secondary">게시글 비밀번호</label>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-10 offset-md-1 text-end">
                <a href="${pageContext.request.contextPath}/board/detail?id=${id}" type="button" class="btn btn-secondary btn-lg">이전</a>
                <button type="submit" class="btn btn-primary btn-lg">확인</button>
            </div>
        </div>
    </form>


    <c:if test="${param.error != null}">
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1 text-end">
                <h2 class="text-danger">비밀번호가 맞지 않습니다.</h2>
            </div>
        </div>
    </c:if>
</div>



<jsp:include page="/WEB-INF/view/board/footer.jsp"></jsp:include>