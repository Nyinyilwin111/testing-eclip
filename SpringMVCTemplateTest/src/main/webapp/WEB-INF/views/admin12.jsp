<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Anime | Admin Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- CSS -->
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet" />

    <style>
        .error {
            color: #e74c3c !important;
            font-size: 14px !important;
            font-weight: 600;
            margin-top: 6px !important;
            margin-bottom: 10px !important;
            display: block !important;
            line-height: 1.3;
        }

        .input__item {
            margin-bottom: 25px;
            position: relative;
        }

        .input__item i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #888;
        }

        .input__item input {
            padding-left: 45px; /* space for left icon */
        }

        .site-btn {
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Preloader -->
<div id="preloder"><div class="loader"></div></div>

<!-- Breadcrumb -->
<section class="normal-breadcrumb set-bg" data-setbg="resources/img/normal-breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Admin Sign Up</h2>
                    <p>Admin access to Anime Movie CMS</p>
                    <p style="color:limegreen">${msg}</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Admin Registration Form -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="login__form">
                    <h3>Register Admin</h3>
                    <form:form method="post" modelAttribute="admin1" action="adminform4">

                        <div class="input__item">
                            <i class="fa fa-user"></i>
                            <form:input path="name" placeholder="Admin Name" />
                            <form:errors path="name" cssClass="error" />
                        </div>

                        <div class="input__item">
                            <i class="fa fa-envelope"></i>
                            <form:input path="email" type="email" placeholder="Email Address" />
                            <form:errors path="email" cssClass="error" />
                        </div>

                        <div class="input__item">
                            <i class="fa fa-lock"></i>
                            <form:password path="password" placeholder="Password" />
                            <form:errors path="password" cssClass="error" />
                        </div>

                        <button type="submit" class="site-btn">Register Now</button>
                    </form:form>

                    <h5>Already registered? <a href="<c:url value='/login'/>">Log In!</a></h5>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- JS -->
<script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/js/main.js' />"></script>

</body>
</html>
