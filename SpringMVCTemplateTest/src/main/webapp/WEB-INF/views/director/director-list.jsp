<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Director List</title>
</head>
<body>
    <h2>Director List</h2>
    
    <c:if test="${not empty message}">
        <div style="color:green">${message}</div>
    </c:if>
    
    <c:if test="${not empty error}">
        <div style="color:red">${error}</div>
    </c:if>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date of Birth</th>
            <th>Nationality</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${directors}" var="director">
            <tr>
                <td>${director.id}</td>
                <td>${director.name}</td>
                <td>${director.dateOfBirth}</td>
                <td>${director.nationality}</td>
                <td>
                    <a href="/directors/edit/${director.id}">Edit</a>
                    <a href="/directors/delete/${director.id}" 
                       onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    
   <a href="/di">Add New Director</a>
</body>
</html>