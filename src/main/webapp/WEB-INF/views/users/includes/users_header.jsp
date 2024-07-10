<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link type="text/css" 
		rel="stylesheet" 
		href='<c:url value="/css/header-footer.css"/>'>
</head>

<header>
    <h1>포토북 제작 서비스</h1>
    <nav>
        <ul>
            <li><a href="<c:url value="/users/home"/>">홈</a></li>
            <li><a href="<c:url value="/users/profile"/>">프로필 관리</a></li>
            <li><a href="<c:url value="/users/photobook"/>">포토북 제작</a></li>
            <li><a href="<c:url value="/users/order"/>">주문</a></li>
            <li><a href="<c:url value="/users/board"/>">게시판</a></li>
        </ul>
    </nav>
</header>