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
    <title>Anime | Forgot Password</title> <%-- Changed title for clarity --%>

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
                        <a href="<c:url value="/home6" />" > <%-- Changed to /home6 --%>
                        	<img src="resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="<c:url value="/home6" />">Homepage</a></li> <%-- Changed to /home6 --%>
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
                        <h2>Forgot Password</h2>
                        <p>Enter your email to receive a password reset link.</p>
                        <c:if test="${not empty msg}">
                            <div class="alert-box">${msg}</div> <%-- Using alert-box for generic messages (success/error) --%>
                        </c:if>
                        <c:if test="${not empty errorMsg}">
                            <div class="alert-box">${errorMsg}</div> <%-- Specific for errors, often red --%>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="login spad">
        <div class="container">
            <div class="row d-flex justify-content-center"> <%-- Centering the form for forgot password --%>
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Forgot Password</h3>
                        <%-- The action attribute of this form will hit the @PostMapping("/forgotPassword") --%>
                        <%-- In the form section of forgotPassword.jsp --%>
<form:form method="post" action="forgotPassword" modelAttribute="loginObj">
    <div class="input__item">
        <form:input type="email" placeholder="Email address" path="email" required="true"/>
        <span class="icon_mail"></span>
    </div>
    <c:if test="${not empty errorMsg}">
        <div class="alert-box">${errorMsg}</div>
    </c:if>
    <button type="submit" class="site-btn">Get New Password</button>
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
                        <a href="<c:url value="/home6" />"><img src="resources/img/logo.png" alt=""></a> <%-- Changed to /home6 --%>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer__nav">
                        <ul>
                            <li class="active"><a href="<c:url value="/home6" />">Homepage</a></li> <%-- Changed to /home6 --%>
                            <li><a href="./categories.html">Categories</a></li>
                            <li><a href="./blog.html">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <p>
                      Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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

</body>

</html>