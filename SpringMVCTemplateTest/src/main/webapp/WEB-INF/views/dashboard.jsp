<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AnimeFlix Admin Dashboard</title>
    <style>
        :root {
            --primary-color: #e53637; /* Vibrant anime red */
            --primary-light: rgba(229, 54, 55, 0.1);
            --secondary-color: #0b0c2a; /* Dark navy */
            --accent-color: #a855f7; /* Purple accent */
            --text-light: #f8f9fa;
            --text-dark: #212529;
            --bg-gradient: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            --card-bg: rgba(255, 255, 255, 0.95);
            --sidebar-bg: rgba(11, 12, 42, 0.95);
            --success-color: #4ade80;
            --warning-color: #fbbf24;
            --danger-color: #f87171;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            display: flex;
            min-height: 100vh;
            background: var(--bg-gradient) fixed;
            color: var(--text-dark);
            position: relative;
            overflow-x: hidden;
        }
        
        /* Anime decorative elements */
        .anime-decoration {
            position: absolute;
            z-index: -1;
            opacity: 0.08;
            pointer-events: none;
        }
        
        .anime-1 {
            top: 10%;
            left: 5%;
            width: 200px;
            animation: float 8s ease-in-out infinite;
        }
        
        .anime-2 {
            bottom: 15%;
            right: 5%;
            width: 180px;
            animation: float 10s ease-in-out infinite 2s;
        }
        
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(2deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }
        
        /* Sidebar with anime theme */
        .sidebar {
            width: 280px;
            background: var(--sidebar-bg);
            backdrop-filter: blur(10px);
            color: var(--text-light);
            padding: 20px 0;
            transition: all 0.3s;
            box-shadow: 5px 0 25px rgba(0, 0, 0, 0.3);
            z-index: 10;
            position: relative;
            border-right: 1px solid rgba(229, 54, 55, 0.2);
        }
        
        .sidebar-header {
            padding: 0 25px 25px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .sidebar-logo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--primary-color);
            margin: 0 auto;
            display: block;
            box-shadow: 0 4px 15px rgba(229, 54, 55, 0.4);
        }
        
        .sidebar-header h3 {
            color: white;
            margin-top: 15px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            font-weight: 600;
            font-size: 20px;
        }
        
        .sidebar-menu {
            padding: 25px 0;
        }
        
        .sidebar-menu ul {
            list-style: none;
        }
        
        .sidebar-menu li a {
            display: flex;
            align-items: center;
            padding: 14px 25px;
            color: var(--text-light);
            text-decoration: none;
            transition: all 0.3s;
            margin: 8px 15px;
            border-radius: 8px;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }
        
        .sidebar-menu li a::before {
            content: '';
            position: absolute;
            left: -100%;
            top: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(229, 54, 55, 0.3), transparent);
            transition: all 0.6s;
        }
        
        .sidebar-menu li a:hover::before {
            left: 100%;
        }
        
        .sidebar-menu li a:hover,
        .sidebar-menu li a.active {
            background: rgba(229, 54, 55, 0.2);
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .sidebar-menu li a.active {
            background: rgba(229, 54, 55, 0.3);
            border-left: 4px solid var(--primary-color);
        }
        
        .sidebar-menu li a i {
            margin-right: 12px;
            color: var(--primary-color);
            font-size: 18px;
            width: 24px;
            text-align: center;
        }
        
        .sidebar-menu li a span {
            flex: 1;
        }
        
        .sidebar-menu li a .badge {
            background: var(--primary-color);
            color: white;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 12px;
            font-weight: 600;
        }
        
        /* Main content area */
        .main-content {
            flex: 1;
            padding: 30px;
            background-color: transparent;
            position: relative;
        }
        
        /* Header with search */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 25px;
            background: var(--card-bg);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            border-radius: 12px;
            border-left: 5px solid var(--primary-color);
            position: relative;
            overflow: hidden;
        }
        
        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, rgba(229, 54, 55, 0.03) 0%, transparent 100%);
            pointer-events: none;
        }
        
        .search-bar {
            display: flex;
            align-items: center;
            position: relative;
            flex: 1;
            max-width: 500px;
        }
        
        .search-bar input {
            padding: 12px 20px 12px 50px;
            border: 2px solid #e2e8f0;
            border-radius: 30px;
            width: 100%;
            font-size: 15px;
            transition: all 0.3s;
            background-color: #f8fafc;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .search-bar input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(229, 54, 55, 0.2);
        }
        
        .search-bar button {
            position: absolute;
            left: 20px;
            background: none;
            border: none;
            color: var(--primary-color);
            font-size: 18px;
        }
        
        .user-area {
            display: flex;
            align-items: center;
            background: rgba(229, 54, 55, 0.1);
            padding: 8px 15px 8px 8px;
            border-radius: 30px;
            transition: all 0.3s;
            cursor: pointer;
            position: relative;
        }
        
        .user-area:hover {
            background: rgba(229, 54, 55, 0.2);
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            border: 2px solid var(--primary-color);
            object-fit: cover;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        
        .user-name {
            font-weight: 600;
            color: var(--secondary-color);
            margin-right: 8px;
        }
        
        .user-dropdown {
            position: absolute;
            top: 100%;
            right: 0;
            background: white;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 10px 0;
            min-width: 200px;
            display: none;
            z-index: 100;
        }
        
        .user-area:hover .user-dropdown {
            display: block;
        }
        
        .user-dropdown a {
            display: block;
            padding: 10px 20px;
            color: var(--secondary-color);
            text-decoration: none;
            transition: all 0.2s;
        }
        
        .user-dropdown a:hover {
            background: #f8f9fa;
            color: var(--primary-color);
        }
        
        .user-dropdown a i {
            margin-right: 10px;
            color: var(--primary-color);
            width: 20px;
            text-align: center;
        }
        
        /* Dashboard cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        
        .dashboard-card {
            background: var(--card-bg);
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            border-top: 5px solid var(--primary-color);
        }
        
        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255,255,255,0.1) 0%, transparent 100%);
            pointer-events: none;
        }
        
        .dashboard-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }
        
        .card-success {
            border-top-color: var(--success-color);
        }
        
        .card-warning {
            border-top-color: var(--warning-color);
        }
        
        .card-danger {
            border-top-color: var(--danger-color);
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }
        
        .card-title {
            font-size: 16px;
            color: #555;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .card-icon {
            font-size: 28px;
            color: var(--primary-color);
            background: var(--primary-light);
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .card-body {
            margin-bottom: 15px;
        }
        
        .card-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--secondary-color);
            margin: 10px 0;
        }
        
        .card-footer {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #777;
        }
        
        .trend-up {
            color: var(--success-color);
            display: flex;
            align-items: center;
        }
        
        .trend-down {
            color: var(--danger-color);
            display: flex;
            align-items: center;
        }
        
        .trend-up i, .trend-down i {
            margin-right: 5px;
        }
        
        /* Recent orders table */
        .recent-section {
            background: var(--card-bg);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--secondary-color);
            position: relative;
            padding-bottom: 10px;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 3px;
        }
        
        .section-actions a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            transition: all 0.3s;
        }
        
        .section-actions a:hover {
            color: var(--secondary-color);
        }
        
        .section-actions a i {
            margin-left: 8px;
            transition: all 0.3s;
        }
        
        .section-actions a:hover i {
            transform: translateX(3px);
        }
        
        .data-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .data-table thead th {
            background: #f8f9fa;
            padding: 15px;
            text-align: left;
            color: var(--secondary-color);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #e2e8f0;
        }
        
        .data-table tbody td {
            padding: 15px;
            border-bottom: 1px solid #e2e8f0;
            color: #555;
        }
        
        .data-table tbody tr:last-child td {
            border-bottom: none;
        }
        
        .data-table tbody tr:hover {
            background: #f8f9fa;
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
            min-width: 80px;
            text-align: center;
        }
        
        .status-completed {
            background: #dcfce7;
            color: #166534;
        }
        
        .status-pending {
            background: #fef9c3;
            color: #854d0e;
        }
        
        .status-failed {
            background: #fee2e2;
            color: #991b1b;
        }
        
        .action-link {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 18px;
            transition: all 0.3s;
            display: inline-block;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            border-radius: 50%;
        }
        
        .action-link:hover {
            color: white;
            background: var(--primary-color);
            transform: scale(1.1);
        }
        
        /* Responsive adjustments */
        @media (max-width: 1200px) {
            .sidebar {
                width: 240px;
            }
        }
        
        @media (max-width: 992px) {
            .sidebar {
                position: fixed;
                left: -280px;
                top: 0;
                bottom: 0;
                z-index: 1000;
                transition: all 0.3s;
            }
            
            .sidebar.active {
                left: 0;
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .mobile-menu-toggle {
                display: block;
            }
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: stretch;
                gap: 15px;
            }
            
            .search-bar {
                max-width: 100%;
            }
            
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }
        
        /* Mobile menu toggle */
        .mobile-menu-toggle {
            display: none;
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1001;
            background: var(--primary-color);
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(229, 54, 55, 0.4);
            transition: all 0.3s;
        }
        
        .mobile-menu-toggle:hover {
            transform: scale(1.1);
        }
        
        @media (min-width: 993px) {
            .mobile-menu-toggle {
                display: none;
            }
        }
        
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .dashboard-card {
            animation: fadeIn 0.5s ease-out forwards;
        }
        
        .dashboard-card:nth-child(1) { animation-delay: 0.1s; }
        .dashboard-card:nth-child(2) { animation-delay: 0.2s; }
        .dashboard-card:nth-child(3) { animation-delay: 0.3s; }
        .dashboard-card:nth-child(4) { animation-delay: 0.4s; }
        
        .recent-section {
            animation: fadeIn 0.5s ease-out 0.5s both;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Anime decorative elements -->
    <img src="https://i.imgur.com/J5lQbNp.png" class="anime-decoration anime-1" alt="Anime decoration">
    <img src="https://i.imgur.com/XWQz6yM.png" class="anime-decoration anime-2" alt="Anime decoration">
    
    <!-- Mobile menu toggle -->
    <div class="mobile-menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </div>
    
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <img src="https://i.imgur.com/vZ7vQ1a.png" class="sidebar-logo" alt="AnimeFlix Logo">
            <h3>AnimeFlix Admin</h3>
        </div>
        <div class="sidebar-menu">
            <ul>
               
                <li><a href="movieupload"><i class="fas fa-cloud-upload-alt"></i> <span>Upload Movie</span></a></li>
                <li><a href="movie-list"><i class="fas fa-list"></i> <span>Movie List</span> <span class="badge">42</span></a></li>
                <li><a href="#"><i class="fas fa-shopping-cart"></i> <span>Orders</span> <span class="badge">12</span></a></li>
                <li><a href="#"><i class="fas fa-chart-line"></i> <span>Analytics</span></a></li>
                <li><a href="#"><i class="fas fa-users-cog"></i> <span>User Management</span></a></li>
                <li><a href="#"><i class="fas fa-cog"></i> <span>Settings</span></a></li>
                <li><a href="#"><i class="fas fa-question-circle"></i> <span>Help Center</span></a></li>
            </ul>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="search-bar">
                <input type="text" placeholder="Search movies, users, orders...">
                <button><i class="fas fa-search"></i></button>
            </div>
            <div class="user-area">
                <img src="https://i.imgur.com/yXOvdOSs.jpg" class="user-avatar" alt="User Avatar">
                <span class="user-name">Admin User</span>
                <i class="fas fa-chevron-down"></i>
                
                <div class="user-dropdown">
                    <a href="#"><i class="fas fa-user"></i> My Profile</a>
                    <a href="#"><i class="fas fa-cog"></i> Account Settings</a>
                    <a href="#"><i class="fas fa-bell"></i> Notifications</a>
                    <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </div>
            </div>
        </div>

        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="card-header">
                    <div class="card-title">Total Revenue</div>
                    <div class="card-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                </div>
                <div class="card-body">
                    <div class="card-value">$24,780</div>
                    <div class="card-footer">
                        <span class="trend-up"><i class="fas fa-arrow-up"></i> 12% from last month</span>
                    </div>
                </div>
            </div>
            
            <div class="dashboard-card card-success">
                <div class="card-header">
                    <div class="card-title">Total Movies</div>
                    <div class="card-icon">
                        <i class="fas fa-film"></i>
                    </div>
                </div>
                <div class="card-body">
                    <div class="card-value">142</div>
                    <div class="card-footer">
                        <span class="trend-up"><i class="fas fa-arrow-up"></i> 8 new this month</span>
                    </div>
                </div>
            </div>
            
            <div class="dashboard-card card-warning">
                <div class="card-header">
                    <div class="card-title">Pending Orders</div>
                    <div class="card-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                </div>
                <div class="card-body">
                    <div class="card-value">56</div>
                    <div class="card-footer">
                        <span class="trend-down"><i class="fas fa-arrow-down"></i> 3% from last month</span>
                    </div>
                </div>
            </div>
            
            <div class="dashboard-card card-danger">
                <div class="card-header">
                    <div class="card-title">Active Users</div>
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
                <div class="card-body">
                    <div class="card-value">3,248</div>
                    <div class="card-footer">
                        <span class="trend-up"><i class="fas fa-arrow-up"></i> 15% growth</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Orders Section -->
        <div class="recent-section">
            <div class="section-header">
                <h3 class="section-title">Recent Orders</h3>
                <div class="section-actions">
                    <a href="#">View All <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#ORD-7841</td>
                        <td>John Smith</td>
                        <td>2023-06-15</td>
                        <td>$245.00</td>
                        <td><span class="status-badge status-completed">Completed</span></td>
                        <td><a href="#" class="action-link"><i class="fas fa-eye"></i></a></td>
                    </tr>
                    <tr>
                        <td>#ORD-7840</td>
                        <td>Sarah Johnson</td>
                        <td>2023-06-14</td>
                        <td>$189.50</td>
                        <td><span class="status-badge status-pending">Pending</span></td>
                        <td><a href="#" class="action-link"><i class="fas fa-edit"></i></a></td>
                    </tr>
                    <tr>
                        <td>#ORD-7839</td>
                        <td>Michael Brown</td>
                        <td>2023-06-14</td>
                        <td>$320.75</td>
                        <td><span class="status-badge status-completed">Completed</span></td>
                        <td><a href="#" class="action-link"><i class="fas fa-eye"></i></a></td>
                    </tr>
                    <tr>
                        <td>#ORD-7838</td>
                        <td>Emily Davis</td>
                        <td>2023-06-13</td>
                        <td>$95.20</td>
                        <td><span class="status-badge status-failed">Failed</span></td>
                        <td><a href="#" class="action-link"><i class="fas fa-trash"></i></a></td>
                    </tr>
                    <tr>
                        <td>#ORD-7837</td>
                        <td>Robert Wilson</td>
                        <td>2023-06-12</td>
                        <td>$412.00</td>
                        <td><span class="status-badge status-completed">Completed</span></td>
                        <td><a href="#" class="action-link"><i class="fas fa-eye"></i></a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <!-- Recent Movies Section -->
        <div class="recent-section">
            <div class="section-header">
                <h3 class="section-title">Recently Added Movies</h3>
                <div class="section-actions">
                    <a href="#">View All <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
            
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Release Year</th>
                        <th>Type</th>
                        <th>Rating</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Demon Slayer: Mugen Train</td>
                        <td>2023</td>
                        <td>Movie</td>
                        <td>9.2</td>
                        <td><span class="status-badge status-completed">Published</span></td>
                        <td>
                            <a href="#" class="action-link" title="View"><i class="fas fa-eye"></i></a>
                            <a href="#" class="action-link" title="Edit"><i class="fas fa-edit"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>Attack on Titan Final Season</td>
                        <td>2023</td>
                        <td>TV-Show</td>
                        <td>9.8</td>
                        <td><span class="status-badge status-completed">Published</span></td>
                        <td>
                            <a href="#" class="action-link" title="View"><i class="fas fa-eye"></i></a>
                            <a href="#" class="action-link" title="Edit"><i class="fas fa-edit"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>Jujutsu Kaisen 0</td>
                        <td>2022</td>
                        <td>Movie</td>
                        <td>9.1</td>
                        <td><span class="status-badge status-pending">Pending Review</span></td>
                        <td>
                            <a href="#" class="action-link" title="View"><i class="fas fa-eye"></i></a>
                            <a href="#" class="action-link" title="Edit"><i class="fas fa-edit"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>My Hero Academia Season 6</td>
                        <td>2022</td>
                        <td>TV-Show</td>
                        <td>8.9</td>
                        <td><span class="status-badge status-completed">Published</span></td>
                        <td>
                            <a href="#" class="action-link" title="View"><i class="fas fa-eye"></i></a>
                            <a href="#" class="action-link" title="Edit"><i class="fas fa-edit"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>Chainsaw Man</td>
                        <td>2022</td>
                        <td>TV-Show</td>
                        <td>9.5</td>
                        <td><span class="status-badge status-completed">Published</span></td>
                        <td>
                            <a href="#" class="action-link" title="View"><i class="fas fa-eye"></i></a>
                            <a href="#" class="action-link" title="Edit"><i class="fas fa-edit"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Mobile menu toggle
        document.getElementById('menuToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('active');
        });
        
        // Search functionality would be implemented here
        // Table sorting and filtering would be implemented here
        
        // Animation on scroll
        const animateOnScroll = function() {
            const elements = document.querySelectorAll('.dashboard-card, .recent-section');
            
            elements.forEach(element => {
                const elementPosition = element.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.2;
                
                if (elementPosition < screenPosition) {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }
            });
        };
        
        window.addEventListener('scroll', animateOnScroll);
        animateOnScroll(); // Run once on page load
    </script>
</body>
</html>