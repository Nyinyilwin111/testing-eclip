<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Reset Password</title>

    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/elegant-icons.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/plyr.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/nice-select.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/owl.carousel.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/slicknav.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/style.css" />" rel="stylesheet" />

    <style>
        .password-strength {
            margin-top: 5px;
            font-size: 12px;
        }
        .password-match {
            margin-top: 5px;
            font-size: 12px;
            display: none;
        }
        .weak { color: #ff4757; }
        .medium { color: #ffa502; }
        .strong { color: #2ed573; }
        .match { color: #2ed573; }
        .mismatch { color: #ff4757; }
        .error-message {
            color: #ff4757;
            font-size: 14px;
            margin-top: 5px;
        }
        .alert-box {
            margin-top: 10px;
            color: red;
            font-weight: bold;
            font-size: 16px;
        }
        .success-box {
            margin-top: 10px;
            color: limegreen;
            font-weight: bold;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="<c:url value="/home6" />">
                            <img src="resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="<c:url value="/home6" />">Homepage</a></li>
                                <li><a href="./categories.html">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.html">Categories</a></li>
                                        <li><a href="./anime-details.html">Anime Details</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="<c:url value="/signup"/>">Sign UP</a></li>
                                        <li><a href="<c:url value="/login"/>">Login</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.html">Our Blog</a></li>
                                <li><a href="#">Contacts</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        <a href="<c:url value="/login" />"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>

    <section class="normal-breadcrumb set-bg" data-setbg="resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Reset Password</h2>
                        <p>Enter your new password below.</p>
                        <c:if test="${not empty msg}">
                            <div class="success-box">${msg}</div>
                        </c:if>
                        <c:if test="${not empty errorMsg}">
                            <div class="alert-box">${errorMsg}</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="login spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Reset Password</h3>
                        <form:form method="post" action="newPassword" modelAttribute="passwordReset" id="passwordResetForm">
                            <div class="input__item password-input">
                                <form:password path="newPassword" placeholder="New Password (min 8 characters)" 
                                    required="true" minlength="8" id="newPassword" onkeyup="checkPasswordStrength()"/>
                                <span class="icon_lock"></span>
                                <span class="password-toggle" onclick="togglePassword('newPassword')">
                                    <i class="fa fa-eye"></i>
                                </span>
                                <div id="passwordStrength" class="password-strength"></div>
                                <form:errors path="newPassword" cssClass="error-message"/>
                            </div>
                            <div class="input__item password-input">
                                <form:password path="confirmPassword" placeholder="Confirm Password" 
                                    required="true" id="confirmPassword" onkeyup="checkPasswordMatch()"/>
                                <span class="icon_lock"></span>
                                <span class="password-toggle" onclick="togglePassword('confirmPassword')">
                                    <i class="fa fa-eye"></i>
                                </span>
                                <div id="passwordMatch" class="password-match"></div>
                                <form:errors path="confirmPassword" cssClass="error-message"/>
                            </div>
                            <button type="submit" class="site-btn" id="submitBtn" disabled>Reset Password</button>
                        </form:form>
                        <a href="<c:url value="/login"/>" class="forget_pass">Back to Login</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="page-up">
            <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer__logo">
                        <a href="<c:url value="/home6" />"><img src="resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer__nav">
                        <ul>
                            <li class="active"><a href="<c:url value="/home6" />">Homepage</a></li>
                            <li><a href="./categories.html">Categories</a></li>
                            <li><a href="./blog.html">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    </p>
                </div>
            </div>
        </div>
    </footer>

    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>

    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/player.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.nice-select.min.js" />"></script>
    <script src="<c:url value="/resources/js/mixitup.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.slicknav.js" />"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>

    <script>
    function togglePassword(fieldId) {
        const field = document.getElementById(fieldId);
        const icon = field.nextElementSibling.nextElementSibling.querySelector('i');
        
        if (field.type === "password") {
            field.type = "text";
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            field.type = "password";
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

    function checkPasswordStrength() {
        const password = document.getElementById('newPassword').value;
        const strengthText = document.getElementById('passwordStrength');
        
        // Reset strength text
        strengthText.textContent = '';
        strengthText.className = 'password-strength';
        
        if (password.length === 0) return;
        
        // Check password strength
        const hasUpperCase = /[A-Z]/.test(password);
        const hasLowerCase = /[a-z]/.test(password);
        const hasNumbers = /\d/.test(password);
        const hasSpecialChars = /[!@#$%^&*(),.?":{}|<>]/.test(password);
        
        let strength = 0;
        if (password.length > 7) strength++;
        if (hasUpperCase) strength++;
        if (hasLowerCase) strength++;
        if (hasNumbers) strength++;
        if (hasSpecialChars) strength++;
        
        if (strength < 2) {
            strengthText.textContent = 'Weak';
            strengthText.classList.add('weak');
        } else if (strength < 4) {
            strengthText.textContent = 'Medium';
            strengthText.classList.add('medium');
        } else {
            strengthText.textContent = 'Strong';
            strengthText.classList.add('strong');
        }
        
        checkFormValidity();
    }

    function checkPasswordMatch() {
        const password = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const matchText = document.getElementById('passwordMatch');
        
        if (password.length === 0 || confirmPassword.length === 0) {
            matchText.style.display = 'none';
            return;
        }
        
        matchText.style.display = 'block';
        
        if (password === confirmPassword) {
            matchText.textContent = 'Passwords match';
            matchText.className = 'password-match match';
        } else {
            matchText.textContent = 'Passwords do not match';
            matchText.className = 'password-match mismatch';
        }
        
        checkFormValidity();
    }

    function checkFormValidity() {
        const password = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const submitBtn = document.getElementById('submitBtn');
        
        // Enable button only if:
        // 1. Password is at least 8 characters
        // 2. Passwords match
        // 3. Both fields have values
        if (password.length >= 8 && 
            confirmPassword.length >= 8 && 
            password === confirmPassword) {
            submitBtn.disabled = false;
        } else {
            submitBtn.disabled = true;
        }
    }

    // Initialize form validation on page load
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('newPassword').addEventListener('input', checkPasswordStrength);
        document.getElementById('confirmPassword').addEventListener('input', checkPasswordMatch);
    });
    </script>
</body>
</html>