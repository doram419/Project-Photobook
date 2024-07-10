<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인/회원가입 - 나만의 포토북 서비스</title>
    <link type="text/css" 
		rel="stylesheet" 
		href='<c:url value="css/login_style.css"/>'>
</head>

<body>
    <div class="auth-container">
        <h2>로그인</h2>
        <form id="loginForm" 
        	action="file:///C:/Users/806-25/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%ED%8F%AC%ED%86%A0%EB%B6%81%20html&#39;/%ED%8F%AC%ED%86%A0%EB%B6%81%20html&#39;/login" 
        	method="post">
            <input type="email" id="email" name="email" placeholder="이메일" required="">
            <input type="password" id="password" name="password" placeholder="비밀번호" required="">
            <button type="submit">로그인</button>
        </form>
        <div class="signup-link">
            <p>계정이 없으신가요? 
            	<a href="file:///C:/Users/806-25/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%ED%8F%AC%ED%86%A0%EB%B6%81%20html&#39;/%ED%8F%AC%ED%86%A0%EB%B6%81%20html&#39;/register.html" id="showSignup">
            	회원가입
            	</a>
            </p>
        </div>
        <div class="social-login">
            <button class="google" onclick="socialLogin(&#39;google&#39;)">Google로 로그인</button>
            <button class="naver" onclick="socialLogin(&#39;naver&#39;)">Naver로 로그인</button>
            <li> <a href="<c:url value="/users/home"/>">홈</a> </li>
        </div>     
    </div>

    <script>
        function socialLogin(provider) {
            // 소셜 로그인 구현
            console.log(provider + " 로그인");
        }

        document.getElementById('showSignup').addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelector('h2').textContent = '회원가입';
            document.getElementById('loginForm').id = 'signupForm';
            document.querySelector('form').action = 'signup';
            document.querySelector('button[type="submit"]').textContent = '회원가입';
            document.querySelector('.signup-link').style.display = 'none';
        });

        document.querySelector('form').addEventListener('submit', function(e) {
            e.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            if (email && password) {
                console.log('폼 제출:', email, password);
                // 여기에 서버로 데이터를 보내는 로직을 구현
            } else {
                alert('모든 필드를 채워주세요.');
            }
        });
    </script>
</body>
</html>