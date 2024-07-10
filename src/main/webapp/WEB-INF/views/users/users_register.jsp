<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 - 포토북 제작 서비스</title>
    <link rel="stylesheet" href="css/header_footer.css">
</head>
<body>
    <header>
        <h1>포토북 제작 서비스</h1>
        <nav>
            <ul>
                <li><a href="home_index.html">홈</a></li>
                <li><a href="login.html">로그인</a></li>
                <li><a href="register.html">회원가입</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="register">
            <h2>회원가입</h2>
            <form action="register_process.html" method="post">
                <div>
                    <label for="username">아이디:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div>
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div>
                    <label for="confirm_password">비밀번호 확인:</label>
                    <input type="password" id="confirm_password" name="confirm_password" required>
                </div>
                <div>
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <button type="submit">회원가입</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 포토북 제작 서비스. All rights reserved.</p>
    </footer>
</body>
</html>