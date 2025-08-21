<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cast List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 30px;
        background-color: #f5f5f5;
    }

    h2 {
        color: #333;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
        box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    a {
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    .add-btn {
        margin-top: 20px;
        display: inline-block;
        padding: 10px 15px;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
        text-decoration: none;
        font-weight: bold;
    }

    .add-btn:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<h2>Cast List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Date of Birth</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="cast" items="${castList}">
        <tr>
            <td>${cast.id}</td>
            <td>${cast.name}</td>
            <td>${cast.dateOfBirth}</td>
            <td>${cast.nationality}</td>
            <td>
                <a href="cast-edit/${cast.id}">Edit</a> |
                <a href="cast-delete/${cast.id}" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<a class="add-btn" href="cast-form">+ Add New Cast</a>

</body>
</html>
