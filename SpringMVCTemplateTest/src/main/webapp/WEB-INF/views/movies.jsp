<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Anime Content</title>
<style>
    :root {
        --primary-color: #e53637; /* Vibrant anime red */
        --secondary-color: #0b0c2a; /* Dark navy */
        --accent-color: #a855f7; /* Purple accent */
        --text-light: #f8f9fa;
        --text-dark: #212529;
        --bg-gradient: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
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
        display: flex;
        justify-content: center;
        align-items: center;
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
    
    .anime-3 {
        top: 25%;
        right: 10%;
        width: 100px;
        animation: float 7s ease-in-out infinite;
        animation-delay: 2s;
    }
    
    @keyframes float {
        0% { transform: translateY(0px); }
        50% { transform: translateY(-20px); }
        100% { transform: translateY(0px); }
    }
    
    .anime-form-container {
        background: rgba(11, 12, 42, 0.8);
        backdrop-filter: blur(10px);
        border-radius: 15px;
        padding: 30px;
        width: 100%;
        max-width: 700px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
        border: 1px solid rgba(229, 54, 55, 0.3);
        position: relative;
        overflow: hidden;
    }
    
    .anime-form-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: var(--primary-color);
    }
    
    h1 {
        text-align: center;
        margin-bottom: 30px;
        color: var(--text-light);
        font-weight: 600;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        position: relative;
        padding-bottom: 10px;
        font-size: 28px;
    }
    
    h1:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 100px;
        height: 3px;
        background: var(--primary-color);
    }
    
    .form-group {
        margin-bottom: 20px;
        position: relative;
    }
    
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: var(--text-light);
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    
    input[type="text"],
    input[type="number"],
    input[type="file"],
    textarea {
        width: 100%;
        padding: 12px 15px;
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.2);
        border-radius: 8px;
        color: var(--text-light);
        font-size: 16px;
        transition: all 0.3s;
    }
    
    textarea {
        min-height: 100px;
        resize: vertical;
    }
    
    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="file"]:focus,
    textarea:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(229, 54, 55, 0.3);
        background: rgba(255, 255, 255, 0.15);
    }
    
    .radio-group {
        display: flex;
        gap: 20px;
        margin: 15px 0;
    }
    
    .radio-option {
        display: flex;
        align-items: center;
    }
    
    .radio-option input {
        margin-right: 8px;
        accent-color: var(--primary-color);
        width: 18px;
        height: 18px;
    }
    
    .radio-option label {
        margin-bottom: 0;
        text-transform: none;
        letter-spacing: normal;
    }
    
    .submit-btn {
        background: var(--primary-color);
        color: white;
        border: none;
        padding: 15px 25px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        width: 100%;
        margin-top: 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
        position: relative;
        overflow: hidden;
    }
    
    .submit-btn:hover {
        background: #c42b2b;
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(229, 54, 55, 0.4);
    }
    
    .submit-btn::after {
        content: '▶';
        position: absolute;
        right: 20px;
        top: 50%;
        transform: translateY(-50%);
        opacity: 0;
        transition: all 0.3s;
    }
    
    .submit-btn:hover::after {
        opacity: 1;
        right: 15px;
    }
    
    .error-message {
        color: #ff6b6b;
        background: rgba(255, 0, 0, 0.1);
        padding: 10px;
        border-radius: 5px;
        margin: 10px 0;
        text-align: center;
        border-left: 3px solid #ff6b6b;
        font-weight: 500;
    }
    
    .file-input-container {
        position: relative;
        margin-bottom: 20px;
    }
    
    .file-input-label {
        display: flex;
        align-items: center;
        padding: 12px 15px;
        background: rgba(255, 255, 255, 0.1);
        border: 1px dashed rgba(255, 255, 255, 0.3);
        border-radius: 8px;
        color: var(--text-light);
        cursor: pointer;
        transition: all 0.3s;
    }
    
    .file-input-label:hover {
        background: rgba(255, 255, 255, 0.15);
        border-color: var(--primary-color);
    }
    
    .file-input-label i {
        margin-right: 10px;
        color: var(--primary-color);
    }
    
    .file-input {
        position: absolute;
        width: 100%;
        height: 100%;
        opacity: 0;
        cursor: pointer;
    }
    
    .file-name {
        margin-top: 5px;
        font-size: 14px;
        color: rgba(255, 255, 255, 0.7);
    }
    
    /* Anime character in corner */
    .anime-character {
        position: absolute;
        bottom: -20px;
        right: -20px;
        width: 150px;
        opacity: 0.7;
        z-index: -1;
    }
    
    @media (max-width: 768px) {
        .anime-decoration {
            display: none;
        }
        
        .anime-character {
            width: 100px;
            opacity: 0.5;
        }
    }
</style>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Anime decorative elements -->
    <img src="https://i.imgur.com/J5lQbNp.png" class="anime-decoration anime-1" alt="Anime decoration">
    <img src="https://i.imgur.com/XWQz6yM.png" class="anime-decoration anime-2" alt="Anime decoration">
    <img src="https://i.imgur.com/9pKjY7L.png" class="anime-decoration anime-3" alt="Anime decoration">
    
    <div class="anime-form-container">
        <!-- Anime character in corner -->
        <img src="https://i.imgur.com/vZ7vQ1a.png" class="anime-character" alt="Anime character">
        
        <h1>Add New Anime</h1>
        
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
        <c:if test="${not empty movieError}">
            <div class="error-message">${movieError}</div>
        </c:if>
        <c:if test="${not empty posterError}">
            <div class="error-message">${posterError}</div>
        </c:if>
        <c:if test="${not empty trailerError}">
            <div class="error-message">${trailerError}</div>
        </c:if>
        
        <form:form method="post" action="movie" modelAttribute="movieObj" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Title</label>
                <form:input path="title" id="title" placeholder="Enter anime title" />
            </div>
            
            <div class="form-group">
                <label>Movie Poster</label>
                <div class="file-input-container">
                    <label class="file-input-label">
                        <i class="fas fa-image"></i>
                        <span>Choose poster file</span>
                        <form:input type="file" path="poster" class="file-input" />
                    </label>
                    <div class="file-name" id="poster-name">No file chosen</div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="overview">Overview</label>
                <form:textarea path="overview" id="overview" placeholder="Enter anime description" />
            </div>
            
            <div class="form-group">
                <label>Movie File</label>
                <div class="file-input-container">
                    <label class="file-input-label">
                        <i class="fas fa-film"></i>
                        <span>Choose movie file</span>
                        <form:input type="file" path="movieFile" class="file-input" />
                    </label>
                    <div class="file-name" id="movieFile-name">No file chosen</div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="release_year">Release Year</label>
                <form:input path="release_year" id="release_year" placeholder="Enter release year" />
            </div>
            
            <div class="form-group">
                <label for="restriced_age">Restricted Age</label>
                <form:input path="restriced_age" id="restriced_age" type="number" placeholder="Enter age restriction" />
            </div>
            
            <div class="form-group">
                <label for="director_id">Director ID</label>
                <form:input path="director_id" id="director_id" type="number" placeholder="Enter director ID" />
            </div>
            
            <div class="form-group">
                <label for="admin_id">Admin ID</label>
                <form:input path="admin_id" id="admin_id" type="number" placeholder="Enter admin ID" />
            </div>
            
            <div class="form-group">
                <label>Trailer File</label>
                <div class="file-input-container">
                    <label class="file-input-label">
                        <i class="fas fa-play-circle"></i>
                        <span>Choose trailer file</span>
                        <form:input type="file" path="trailerFile" class="file-input" />
                    </label>
                    <div class="file-name" id="trailerFile-name">No file chosen</div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="rating">Rating</label>
                <form:input path="rating" id="rating" type="number" step="0.1" placeholder="Enter rating (0-10)" min="0" max="10" />
            </div>
            
            <div class="form-group">
                <label>Type</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <form:radiobutton path="type" value="Movie" id="type-movie" />
                        <label for="type-movie">Movie</label>
                    </div>
                    <div class="radio-option">
                        <form:radiobutton path="type" value="TV-Show" id="type-tvshow" />
                        <label for="type-tvshow">TV-Show</label>
                    </div>
                </div>
            </div>
            
            <button type="submit" class="submit-btn">
                <i class="fas fa-save"></i> Save Anime
            </button>
        </form:form>
    </div>

    <script>
        // Display selected file names
        document.querySelector('input[type="file"][name="poster"]').addEventListener('change', function(e) {
            document.getElementById('poster-name').textContent = e.target.files[0] ? e.target.files[0].name : 'No file chosen';
        });
        
        document.querySelector('input[type="file"][name="movieFile"]').addEventListener('change', function(e) {
            document.getElementById('movieFile-name').textContent = e.target.files[0] ? e.target.files[0].name : 'No file chosen';
        });
        
        document.querySelector('input[type="file"][name="trailerFile"]').addEventListener('change', function(e) {
            document.getElementById('trailerFile-name').textContent = e.target.files[0] ? e.target.files[0].name : 'No file chosen';
        });
    </script>
</body>
</html>