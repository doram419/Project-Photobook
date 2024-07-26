<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>PHOTOB</title>

      	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    	<!-- <link type="text/css" 
        rel="stylesheet" 
        href='<c:url value="/css/home_index_style.css"/>'> -->
</head>

<body class="d-flex flex-column min-vh-2000">

    <c:import url="/WEB-INF/views/users/includes/users_header.jsp"></c:import>

    <main class="flex-grow-1">
        <section class="hero">
            <div class="container-fluid p-0">
            <div class="row">
            <div class="col d-flex justify-content-end">
            <c:choose>
            	<c:when test="${not empty sessionScope.authUser}">
                    <a href="photobook">
                    <img src="<c:url value='/images/photobook1.jpg'/>" alt="photo" class="img-fluid w-100" style="height: auto; max-width: 100vh; max-height: 150vh;">
                    </a>
                </c:when>
                <c:otherwise>
                	<a href="javascript:void(0)" onclick="showLoginMessage()">
                	<img src="<c:url value='/images/photobook1.jpg'/>" alt="photo" class="img-fluid w-100" style="height: auto; max-width: 100vh; max-height: 150vh;">
                	</a>
                </c:otherwise>
                </c:choose>
                </div>
                </div>
        	</div>
        </section>
    </main>
 	<footer class="bg-light text-center text-lg-start fixed-bottom py-2">
    <c:import url="/WEB-INF/views/users/includes/users_footer.jsp"></c:import>
	</footer>
    <script type="text/javascript">
        function showLoginMessage() {
            alert("로그인 후 이용 가능합니다");
        }

        function getImageFileName(albumId) {
        	switch(albumId) {
            case "A001":
            case "A003":
                return "린넨회색.jpeg";
            case "A002":
            case "A005":
                return "린넨파란색.jpeg";
            case "A004":
            case "A006":
                return "린넨갈색.jpeg";
            case "A007":
            case "A009":
            case "A011":
                return "가죽회색.jpeg";
            case "A008":
            case "A010":
            case "A012":
                return "가죽갈색.jpeg";
            case "A013":
            case "A016":
            case "A019":
                return "하드회색.jpeg";
            case "A014":
            case "A017":
            case "A020":
                return "하드파란색.jpeg";
            case "A015":
            case "A018":
            case "A021":
                return "하드갈색.jpeg";
            case "A022":
            case "A025":
                return "소프트회색.jpeg";
            case "A023":
            case "A026":
                return "소프트파란색.jpeg";
            case "A024":
            case "A027":
                return "소프트갈색.jpeg";
            default:
                return "default.jpeg";
        }
        }

        var topAlbums = [
            <c:forEach items="${topAlmubs}" var="album" varStatus="status">
                "${album.ALBUM_ID}"${!status.last ? ',' : ''}
            </c:forEach>
        ];

        document.addEventListener('DOMContentLoaded', function() {
            var popularTemplatesDiv = document.getElementById('popularTemplates');
            popularTemplatesDiv.style.cssText = 'display: flex; justify-content: space-between; align-items: center; width: 80%; padding: 10px 0;';
            
            topAlbums.forEach(function(albumId) {
                var templateItem = document.createElement('div');
                templateItem.className = 'template-item';
                templateItem.style.cssText = 'flex: 1; max-width: calc(20% - 10px); text-align:center;';
                
                var img = document.createElement('img');
                var fileName = getImageFileName(albumId);
                img.src = '${pageContext.request.contextPath}/resources/images/' + fileName;
                img.alt = '인기 템플릿 ' + albumId;
                img.style.cssText = 'width: 100%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);';
                
                var p = document.createElement('p');
                p.textContent = fileName.replace('.jpeg', '');
                p.style.cssText = 'margin-top: 5px; font-size: 14px; color: #333;';
                
                templateItem.appendChild(img);
                templateItem.appendChild(p);
                popularTemplatesDiv.appendChild(templateItem);
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>