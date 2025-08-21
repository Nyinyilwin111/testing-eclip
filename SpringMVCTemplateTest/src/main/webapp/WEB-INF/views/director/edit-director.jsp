<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Director</title>
</head>
<body>
    <h2>Edit Director</h2>
    
    <form action="/directors/update" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${director.id}">
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${director.name}" required><br><br>
        
        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" 
               value="${director.dateOfBirth}" required><br><br>
        
        <label for="nationality">Nationality:</label>
        <input type="text" id="nationality" name="nationality" 
               value="${director.nationality}" required><br><br>
        
        <input type="submit" value="Update Director">
    </form>
    
    <p><a href="directors">Back to Director List</a></p>
</body>
</html>