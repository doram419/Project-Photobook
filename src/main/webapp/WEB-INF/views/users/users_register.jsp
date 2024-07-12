<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="<c:url value='/css/login_style.css' />">
</head>
<body>
    <div class="auth-container">
        <h2>회원가입</h2>
        <c:if test="${not empty error}">
    <p style="color: red;">${error}</p> <!-- 이메일 중복 오류메세지 스타일 적용 -->
</c:if>
        <form action="<c:url value='/users/register' />" method="post">
            <input type="text" name="userName" placeholder="사용자 이름" required>
            <input type="email" name="email" placeholder="이메일" required>
            <input type="password" name="password" placeholder="비밀번호" required>
            <input type="address" name="address" placeholder="주소" required>
            <input type="phoneNumber" name="phoneNumber" placeholder="전화번호" required>
            <button type="submit">회원가입</button>
        </form>
        <div class="login-link">
            <a href="<c:url value='/users/login' />">이미 계정이 있으신가요? 로그인</a>
        </div>
    </div>
</body>
</html>