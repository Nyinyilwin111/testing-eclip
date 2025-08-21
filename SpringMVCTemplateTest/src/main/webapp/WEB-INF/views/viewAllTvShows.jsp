<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html lang="zxx">

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

    <!-- Css Styles -->
    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet" />
    <!--<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
    <link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/elegant-icons.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/plyr.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/nice-select.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/owl.carousel.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/slicknav.min.css" />" rel="stylesheet" />
    <link href="<c:url value="resources/css/style.css" />" rel="stylesheet" />
    
    <!--  
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    -->
    
    <style>
        /* Custom styles for the filter form */
        #filterPanel {
            background-color: #1a1a1a; /* Darker background to stand out */
            border: 1px solid #333; /* Slightly darker border */
            padding: 20px; /* Reduced padding */
            margin-bottom: 20px; /* Reduced margin at the bottom */
            border-radius: 10px; /* Slightly less rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow */
            color: #ffffff; /* White text for contrast */
        }

        #filterPanel h4 {
            color: #e53637; /* Primary red color from the template for headings */
            margin-bottom: 15px; /* Reduced margin */
            font-weight: 600;
            font-size: 1.2em; /* Slightly smaller heading */
        }

        #filterPanel hr {
            border-top: 1px solid #333; /* Darker hr for better contrast */
            margin: 15px 0; /* Reduced margin */
        }

        #filterPanel p {
            font-size: 15px; /* Slightly smaller font */
            margin-bottom: 8px; /* Reduced margin */
            color: #aaa; /* Lighter grey for section titles */
        }

        #filterPanel label {
            display: flex;
            align-items: center;
            margin-right: 15px; /* Reduced spacing */
            margin-bottom: 8px; /* Reduced margin */
            cursor: pointer;
            font-size: 14px; /* Slightly smaller font */
            color: #fff; /* White text for labels */
        }

        #filterPanel input[type="radio"],
        #filterPanel input[type="checkbox"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            width: 16px; /* Reduced size */
            height: 16px; /* Reduced size */
            border: 2px solid #555;
            border-radius: 50%;
            margin-right: 8px; /* Reduced margin */
            outline: none;
            cursor: pointer;
            position: relative;
            background-color: #333;
            transition: all 0.2s ease;
        }

        /* Style for checkboxes */
        #filterPanel input[type="checkbox"] {
            border-radius: 3px; /* Slightly less rounded */
        }

        /* Checked state for radio buttons */
        #filterPanel input[type="radio"]:checked {
            border-color: #e53637;
            background-color: #e53637;
        }
        #filterPanel input[type="radio"]:checked::before {
            content: '';
            display: block;
            width: 6px; /* Reduced inner circle */
            height: 6px; /* Reduced inner circle */
            background-color: #fff;
            border-radius: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* Checked state for checkboxes */
        #filterPanel input[type="checkbox"]:checked {
            border-color: #e53637;
            background-color: #e53637;
        }
        #filterPanel input[type="checkbox"]:checked::before {
            content: '\f00c';
            font-family: 'FontAwesome';
            display: block;
            color: #fff;
            font-size: 10px; /* Reduced icon size */
            line-height: 1;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }


        #filterPanel .form-group {
            margin-bottom: 12px; /* Reduced margin */
        }

        #filterPanel .btn-group {
            display: flex;
            gap: 10px; /* Reduced gap */
            margin-top: 15px; /* Reduced margin */
        }

        #filterPanel .primary-btn {
            background-color: #e53637;
            border: none;
            padding: 10px 20px; /* Reduced padding */
            border-radius: 6px; /* Slightly less rounded */
            font-size: 15px; /* Slightly smaller font */
            font-weight: 600;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #filterPanel .primary-btn:hover {
            background-color: #ff5252;
        }

        #filterPanel .reset-btn {
            background-color: #555;
            border: none;
            padding: 10px 20px; /* Reduced padding */
            border-radius: 6px; /* Slightly less rounded */
            font-size: 15px; /* Slightly smaller font */
            font-weight: 600;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #filterPanel .reset-btn:hover {
            background-color: #777;
        }

        #filterPanel .flex-wrap {
            display: flex;
            flex-wrap: wrap;
            gap: 8px; /* Reduced spacing */
        }
        
        .pagination {
		    margin-top: 20px;
		    text-align: center;
		}
		.pagination form {
		    display: inline;
		    margin: 0 2px;
		}
		.pagination button {
		    padding: 5px 10px;
		    border: none;
		    background: #eee;
		    cursor: pointer;
		    border-radius: 4px;
		}
		.pagination button.active {
		    background: #007bff;
		    color: white;
		    font-weight: bold;
		}
		
		.pagination button.active {
		    background-color: #007bff;
		    color: white;
		    font-weight: bold;
		    border: 1px solid #0056b3;
		  }
    </style>
</head>

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
                    	<a href="<c:url value="/home"/> ">
                    		<img src="resources/img/logo.png" >
                    	</a>
                        <!-- <a href="./index.html">
							<img src="resources/img/logo.png" >
							
                            <img src="img/logo.png" alt="">
                        </a> -->
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="<c:url value="/home"/>">Homepage</a></li>
                                <li><a href="./categories.html">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.html">Categories</a></li>
                                        <li><a href="<c:url value="/anime-details" />">Anime Details</a></li>
                                        <li><a href="<c:url value="/anime-watching" /> ">Anime Watching</a></li>
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
                        <a href="./login.html"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Hero Section Begin -->
    
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Movies</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-8 col-sm-8">
                                <div class="btn__all">
                                    <a href="javascript:void(0);" onclick="toggleFilter()" class="primary-btn">Filter</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        	<!-- Filter panel (Initially hidden) -->
                        	<div id="filterPanel" class="col-lg-12" style="display: none;">
                        		<form method="post" action="${pageContext.request.contextPath}/filterFormForTV">
                        			<h4>Filter Options</h4>
							        <hr>
							        <!-- Release Year -->
							        <div class="form-group">
							            <p><strong>Released Year:</strong></p>
							            <div class="d-flex flex-wrap">
                                            <label><input type="radio" name="year" value="" ${empty param.year ? 'checked' : ''}> All</label>
							                <label><input type="radio" name="year" value="2025" ${param.year == '2025' ? 'checked' : ''}> 2025</label>
							                <label><input type="radio" name="year" value="2024" ${param.year == '2024' ? 'checked' : ''}> 2024</label>
							                <label><input type="radio" name="year" value="2023" ${param.year == '2023' ? 'checked' : ''}> 2023</label>
                                            <label><input type="radio" name="year" value="2022" ${param.year == '2022' ? 'checked' : ''}> 2022</label>
                                            <label><input type="radio" name="year" value="2021" ${param.year == '2021' ? 'checked' : ''}> 2021</label>
                                            <label><input type="radio" name="year" value="2020" ${param.year == '2020' ? 'checked' : ''}> 2020</label>
                                            <label><input type="radio" name="year" value="Older" ${param.year == 'Older' ? 'checked' : ''}> Older</label>
							            </div>
							        </div>
							        <hr>
							        <!-- Genre -->
							        <div class="form-group">
							            <p><strong>Genre:</strong></p>
							            <div class="d-flex flex-wrap">
                                          
							                <c:forEach var="g" items="${genres}"> <%-- Assuming 'genres' is a collection passed from controller --%>
							                    <label><input type="checkbox" name="genre" value="${g.name}" 
									                    <c:if test="${fn:contains(paramValues.genre, g.name)}"> checked</c:if> /> 
									                    ${g.name}
							                    </label>
							                </c:forEach>
                                            <%-- Placeholder genres if 'genres' list is not available --%>
                                            <c:if test="${empty genres}">
                                                <label><input type="checkbox" name="genre" value="Action" ${param.genre == 'Action' ? 'checked' : ''}/> Action</label>
                                                <label><input type="checkbox" name="genre" value="Adventure" ${param.genre == 'Adventure' ? 'checked' : ''}/> Adventure</label>
                                                <label><input type="checkbox" name="genre" value="Comedy" ${param.genre == 'Comedy' ? 'checked' : ''}/> Comedy</label>
                                                <label><input type="checkbox" name="genre" value="Drama" ${param.genre == 'Drama' ? 'checked' : ''}/> Drama</label>
                                                <label><input type="checkbox" name="genre" value="Fantasy" ${param.genre == 'Fantasy' ? 'checked' : ''}/> Fantasy</label>
                                                <label><input type="checkbox" name="genre" value="Horror" ${param.genre == 'Horror' ? 'checked' : ''}/> Horror</label>
                                                <label><input type="checkbox" name="genre" value="Sci-Fi" ${param.genre == 'Sci-Fi' ? 'checked' : ''}/> Sci-Fi</label>
                                                <label><input type="checkbox" name="genre" value="Thriller" ${param.genre == 'Thriller' ? 'checked' : ''}/> Thriller</label>
                                            </c:if>
							            </div>
							        </div>
							        <hr>
                                    <div class="btn-group">
                                        <button type="submit" class="primary-btn">Apply Filters</button>
                                        <button type="button" class="reset-btn" onclick="resetFilterForm()">Reset Filters</button>
                                    </div>
							     </form>
                        	</div>
                        	<c:forEach var="tv" items="${tvShows}">
	                            <div class="col-lg-4 col-md-6 col-sm-12 mb-4 d-flex align-items-stretch">
	                                <div class="product__item w-100">
	                                	<img src="${pageContext.request.contextPath}/proxy-image/${tv.poster_url}" 
	                                	alt="${tv.title} poster" class="img-fluid"/>
							            <!-- Print the resolved image URL to the console -->
							            <script>
							                console.log("Thumbnail URL: '${thumbnailUrl}'");
						            	</script>
	                                	
	                                    <%-- <div class="product__item__pic set-bg" data-setbg="https://drive.google.com/thumbnail?id=${movie.poster_url}">
	                                        <div class="ep">18 / 18</div>
	                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
	                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
	                                    </div> --%>
	                                    <div class="product__item__text">
	                                        <ul>
	                                            <li>Active</li>
	                                            <li>Movie</li>
	                                        </ul>
	                                        <h5><a href="${pageContext.request.contextPath}/tvshow-details/${tv.tv_id}">${tv.title}</a></h5>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                            
                            <!-- Pagination -->
                            <div class="pagination">
                            	<c:if test="${page > 1}">
                            	<!-- Previous Button -->
                            		<c:choose>
							            <c:when test="${not empty selectedGenres or not empty selectedYear}">
							                <form method="post" action="${pageContext.request.contextPath}/filterFormForTV">
							                    <c:forEach var="g" items="${selectedGenres}">
							                        <input type="hidden" name="genre" value="${g}" />
							                    </c:forEach>
							                    <input type="hidden" name="year" value="${selectedYear}" />
							                    <input type="hidden" name="page" value="${page - 1}" />
							                    <button type="submit">&#8592; Prev</button>
							                </form>
							            </c:when>
							            <c:otherwise>
							                <form method="get" action="${pageContext.request.contextPath}/viewAllTvShows">
							                    <input type="hidden" name="page" value="${page - 1}" />
							                    <button type="submit">&#8592; Prev</button>
							                </form>
							            </c:otherwise>
							        </c:choose>
                            	</c:if>
                            	
                            	<!-- Page Number Buttons -->
                            	<c:forEach begin="1" end="${maxPages}" var="i">
								    <c:choose>
							            <c:when test="${not empty selectedGenres or not empty selectedYear}">
							                <form method="post" action="${pageContext.request.contextPath}/filterFormForTV" style="display:inline;">
							                    <c:forEach var="g" items="${selectedGenres}">
							                        <input type="hidden" name="genre" value="${g}" />
							                    </c:forEach>
							                    <input type="hidden" name="year" value="${selectedYear}" />
							                    <input type="hidden" name="page" value="${i}" />
							                    <button type="submit" <c:if test="${i == page}">class="active"</c:if>>${i}</button>
							                </form>
							            </c:when>
							            <c:otherwise>
							                <form method="get" action="${pageContext.request.contextPath}/viewAllTvShows" style="display:inline;">
							                    <input type="hidden" name="page" value="${i}" />
							                    <button type="submit" <c:if test="${i == page}">class="active"</c:if>>${i}</button>
							                </form>
							            </c:otherwise>
							        </c:choose>
							  </c:forEach>
							  <!-- Next Button -->
							  <c:if test="${page < maxPages}">
								    <c:choose>
							            <c:when test="${not empty selectedGenres or not empty selectedYear}">
							                <form method="post" action="${pageContext.request.contextPath}/filterFormForTV">
							                    <c:forEach var="g" items="${selectedGenres}">
							                        <input type="hidden" name="genre" value="${g}" />
							                    </c:forEach>
							                    <input type="hidden" name="year" value="${selectedYear}" />
							                    <input type="hidden" name="page" value="${page + 1}" />
							                    <button type="submit">Next &#8594;</button>
							                </form>
							            </c:when>
							            <c:otherwise>
							                <form method="get" action="${pageContext.request.contextPath}/viewAllTvShows">
							                    <input type="hidden" name="page" value="${page + 1}" />
							                    <button type="submit">Next &#8594;</button>
							                </form>
							            </c:otherwise>
							        </c:choose>
							  </c:if>
                            </div>
                        </div>
                    </div>
                   
           		</div>
              </div>     
		</div>
	</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
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

<script>
    function toggleFilter() {
        const panel = document.getElementById("filterPanel");
        panel.style.display = (panel.style.display === "none" || panel.style.display === "") ? "block" : "none";
    }
</script>

<!-- <script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script> -->


</body>

</html>