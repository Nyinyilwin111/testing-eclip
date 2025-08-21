<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Watch Movie</title>
    <style>
        body {
            background-color: #0d0d2b;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        iframe {
            width: 800px;
            height: 450px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255,255,255,0.2);
        }
    </style>
</head>
<body>

<c:if test="${not empty error}">
    <div style="color: red; font-weight: bold;">${error}</div>
</c:if>

<c:if test="${not empty videoUrl}">
	<iframe 
						    src="https://drive.google.com/file/d/${movie.movie_file_url}/preview"
						    width="640" height="360" allow="autoplay" allowfullscreen>
						</iframe>
</c:if>

</body>
</html>



