<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Anime Movie Collection</title>
    <style>
        :root {
            --primary-color: #e53637; /* Vibrant anime red */
            --secondary-color: #0b0c2a; /* Dark navy */
            --accent-color: #a855f7; /* Purple accent */
            --text-light: #f8f9fa;
            --text-dark: #212529;
            --bg-gradient: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            --card-bg: rgba(11, 12, 42, 0.8);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: var(--bg-gradient) fixed;
            color: var(--text-light);
            min-height: 100vh;
            padding: 40px 20px;
            position: relative;
            overflow-x: hidden;
        }
        
        /* Anime decorative elements */
        .anime-decoration {
            position: absolute;
            z-index: -1;
            opacity: 0.15;
        }
        
        .anime-1 {
            top: 10%;
            left: 5%;
            width: 150px;
            animation: float 6s ease-in-out infinite;
        }
        
        .anime-2 {
            bottom: 15%;
            right: 5%;
            width: 120px;
            animation: float 8s ease-in-out infinite;
            animation-delay: 1s;
        }
        
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--text-light);
            font-weight: 600;
            font-size: 32px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            position: relative;
            padding-bottom: 15px;
        }
        
        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: var(--primary-color);
            border-radius: 2px;
        }
        
        .success-message {
            background: rgba(46, 204, 113, 0.2);
            color: #d4edda;
            padding: 12px 20px;
            border-radius: 8px;
            margin: 20px auto;
            max-width: 600px;
            text-align: center;
            border-left: 4px solid #2ecc71;
            font-weight: 500;
        }
        
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 40px;
        }
        
        .movie-card {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            border: 1px solid rgba(229, 54, 55, 0.3);
        }
        
        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }
        
        .movie-poster-container {
            position: relative;
            height: 180px;
            overflow: hidden;
        }
        
        .movie-poster {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .movie-card:hover .movie-poster {
            transform: scale(1.05);
        }
        
        .no-poster {
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: rgba(255, 255, 255, 0.5);
            font-style: italic;
        }
        
        .movie-info {
            padding: 20px;
        }
        
        .movie-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--text-light);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .movie-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.7);
        }
        
        .movie-year {
            color: var(--primary-color);
            font-weight: 500;
        }
        
        .movie-rating {
            display: inline-flex;
            align-items: center;
            background: rgba(229, 54, 55, 0.2);
            padding: 4px 8px;
            border-radius: 20px;
            color: var(--text-light);
        }
        
        .movie-rating i {
            color: #f1c40f;
            margin-right: 5px;
            font-size: 14px;
        }
        
        .movie-overview {
            font-size: 14px;
            line-height: 1.5;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .movie-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
        }
        
        .movie-type {
            background: rgba(168, 85, 247, 0.2);
            color: var(--accent-color);
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .edit-btn {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        
        .edit-btn i {
            margin-right: 5px;
        }
        
        .edit-btn:hover {
            background: #c42b2b;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(229, 54, 55, 0.3);
        }
        
        .watch-btn {
            background: var(--accent-color);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        
        .watch-btn:hover {
            background: #9333ea;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(168, 85, 247, 0.3);
        }
        
        .media-container {
            margin-top: 15px;
            border-radius: 8px;
            overflow: hidden;
        }
        
        .media-placeholder {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            text-align: center;
            color: rgba(255, 255, 255, 0.5);
            font-style: italic;
            border-radius: 8px;
        }
        
        iframe {
            width: 100%;
            height: 180px;
            border: none;
            border-radius: 8px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .movie-grid {
                grid-template-columns: 1fr;
            }
            
            .anime-decoration {
                display: none;
            }
            
            h2 {
                font-size: 26px;
            }
        }
        
        /* Filter and search controls */
        .controls {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .search-box {
            position: relative;
            flex: 1;
            min-width: 250px;
        }
        
        .search-box input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            color: var(--text-light);
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .search-box input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(229, 54, 55, 0.3);
        }
        
        .search-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
        }
        
        .filter-controls {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        .filter-select {
            padding: 12px 15px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            color: var(--text-light);
            font-size: 16px;
            min-width: 150px;
        }
        
        .filter-select:focus {
            outline: none;
            border-color: var(--primary-color);
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .delete-btn {
    background: #dc3545;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
}

.delete-btn i {
    margin-right: 5px;
}

.delete-btn:hover {
    background: #c82333;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
}
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Anime decorative elements -->
    <img src="https://i.imgur.com/J5lQbNp.png" class="anime-decoration anime-1" alt="Anime decoration">
    <img src="https://i.imgur.com/XWQz6yM.png" class="anime-decoration anime-2" alt="Anime decoration">
    
    <div class="container">
        <h2>Anime Collection</h2>
        
        <c:if test="${not empty success}">
            <div class="success-message">
                <i class="fas fa-check-circle"></i> ${success}
            </div>
        </c:if>
        
        <!-- Search and Filter Controls -->
        <div class="controls">
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search anime..." id="searchInput">
            </div>
            <div class="filter-controls">
                <select class="filter-select" id="typeFilter">
                    <option value="">All Types</option>
                    <option value="Movie">Movies</option>
                    <option value="TV-Show">TV Shows</option>
                </select>
                <select class="filter-select" id="yearFilter">
                    <option value="">All Years</option>
                    <!-- Years would be populated dynamically in a real app -->
                    <option value="2023">2023</option>
                    <option value="2022">2022</option>
                    <option value="2021">2021</option>
                </select>
                <select class="filter-select" id="ratingFilter">
                    <option value="">All Ratings</option>
                    <option value="9">9+ Stars</option>
                    <option value="8">8+ Stars</option>
                    <option value="7">7+ Stars</option>
                </select>
            </div>
        </div>
        
        <div class="movie-grid">
            <c:forEach var="movie" items="${movies}">
                <div class="movie-card">
                    <div class="movie-poster-container">
                        <c:choose>
                            <c:when test="${not empty movie.poster_url}">
                                <img class="movie-poster" src="${pageContext.request.contextPath}/proxy-image/${movie.poster_url}" alt="${movie.title} poster" />
                            </c:when>
                            <c:otherwise>
                                <div class="no-poster">
                                    <i class="fas fa-image"></i> No Poster Available
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <div class="movie-info">
                        <h3 class="movie-title">${movie.title}</h3>
                        
                        <div class="movie-meta">
                            <span class="movie-year">${movie.release_year}</span>
                            <span class="movie-rating">
                                <i class="fas fa-star"></i> ${movie.rating}
                            </span>
                        </div>
                        
                        <p class="movie-overview">${movie.overview}</p>
                        
                        <div class="media-container">
                            <c:choose>
                                <c:when test="${not empty movie.trailer_url}">
                                    <iframe src="https://drive.google.com/file/d/${movie.trailer_url}/preview" allow="autoplay" allowfullscreen></iframe>
                                </c:when>
                                <c:otherwise>
                                    <div class="media-placeholder">
                                        <i class="fas fa-video"></i> Trailer Not Available
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                    
                        
                        
                        <div class="movie-actions">
    <span class="movie-type">${movie.type}</span>
    <div class="action-buttons">
        <a href="editMovie/${movie.movie_id}" class="edit-btn">
            <i class="fas fa-edit"></i> Edit
        </a>
        <a href="${pageContext.request.contextPath}/anime-watching/${movie.movie_id}" class="watch-btn">
            <i class="fas fa-play"></i> Watch
        </a>
        <a href="${pageContext.request.contextPath}/deleteMovie/${movie.movie_id}" 
           class="delete-btn" 
           onclick="return confirm('Are you sure you want to delete this movie?')">
            <i class="fas fa-trash"></i> Delete
        </a>
    </div>
</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        // Simple search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const movieCards = document.querySelectorAll('.movie-card');
            
            movieCards.forEach(card => {
                const title = card.querySelector('.movie-title').textContent.toLowerCase();
                if (title.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
        
        // Filter functionality would be implemented similarly
        // This is just a placeholder for the UI
    </script>
</body>
</html>