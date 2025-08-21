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
    <title>Anime | OTP Verification</title>

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
        .otp-input-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .otp-input {
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background: #232227;
            color: white;
        }
        .otp-input:focus {
            outline: none;
            border-color: #e53637;
        }
        .resend-otp {
            text-align: center;
            margin-top: 15px;
        }
        .resend-otp a {
            color: #e53637;
            cursor: pointer;
        }
        .resend-otp a:hover {
            text-decoration: underline;
        }
        .countdown {
            color: #666;
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
                        <h2>OTP Verification</h2>
                        <p>Enter the 6-digit code sent to your email</p>
                        <c:if test="${not empty message}">
                            <div class="success-box">${message}</div>
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
                        <h3>Verify Your Identity</h3>
                        <form:form method="post" action="ValidateOtp" modelAttribute="loginObj">
                            <div class="otp-input-container">
                                <input type="text" class="otp-input" maxlength="1" data-index="1" autofocus>
                                <input type="text" class="otp-input" maxlength="1" data-index="2">
                                <input type="text" class="otp-input" maxlength="1" data-index="3">
                                <input type="text" class="otp-input" maxlength="1" data-index="4">
                                <input type="text" class="otp-input" maxlength="1" data-index="5">
                                <input type="text" class="otp-input" maxlength="1" data-index="6">
                                <form:input type="hidden" path="otp" id="fullOtp"/>
                            </div>
                            <div class="resend-otp">
                                <span class="countdown" id="countdown">02:00</span>
                                <a id="resendLink" style="display:none">Resend OTP</a>
                            </div>
                            <button type="submit" class="site-btn">Verify</button>
                        </form:form>
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

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // OTP input handling
        const otpInputs = document.querySelectorAll('.otp-input');
        const fullOtpInput = document.getElementById('fullOtp');
        
        otpInputs.forEach((input, index) => {
            // Handle paste event
            input.addEventListener('paste', (e) => {
                e.preventDefault();
                const pasteData = e.clipboardData.getData('text/plain').trim();
                if (/^\d{6}$/.test(pasteData)) {
                    pasteData.split('').forEach((char, i) => {
                        if (otpInputs[i]) {
                            otpInputs[i].value = char;
                        }
                    });
                    updateFullOtp();
                    otpInputs[5].focus();
                }
            });
            
            // Handle keydown event
            input.addEventListener('keydown', (e) => {
                if (e.key === 'Backspace' && input.value === '' && index > 0) {
                    otpInputs[index - 1].focus();
                }
            });
            
            // Handle input event
            input.addEventListener('input', (e) => {
                if (input.value.length === 1 && index < otpInputs.length - 1) {
                    otpInputs[index + 1].focus();
                }
                updateFullOtp();
            });
        });
        
        function updateFullOtp() {
            let otp = '';
            otpInputs.forEach(input => {
                otp += input.value;
            });
            fullOtpInput.value = otp;
        }
        
        // Countdown timer for OTP resend
        let timeLeft = 120;
        const countdownElement = document.getElementById('countdown');
        const resendLink = document.getElementById('resendLink');
        
        const timer = setInterval(() => {
            const minutes = Math.floor(timeLeft / 60);
            const seconds = timeLeft % 60;
            countdownElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            
            if (timeLeft <= 0) {
                clearInterval(timer);
                countdownElement.style.display = 'none';
                resendLink.style.display = 'inline';
            } else {
                timeLeft--;
            }
        }, 1000);
        
        // Resend OTP functionality
        resendLink.addEventListener('click', function() {
            fetch('<c:url value="/forgotPassword"/>', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    email: '${email}' // Assuming email is available in the model
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('New OTP has been sent to your email');
                    timeLeft = 120;
                    countdownElement.style.display = 'inline';
                    resendLink.style.display = 'none';
                    
                    // Restart the timer
                    const timer = setInterval(() => {
                        const minutes = Math.floor(timeLeft / 60);
                        const seconds = timeLeft % 60;
                        countdownElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
                        
                        if (timeLeft <= 0) {
                            clearInterval(timer);
                            countdownElement.style.display = 'none';
                            resendLink.style.display = 'inline';
                        } else {
                            timeLeft--;
                        }
                    }, 1000);
                } else {
                    alert('Failed to resend OTP. Please try again.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while resending OTP');
            });
        });
    });
    </script>
</body>
</html>