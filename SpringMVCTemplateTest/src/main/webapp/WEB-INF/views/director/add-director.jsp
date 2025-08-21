<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Director</title>
</head>
<body>
    <h2>Add New Director</h2>
    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;"><%= request.getParameter("error") %></p>
    <% } %>
    
   <form action="/directors" method="post">
        <input type="hidden" name="action" value="add">
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" required><br><br>
        
        <label for="nationality">Nationality:</label>
        <input type="text" id="nationality" name="nationality" required><br><br>
        
        <input type="submit" value="Add Director">
    </form>
    
    <p><a href="directors">Back to Director List</a></p>
</body>
</html>