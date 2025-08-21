<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Review Form</title>
</head>
<body>
    <h2>Leave a Review</h2>
    <form:form method="post" action="/SpringMVCMaven/review/save" modelAttribute="review">
        <form:hidden path="moviesId" />
        <form:label path="rating">Rating:</form:label>
        <form:input path="rating" type="number" step="0.1" min="0" max="5" /><br><br>

        <form:label path="comment">Comment:</form:label>
        <form:textarea path="comment" rows="4" cols="40" /><br><br>

        <input type="submit" value="Submit Review" />
    </form:form>
</body>
</html>
