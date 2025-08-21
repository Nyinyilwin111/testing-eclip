<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie</title>
</head>
<body>
	${error}
	${updateError}
	<p>${movieError}</p>
	<p>${posterError}</p>
	<p>${trailerError}</p>
	<form:form method="post" action="${pageContext.request.contextPath}/editMovie" modelAttribute="editMovieObj" enctype="multipart/form-data">
		<form:hidden path="movie_id"/>
        Title: <form:input path="title" /><br>
        Movie Poster: <form:input type="file" path="poster" /><br>
        Overview: <form:input type="textarea" path="overview" /><br>
        Movie File: <form:input type="file" path="movieFile" /><br>
        Release Year: <form:input path="release_year" /><br>
        
	    Restricted Age: <form:input path="restriced_age" type="number" /><br>
	    Director ID: <form:input path="director_id" type="number" /><br>
	
	    Admin ID: <form:input path="admin_id" type="number" /><br>
	
	    Trailer File: <form:input type="file" path="trailerFile" /><br>
        
        Rating: <form:input path="rating" type="number" step="0.1" /><br>
        
        <form:label path="type">Type</form:label>
		<form:radiobutton path="type" value="Movie" label="Movie" />
		<form:radiobutton path="type" value="TV-Show" label="TV-Show" /><br>
        
        <input type="submit" value="Save" />
    </form:form>

    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
</body>
</html>