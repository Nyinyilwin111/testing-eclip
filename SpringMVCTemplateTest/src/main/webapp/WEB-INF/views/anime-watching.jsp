<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html lang="zxx">

 <style>
    .star-rating {
        color: #ffc107; /* gold */
        font-size: 1.2em;
    }

    .star-rating .star {
        font-size: 25px;
        cursor: pointer;
        color: #ccc;
    }

    .star-rating .star.selected,
    .star-rating .star.hovered {
        color: #ffc107;
    }

    /* 1. Reviews Title in White */
    .review-title {
        font-weight: 700;
        font-size: 1.8em;
        color: white;
        margin-bottom: 15px;
    }

    .review-label {
        font-weight: 600;
        font-size: 1.3em;
        color: white;
        display: block;
        margin-bottom: 8px;
    }

    .white-label {
        color: white;
        font-weight: 600;
        font-size: 1.3em;
        display: block;
        margin-bottom: 8px;
    }

    /* 2. Submit Button Style */
    .submit-btn {
    background-color: red;      
    color: white;             
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    transition: background-color 0.2s ease, color 0.2s ease;
}

.submit-btn:active {
    background-color: white;   
    color: black;            
}

    /* 3. Delete Link in Red */
    .delete-link {
        color: red;
        font-weight: bold;
        text-decoration: none;
    }

    .delete-link:hover {
        text-decoration: underline;
    }
</style>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.plyr.io/3.7.8/plyr.css" />
    

    <!-- Css Styles -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/elegant-icons.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/plyr.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/nice-select.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/owl.carousel.min.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/slicknav.min.css" />" rel="stylesheet" />
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
    
   
</head>
<script src="https://cdn.plyr.io/3.7.8/plyr.polyfilled.js"></script>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./index.html">
                            <img src="<c:url value='/resources/img/logo.png' />" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="<c:url value="/home" />">Homepage</a></li>
                                <li><a href="./categories.html">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.html">Categories</a></li>
                                        <li><a href="<c:url value="/anime-details" />">Anime Details</a></li>
                                        <li><a href="./anime-watching.html">Anime Watching</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="<c:url value="/signup" />">Sign Up</a></li>
                                        <li><a href="<c:url value="/login" />">Login</a></li>
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
                        <a href="./login.html"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="<c:url value="/home" />"><i class="fa fa-home"></i> Home</a>
                        <a href="./categories.html">Categories</a>
                        <a href="#">Romance</a>
                        <span>Fate Stay Night: Unlimited Blade</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="anime__video__player">
                    	
                    	<script>
					        console.log("Movie file ID: ${movie.movie_file_url}");
					    </script>
                    	<iframe 
						    src="https://drive.google.com/file/d/${movie.movie_file_url}/preview"
						    width="640" height="360" allow="autoplay" allowfullscreen>
						</iframe>\
                        
                       
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                   <div class="anime__details__review">
              <h5 class="review-title">Reviews</h5>

    <!-- Review Loop Start -->
    <c:forEach var="review" items="${reviews}">
        <div class="anime__review__item">
        
    <div class="anime__review__item__pic">
    <img src="<c:url value='${review.user.profilePicUrl}' />"  style="width:60px; height:60px; border-radius:50%;">
</div>
            <div class="anime__review__item__text">
               <h6>${review.user.username} - <span>${review.reviewDate}</span></h6>
                <p>${review.comment}</p>
                <p>Rating: 
                    <c:forEach begin="1" end="5" var="i">
                        <c:choose>
                            <c:when test="${i <= review.rating}">
                                ★
                            </c:when>
                            <c:otherwise>
                                ☆
                            </c:otherwise>
                        </c:choose>
                       
                    </c:forEach>
                </p>
                  <a href="${pageContext.request.contextPath}/review/delete/${review.id}" class="delete-link">Delete</a>
            </div>
        </div>
    </c:forEach>
    <!-- Review Loop End -->
  <div class="section-title">
        
    <h5 style="color:white; font-weight:700; font-size:1.8em; margin-bottom:15px;">Leave a Review</h5>
    <form:form method="post" action="/SpringMVCMaven/review/save" modelAttribute="review">

    <form:hidden path="moviesId" />
    <form:hidden path="userId" />

    <!-- ⭐ Star Rating Section -->
    <label style="color:white; font-weight:600; font-size:1.3em; display:block; margin-bottom:8px;">Rating:</label>
    <div class="star-rating">
        <span class="star" data-value="1">☆</span>
        <span class="star" data-value="2">☆</span>
        <span class="star" data-value="3">☆</span>
        <span class="star" data-value="4">☆</span>
        <span class="star" data-value="5">☆</span>
    </div>
    <form:hidden path="rating" id="ratingInput" />

    <br><br>

    <form:label path="comment" cssClass="white-label">Your Comment:</form:label>
    <form:textarea path="comment" rows="4" cols="40" /><br><br>

   <input type="submit" value="→ Send" class="submit-btn" />
</form:form>

</div>
            </div>
        </div>
        </div>
    </section>
    <!-- Anime Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="page-up">
            <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer__logo">
                        <a href="./index.html"><img src="<c:url value='/resources/img/logo.png' />" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer__nav">
                        <ul>
                            <li class="active"><a href="./index.html">Homepage</a></li>
                            <li><a href="./categories.html">Categories</a></li>
                            <li><a href="./blog.html">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                      Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                      <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>

                  </div>
              </div>
          </div>
      </footer>
      <!-- Footer Section End -->

      <!-- Search model Begin -->
      <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/player.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.nice-select.min.js" />"></script>
	<script src="<c:url value="/resources/js/mixitup.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.slicknav.js" />"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
	<script src="<c:url value="/resources/js/main.js" />"></script>
	
	<!-- ✅ Custom Star Rating Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const stars = document.querySelectorAll(".star-rating .star");
            const ratingInput = document.getElementById("ratingInput");

            stars.forEach((star, index) => {
                star.addEventListener("mouseover", () => {
                    highlightStars(index);
                });

                star.addEventListener("mouseout", () => {
                    resetStars();
                });

                star.addEventListener("click", () => {
                    ratingInput.value = index + 1;
                    setSelectedStars(index);
                });
            });

            function highlightStars(index) {
                for (let i = 0; i <= index; i++) {
                    stars[i].classList.add("hovered");
                }
            }

            function resetStars() {
                stars.forEach(s => s.classList.remove("hovered"));
            }

            function setSelectedStars(index) {
                stars.forEach(s => s.classList.remove("selected"));
                for (let i = 0; i <= index; i++) {
                    stars[i].classList.add("selected");
                }
            }
        });
    </script>

</body>

</html>