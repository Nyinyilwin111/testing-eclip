<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Cast</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 30px;
        background-color: #f9f9f9;
    }

    h2 {
        color: #333;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        width: 400px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
    }

    input, select {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 10px;
        box-sizing: border-box;
    }

    .error {
        color: red;
        font-size: 0.9em;
        margin-bottom: 10px;
        display: block;
    }

    .button {
        padding: 10px 15px;
        margin-top: 15px;
        text-decoration: none;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
    }

    .submit-btn {
        background-color: #2196F3;
        color: white;
    }

    .submit-btn:hover {
        background-color: #0b7dda;
    }

    .cancel-btn {
        background-color: #ccc;
        color: black;
        margin-left: 10px;
    }

    .cancel-btn:hover {
        background-color: #aaa;
    }
</style>
</head>
<body>

<h2>Edit Cast</h2>

<form:form method="post" action="../cast-update" modelAttribute="cast">
    <form:hidden path="id" />

    <label>Name:</label>
    <form:input path="name" />
    <form:errors path="name" cssClass="error" />

    <label>Date of Birth:</label>
    <form:input path="dateOfBirth" type="date"/>
    <form:errors path="dateOfBirth" cssClass="error" />

    <label>Country:</label>
    <form:select path="nationality">
        <form:option value="">- Select Country -</form:option>
        <form:option value="Myanmar">Myanmar</form:option>
        <form:option value="Japan">Japan</form:option>
    </form:select>
    <form:errors path="nationality" cssClass="error" />

    <input type="submit" value="Save Cast" class="button submit-btn" />
    <a href="${pageContext.request.contextPath}/cast-list" class="button cancel-btn">Cancel</a>

</form:form>

</body>
</html>
