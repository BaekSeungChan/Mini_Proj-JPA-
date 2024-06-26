<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<jsp:include page="/WEB-INF/view/board/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">


    <%--   제목    --%>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h1>자유 게시판</h1>
                <p>
                    타인에 대한 비방 또는 모욕은 사전 예고 없이 삭제됩니다.
                </p>
            </div>
        </div>


    <%-- 복합 검색을 위한 아코디언 검색창   --%>
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1">
            <div class="card border-dark">
                <div class="card-header">
                    <a class="btn" data-bs-toggle="collapse" href="#collapse-body">검색 도구 상자</a>
                </div>
                <div class="collapse show" id="collapse-body">
                    <div class="card-body">
                        <form method="get" class="search-form" action="/board/list">
                                <%--   번호 검색    --%>
                            <div class="row mt-4">
                                <div class="col">
                                    <div class="form-floating">
                                        <input name="id" class="form-control" type="text" placeholder="번호">
                                        <label class="form-label text-secondary">번호</label>
                                    </div>
                                </div>
                            </div>
                                <%--   작성자 검색    --%>
                            <div class="row mt-4">
                                <div class="col">
                                    <div class="form-floating">
                                        <input name="writer" class="form-control" type="text" placeholder="작성자">
                                        <label class="form-label text-secondary">작성자</label>
                                    </div>
                                </div>
                            </div>
                                <%--   제목 검색    --%>
                            <div class="row mt-4">
                                <div class="col">
                                    <div class="form-floating">
                                        <input name="title" class="form-control" type="text" placeholder="제목">
                                        <label class="form-label text-secondary">제목</label>
                                    </div>
                                </div>
                            </div>
                                <%--   내용 검색    --%>
                            <div class="row mt-4">
                                <div class="col">
                                    <div class="form-floating">
                                        <input name="content" class="form-control" type="text" placeholder="내용">
                                        <label class="form-label text-secondary">내용</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col text-end">
                                    <input type="reset" class="btn btn-warning btn-lg" value="초기화">
                                    <a href="/board/list" class="btn btn-secondary btn-lg">목록</a>
                                    <button type="submit" class="btn btn-success btn-lg">검색</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--게시글 개수 및 글쓰기 버튼--%>
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1">
            <div class="row">
                <div class="col text-start">
                    (${pagination.current}/${pagination.total})
                </div>
                <div class="col text-end">
                    <a href="/board/write" class="btn btn-primary">글쓰기</a>
                </div>
            </div>
        </div>
    </div>

    <%--  container  --%>
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1">
            <table class="table table-hover">
                <thead class="bg-light text-light">
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
        </div>
    </div>


    <div class="empty-space"></div>

    <%-- 페이지 네이게이터  --%>
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1">
            <ul class="pagination justify-content-center">

                <!-- 처음이 있을 경우만 링크 설정 -->
                <c:choose>
                    <c:when test="${pagination.hasFirstBlock()}">
                        <li class="page-item"><a class="page-link" href="#" data-page="${pagination.getFirst()}">&laquo;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link disabled" href="#">&laquo;</a></li>
                    </c:otherwise>
                </c:choose>

                <!-- 이전이 있을 경우만 링크 설정 -->
                <c:choose>
                    <c:when test="${pagination.hasPreviousBlock()}">
                        <li class="page-item"><a class="page-link" href="#" data-page="${pagination.getPrevious()}">&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link disabled" href="#">&lt;</a></li>
                    </c:otherwise>
                </c:choose>

                <!-- begin부터 end까지 표시(보여줄 땐 p, 이동할 땐 p-1) -->
                <c:forEach var="p" begin="${pagination.begin}" end="${pagination.end}">
                    <c:choose>
                        <c:when test="${p == pagination.current}">
                            <li class="page-item active"><a class="page-link" href="#">${p}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="#" data-page="${p-1}">${p}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 다음이 있을 경우만 링크 설정 -->
                <c:choose>
                    <c:when test="${pagination.hasNextBlock()}">
                        <li class="page-item"><a class="page-link" href="#" data-page="${pagination.getNext()}">&gt;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link disabled" href="#">&gt;</a></li>
                    </c:otherwise>
                </c:choose>

                <!-- 마지막이 아닐 경우만 링크 설정 -->
                <c:choose>
                    <c:when test="${pagination.hasLastBlock()}">
                        <li class="page-item"><a class="page-link" href="#" data-page="${pagination.getLast()}">&raquo;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link disabled" href="#">&raquo;</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>

    <%--  검색창  --%>
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1">
            <form class="form" method="post">
                <div class="row">
                    <div class="col-2 offset-2">
                        <select class="form-select">
                            <option>제목</option>
                            <option>작성자</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <input type="search" class="form-control" placeholder="검색어" required>
                    </div>

                    <div class="col-2">
                        <button class="btn btn-primary w-100" type="submit">검색</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(".page-link").click(function(e){
        e.preventDefault();//기본 클릭 이벤트 제거

        const page = $(this).data("page");
        if(!$.isNumeric(page)) return;

        //.search-form에 추가하여 전송
        $("<input>").attr("name", "page").attr("type", "hidden").val(page).appendTo(".search-form");
        $(".search-form").submit();
    });
</script>


<jsp:include page="/WEB-INF/view/board/footer.jsp"></jsp:include>
