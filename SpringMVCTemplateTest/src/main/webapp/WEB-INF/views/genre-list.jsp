<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Genre List</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    .container {
        width: 80%;
        margin: auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        border-radius: 10px;
    }

    .add-btn {
        display: inline-block;
        margin-bottom: 15px;
        padding: 10px 20px;
        background-color: #28a745;
        color: white;
        text-decoration: none;
        border-radius: 5px;
    }

    .add-btn:hover {
        background-color: #218838;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .action-links a {
        margin-right: 10px;
        color: #007bff;
        text-decoration: none;
    }

    .action-links a:hover {
        text-decoration: underline;
    }

</style>
</head>
<body>

<div class="container">
    <h2>Genre List</h2>

    <a href="${pageContext.request.contextPath}/genres/add" class="add-btn">+ Add Genre</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="genre" items="${genres}">
                <tr>
                    <td>${genre.id}</td>
                    <td>${genre.name}</td>
                    <td class="action-links">
                        <a href="${pageContext.request.contextPath}/genres/edit/${genre.id}">Edit</a>
                        <a href="${pageContext.request.contextPath}/genres/delete/${genre.id}" onclick="return confirm('Are you sure you want to delete this genre?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
