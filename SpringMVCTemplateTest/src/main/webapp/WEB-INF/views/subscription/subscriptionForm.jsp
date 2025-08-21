<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .confirmation-card {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            padding: 40px;
            margin-top: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }
        
        .confirmation-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
        }
        
        .confirmation-title {
            color: #fff;
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .confirmation-text {
            color: #b8c2cc;
            font-size: 18px;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .package-name {
            color: #4fd1c5;
            font-weight: 700;
        }
        
        .btn-confirm {
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 50px;
            transition: all 0.3s ease;
            margin-right: 15px;
        }
        
        .btn-confirm:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
        }
        
        .btn-cancel {
            background: transparent;
            border: 2px solid #4fd1c5;
            color: #4fd1c5;
            padding: 10px 28px;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        
        .btn-cancel:hover {
            background: rgba(79, 209, 197, 0.1);
            color: #fff;
        }
        
        .breadcrumb-bg {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('<c:url value="/resources/img/normal-breadcrumb.jpg"/>');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
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
            <div class="text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Confirm Subscription</h2>
                    <p>Review your choice before continuing</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Confirmation Section -->
    <section class="spad">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="confirmation-card text-center">
                        <h3 class="confirmation-title">Confirm Your Plan</h3>
                        <p class="confirmation-text">
                            Are you sure you want to subscribe to the 
                            <span class="package-name">${packageName}</span> plan?
                        </p>
                        <form action="<c:url value='/subscribe' />" method="post">
                            <input type="hidden" name="packageId" value="${packageId}" />
                            <button type="submit" class="btn-confirm">Yes, Subscribe</button>
                            <a href="<c:url value='/all-packages' />" class="btn-cancel">Cancel</a>
                        </form>
                    </div>
                </div>
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