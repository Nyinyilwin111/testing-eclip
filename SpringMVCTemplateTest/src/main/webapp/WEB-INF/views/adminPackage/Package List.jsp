<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Subscription Packages</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Mulish', sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
        }
        .admin-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
        }
        .admin-header {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #334155;
        }
        .admin-title {
            font-family: 'Oswald', sans-serif;
            color: #fff;
            font-size: 2.2rem;
        }
        .table-container {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }
        .table {
            color: #e2e8f0;
            margin-bottom: 0;
        }
        .table th {
            background-color: #1e293b;
            color: #4fd1c5;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid #334155;
        }
        .table td {
            vertical-align: middle;
            border-color: #334155;
        }
        .table tr:hover td {
            background-color: rgba(74, 85, 104, 0.3);
        }
        .btn-action {
            padding: 5px 12px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
            text-decoration: none;
            margin: 0 5px;
        }
        .btn-edit {
            background-color: #4facfe;
            color: white;
        }
        .btn-edit:hover {
            background-color: #3b82f6;
            transform: translateY(-2px);
        }
        .btn-delete {
            background-color: #f87171;
            color: white;
        }
        .btn-delete:hover {
            background-color: #ef4444;
            transform: translateY(-2px);
        }
        .btn-add {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-add:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
            color: white;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="admin-header">
            <h1 class="admin-title">Subscription Packages Management</h1>
        </div>
        
        <div class="table-container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Duration (Days)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pkg" items="${packages}" varStatus="loop">
                        <tr>
                            <td>${loop.count}</td>
                            <td>${pkg.name}</td>
                            <td>${pkg.description}</td>
                            <td>$${pkg.price}</td>
                            <td>${pkg.duration_in_days}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/AdminPackageEdit/${pkg.id}" 
                                   class="btn-action btn-edit">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/AdminPackageDelete/${pkg.id}" 
                                   class="btn-action btn-delete" 
                                   onclick="return confirm('Are you sure you want to delete this package?');">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <a href="${pageContext.request.contextPath}/AdminPackageAdd" class="btn-add">
                <i class="fas fa-plus-circle"></i> Add New Package
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>