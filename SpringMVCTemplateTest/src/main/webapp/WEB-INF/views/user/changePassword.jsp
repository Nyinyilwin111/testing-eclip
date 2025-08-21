<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0b0c2a;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .password-form {
            background: #151734;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.4);
            width: 400px;
            text-align: center;
        }
        
        .password-form h2 {
            margin-bottom: 20px;
            color: #f2f2f2;
        }
        
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #c2c2c2;
        }
        
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #444;
            border-radius: 5px;
            background: #1a1c3a;
            color: #fff;
        }
        
        .submit-btn {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }
        
        .submit-btn:hover {
            background: #388E3C;
        }
        
        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #c2c2c2;
            text-decoration: none;
        }
        
        .back-link:hover {
            color: #f44336;
        }
        
        .error {
            color: #f44336;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="password-form">
        <h2>Change Password</h2>
        
        <form:form action="updatePassword" method="post" modelAttribute="passwordChange">
            <input type="hidden" name="email" value="${email}" />
            
            <div class="form-group">
                <label for="currentPassword">Current Password</label>
                <input type="password" id="currentPassword" name="currentPassword" required />
                <span class="error">${currentPasswordError}</span>
            </div>
            
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="newPassword" required />
                <span class="error">${newPasswordError}</span>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required />
                <span class="error">${confirmPasswordError}</span>
            </div>
            
            <button type="submit" class="submit-btn">Change Password</button>
            <a href="profile1?email=${email}" class="back-link">Back to Profile</a>
        </form:form>
    </div>
</body>
</html>