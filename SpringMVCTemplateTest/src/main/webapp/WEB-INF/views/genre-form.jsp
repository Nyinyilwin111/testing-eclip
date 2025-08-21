<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Genre Form</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        padding: 30px;
    }
    .container {
        background-color: #fff;
        padding: 25px;
        width: 400px;
        margin: auto;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        border-radius: 10px;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
    }
    input[type="text"] {
        width: 100%;
        padding: 8px 10px;
        margin-top: 5px;
        box-sizing: border-box;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    .error {
        color: red;
        font-size: 0.85em;
    }
    .btn-group {
        margin-top: 20px;
        text-align: center;
    }
    input[type="submit"], a.button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        text-decoration: none;
        margin-right: 10px;
        border-radius: 5px;
        cursor: pointer;
    }
    a.button {
        background-color: #6c757d;
    }
    input[type="submit"]:hover, a.button:hover {
        opacity: 0.9;
    }
</style>
</head>
<body>

<div class="container">
    <c:choose>
        <c:when test="${empty genre.id}">
            <h2>Add New Genre</h2>
        </c:when>
        <c:otherwise>
            <h2>Edit Genre</h2>
        </c:otherwise>
    </c:choose>

    <form:form method="post" action="${pageContext.request.contextPath}/genres/save" modelAttribute="genre">
        <form:hidden path="id" />

        <label for="name">Genre Name:</label>
        <form:input path="name" id="name" />
        <form:errors path="name" cssClass="error" />

        <div class="btn-group">
            <input type="submit" value="Save" />
            <a href="${pageContext.request.contextPath}/genres" class="button">Cancel</a>
        </div>
    </form:form>
</div>

</body>
</html>
