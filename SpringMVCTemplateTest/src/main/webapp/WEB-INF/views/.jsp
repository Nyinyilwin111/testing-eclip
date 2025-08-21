<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .error {
            color: red;
            font-size: 13px;
            margin-bottom: 10px;
            display: block;
        }
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Admin Registration</h2>

    <form:form method="post" modelAttribute="admin1" action="adminform4">
        <label for="name">Name:</label>
        <form:input path="name" id="name" />
        <form:errors path="name" cssClass="error" />

        <label for="email">Email:</label>
        <form:input path="email" type="email" id="email" />
        <form:errors path="email" cssClass="error" />

        <label for="password">Password:</label>
        <form:password path="password" id="password" />
        <form:errors path="password" cssClass="error" />

        <button type="submit" class="btn-submit">Register</button>
    </form:form>
</div>
</body>
</html>
