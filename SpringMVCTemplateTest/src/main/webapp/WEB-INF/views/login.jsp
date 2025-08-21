<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Login</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- CSS Styles -->
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/elegant-icons.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/plyr.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/nice-select.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/owl.carousel.min.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/slicknav.min.css' />" rel="stylesheet" />
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet" />
</head>

<body>

    <!-- Page Preloader -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="<c:url value='/home' />"><img src="resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="<c:url value='/home6' />">Homepage</a></li>
                                <li><a href="#">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="#">Categories</a></li>
                                        <li><a href="#">Anime Details</a></li>
                                        <li><a href="#">Blog Details</a></li>
                                        <li><a href="<c:url value='/signup' />">Sign Up</a></li>
                                        <li><a href="<c:url value='/login' />">Login</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Our Blog</a></li>
                                <li><a href="#">Contacts</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        <a href="<c:url value='/login' />"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Login</h2>
                        <p>Welcome to the official Anime blog.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>

                        <!-- ✅ Added this block to show error message in red -->
                        <c:if test="${not empty msg}">
                            <p style="color:red;">${msg}</p>
                        </c:if>
                         <c:if test="${not empty adm}">
                            <p style="color:red;">${adm}</p>
                        </c:if>

                        <form:form method="post" action="loginUser" modelAttribute="loginObj">
                            <div class="input__item">
                                <form:input type="text" path="email" placeholder="Email address"/>
                                <span class="icon_mail"></span>
                            </div>
                            
                            <div class="input__item">
                                <form:input type="password" path="password" placeholder="Password"/>
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">Login Now</button>
                        </form:form>
                        

                        <a href="<c:url value='/forgotPassword' />" class="forget_pass">Forgot Your Password?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>Don’t Have An Account?</h3>
                        <a href="<c:url value='/signup' />">Register Now</a>
                    </div>
                </div>
            </div>

            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

    <!-- Footer Begin -->
    <footer class="footer">
        <div class="page-up">
            <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer__logo">
                        <a href="./index.html"><img src="resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer__nav">
                        <ul>
                            <li class="active"><a href="home6">Homepage</a></li>
                            <li><a href="#">Categories</a></li>
                            <li><a href="#">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <p>
                        Copyright &copy;
                        <script>document.write(new Date().getFullYear());</script>
                        All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by 
                        <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer End -->

    <!-- Search Model Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search Model End -->

    <!-- JS Plugins -->
    <script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/resources/js/player.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
    <script src="<c:url value='/resources/js/mixitup.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.slicknav.js' />"></script>
    <script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
    <script src="<c:url value='/resources/js/main.js' />"></script>

</body>
</html>
