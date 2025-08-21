<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="MovieNet Subscription Packages">
    <meta name="keywords" content="Movies, Subscription, Packages">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription Packages | MovieNet</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- CSS Styles -->
    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/style.css" />" rel="stylesheet" />
    
    <style>
        .package-card {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            padding: 30px;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .package-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
        }
        
        .package-title {
            color: #fff;
            font-size: 24px;
            margin-bottom: 15px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .package-description {
            color: #b8c2cc;
            font-size: 16px;
            margin-bottom: 20px;
            line-height: 1.6;
            min-height: 60px;
        }
        
        .package-features {
            list-style: none;
            padding: 0;
            margin-bottom: 25px;
        }
        
        .package-features li {
            color: #e2e8f0;
            margin-bottom: 8px;
            font-size: 15px;
        }
        
        .package-features i {
            color: #4fd1c5;
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .btn-subscribe {
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 50px;
            transition: all 0.3s ease;
            display: inline-block;
            text-transform: uppercase;
            color: #fff;
            text-decoration: none;
        }
        
        .btn-subscribe:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
            color: #fff;
        }
        
        .breadcrumb-bg {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('<c:url value="/resources/img/normal-breadcrumb.jpg"/>');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
            margin-bottom: 60px;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .section-title h2 {
            color: #fff;
            font-size: 36px;
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
        }
        
        .section-title h2:after {
            content: '';
            position: absolute;
            width: 60px;
            height: 3px;
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .section-title p {
            color: #b8c2cc;
            font-size: 18px;
        }
    </style>
</head>

<body>
    <!-- Header Section -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="<c:url value='/home' />">
                            <img src="<c:url value='/resources/img/logo.png'/>" alt="MovieNet Logo" />
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="<c:url value='/home' />">Homepage</a></li>
                                <li><a href="#">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="#">Categories</a></li>
                                        <li><a href="#">Anime Details</a></li>
                                        <li><a href="#">Blog Details</a></li>
                                        <li><a href="<c:url value='/signup'/>">Sign Up</a></li>
                                        <li><a href="<c:url value='/login'/>">Login</a></li>
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

    <!-- Breadcrumb Section -->
    <section class="breadcrumb-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Subscription Packages</h2>
                        <p>Choose the best plan that suits your needs</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Packages Section -->
    <section class="spad">
        <div class="container">
            <div class="section-title">
                <h2>Our Subscription Plans</h2>
                <p>Select the perfect package for your movie experience</p>
            </div>
            
            <div class="row">
                <c:forEach var="pkg" items="${packages}">
                    <div class="col-lg-4 col-md-6">
                        <div class="package-card">
                            <h3 class="package-title">${pkg.name}</h3>
                            <p class="package-description">${pkg.description}</p>
                            <ul class="package-features">
                                <li><i class="fa fa-dollar"></i> Price: $${pkg.price}</li>
                                <li><i class="fa fa-clock-o"></i> Duration: ${pkg.duration_in_days} days</li>
                                <li><i class="fa fa-film"></i> Unlimited movies</li>
                                <li><i class="fa fa-star"></i> HD quality</li>
                            </ul>
                            <a href="<c:url value='/subscriptionForm?packageId=${pkg.id}' />" class="btn-subscribe">Subscribe Now</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer__logo">
                        <a href="#"><img src="<c:url value='/resources/img/logo.png'/>" alt="MovieNet Logo" /></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer__nav">
                        <ul>
                            <li class="active"><a href="#">Homepage</a></li>
                            <li><a href="#">Categories</a></li>
                            <li><a href="#">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <p>
                        &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with
                        <i class="fa fa-heart" aria-hidden="true"></i> by MovieNet
                    </p>
                </div>
            </div>
        </div>
    </footer>

    <!-- JavaScript -->
    <script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/resources/js/main.js' />"></script>
</body>
</html>