<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 센터</title>
    <link type="text/css" 
		rel="stylesheet" 
		href='<c:url value="/css/common_style.css"/>'/>
</head>

<body>
	<c:import url="/WEB-INF/views/admin/includes/admin_header.jsp"></c:import>

    <div class="main-content">
        <div class="header">
            <h2>고객 센터</h2>
        </div>
        <div class="card">
            <div class="card-header">문의 검색</div>
            <div class="card-body">
                <form action="searchInquiry.jsp" method="GET">
                    <div class="form-group">
                        <input type="text" name="searchTerm" placeholder="문의 번호 또는 고객ID 검색">
                    </div>
                    <button type="submit" class="btn btn-primary">검색</button>
                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-header">문의 목록</div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>문의번호</th>
                            <th>고객명</th>
                            <th>제목</th>
                            <th>상태</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- 여기에 문의 데이터를 동적으로 생성하는 Java 코드를 추가할 수 있습니다 --%>
                       <c:forEach items="${postList}" var="postMap" varStatus="status">
                        <tr>
                            <td>${postMap['boardVo'].boardId}</td>
                            <td>${postMap['usersVo'].userName}</td>
                            <td>${postMap['boardVo'].title}</td>
                            <td>${postMap['boardVo'].status}</td>
                            <td>
                            	<a href="<c:url value="/admin/board/post/${postMap['boardVo'].userId}/${postMap['boardVo'].boardId }"/>"><button class="btn btn-primary">상세보기</button></a>
                                <a href="<c:url value="/admin/board/${postMap['boardVo'].userId}/${postMap['boardVo'].boardId }"/>"><button class="btn btn-primary">답변하기</button></a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
	<c:import url="/WEB-INF/views/admin/includes/admin_footer.jsp"></c:import>
</body>

</html>