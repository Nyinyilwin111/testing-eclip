<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Cast</title>
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
        box-sizing: border-box;
    }

    .error {
        color: red;
        font-size: 0.9em;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        margin-top: 15px;
        border: none;
        cursor: pointer;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .message {
        margin-bottom: 15px;
        color: green;
        font-weight: bold;
    }
</style>
</head>
<body>

<div class="message">${message}</div>

<h2>Add Cast</h2>
<form:form method="post" action="cast-save" modelAttribute="cast">
    <label>Name:</label>
    <form:input path="name" />
    <form:errors path="name" cssClass="error" />

    <label>Date of Birth:</label>
    <form:input path="dateOfBirth" type="date"/>
    <form:errors path="dateOfBirth" cssClass="error" />

    <label>Country:</label>
    <form:select path="nationality">
        <form:option value="">-- Select Country --</form:option>
        <form:option value="Myanmar">Myanmar</form:option>
        <form:option value="Japan">Japan</form:option>
    </form:select>
    <form:errors path="nationality" cssClass="error" />

    <input type="submit" value="Save Cast" />
</form:form>

</body>
</html>
