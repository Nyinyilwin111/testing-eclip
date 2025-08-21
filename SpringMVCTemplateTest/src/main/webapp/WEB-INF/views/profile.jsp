<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${user.username}'s Profile | AnimeHub</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #f44336;
            --primary-hover: #d32f2f;
            --secondary: #4CAF50;
            --secondary-hover: #388E3C;
            --dark: #0b0c2a;
            --card-bg: #1a1c3d;
            --text-light: #ffffff;
            --text-muted: #a0a0c0;
            --border-radius: 12px;
            --shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--dark);
            color: var(--text-light);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            background-image: 
                radial-gradient(circle at 20% 30%, rgba(244, 67, 54, 0.08) 0%, transparent 25%),
                radial-gradient(circle at 80% 70%, rgba(76, 175, 80, 0.08) 0%, transparent 25%);
        }
        
        .profile-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            width: 100%;
            max-width: 420px;
            padding: 40px 30px;
            text-align: center;
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.08);
            transition: transform 0.3s ease;
        }
        
        .profile-card:hover {
            transform: translateY(-5px);
        }
        
        .profile-pic-container {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            border: 4px solid var(--primary);
            margin: -90px auto 20px;
            overflow: hidden;
            background: var(--card-bg);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }
        
        .profile-pic-container:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
        }
        
        .profile-pic {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .username {
            font-size: 1.8rem;
            margin: 15px 0 5px;
            color: var(--text-light);
            font-weight: 600;
        }
        
        .user-details {
            margin: 25px 0;
        }
        
        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        .detail-row:last-child {
            border-bottom: none;
        }
        
        .detail-label {
            color: var(--text-muted);
            font-weight: 500;
            text-align: left;
        }
        
        .detail-value {
            color: var(--text-light);
            text-align: right;
            font-weight: 400;
        }
        
        .action-buttons {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-top: 25px;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 20px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        
        .btn-primary:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(244, 67, 54, 0.3);
        }
        
        .btn-secondary {
            background: var(--secondary);
            color: white;
        }
        
        .btn-secondary:hover {
            background: var(--secondary-hover);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }
        
        .btn-dark {
            background: #555;
            color: white;
        }
        
        .btn-dark:hover {
            background: #333;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .btn-accent {
            background: #ff9800;
            color: #333;
        }
        
        .btn-accent:hover {
            background: #e68a00;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 152, 0, 0.3);
        }
        
        @media (max-width: 480px) {
            .profile-card {
                padding: 30px 20px;
            }
            
            .action-buttons {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to logout?");
        }
    </script>
</head>
<body>
    <div class="profile-card">
        <div class="profile-pic-container">
            <c:choose>
                <c:when test="${not empty user.profilePicUrl}">
                    <img src="${pageContext.request.contextPath}${user.profilePicUrl}" alt="Profile Picture" class="profile-pic" />
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/resources/img/default.jpg" alt="Default Picture" class="profile-pic" />
                </c:otherwise>
            </c:choose>
        </div>
        
        <h2 class="username">${user.username}</h2>
        
        <div class="user-details">
            <div class="detail-row">
                <span class="detail-label">Email:</span>
                <span class="detail-value">${user.email}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Gender:</span>
                <span class="detail-value">${user.gender}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Age:</span>
                <span class="detail-value">${user.age}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Joined:</span>
                <span class="detail-value">${user.createAt}</span>
            </div>
        </div>
        
        <div class="action-buttons">
            <a href="backhome" class="btn btn-primary">
                <i class="fas fa-home"></i> Home
            </a>
            <a href="editProfile?email=${user.email}" class="btn btn-secondary">
                <i class="fas fa-user-edit"></i> Edit
            </a>
            <a href="logout" class="btn btn-dark" onclick="return confirmLogout()">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
            <a href="changePassword?email=${user.email}" class="btn btn-accent">
                <i class="fas fa-key"></i> Password
            </a>
        </div>
    </div>
</body>
</html>