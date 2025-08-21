<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Package</title>
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
            max-width: 800px;
            margin: 30px auto;
            padding: 30px;
        }
        .admin-header {
            margin-bottom: 30px;
            text-align: center;
        }
        .admin-title {
            font-family: 'Oswald', sans-serif;
            color: #fff;
            font-size: 2.2rem;
            margin-bottom: 10px;
        }
        .form-container {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            color: #94a3b8;
            font-weight: 600;
            margin-bottom: 8px;
        }
        .form-control {
            background-color: #1e293b;
            border: 1px solid #334155;
            color: #e2e8f0;
            padding: 10px 15px;
            border-radius: 8px;
        }
        .form-control:focus {
            background-color: #1e293b;
            color: #e2e8f0;
            border-color: #4fd1c5;
            box-shadow: 0 0 0 0.25rem rgba(79, 209, 197, 0.25);
        }
        .btn-submit {
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 50px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 10px;
        }
        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
        }
        .btn-back {
            display: inline-block;
            margin-top: 20px;
            color: #94a3b8;
            text-decoration: none;
            transition: color 0.3s;
        }
        .btn-back:hover {
            color: #4fd1c5;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="admin-header">
            <h1 class="admin-title">Edit Subscription Package</h1>
        </div>
        
        <div class="form-container">
            <form:form method="POST" action="/AdminPackageUpdate" modelAttribute="pkg">
                <form:hidden path="id"/>
                
                <div class="form-group">
                    <label class="form-label">Package Name</label>
                    <form:input path="name" class="form-control" required="true"/>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Description</label>
                    <form:textarea path="description" class="form-control" rows="3" required="true"/>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Price ($)</label>
                            <form:input path="price" type="number" step="0.01" class="form-control" required="true"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Duration (Days)</label>
                            <form:input path="duration_in_days" type="number" class="form-control" required="true"/>
                        </div>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-submit">
                    <i class="fas fa-save"></i> Update Package
                </button>
            </form:form>
            
            <a href="${pageContext.request.contextPath}/AdminPackages" class="btn-back">
                <i class="fas fa-arrow-left"></i> Back to Package List
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>