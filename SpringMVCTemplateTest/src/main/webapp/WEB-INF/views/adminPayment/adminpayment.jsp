<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Payment Management</title>
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
        .btn-approve {
            background-color: #10b981;
            color: white;
        }
        .btn-approve:hover {
            background-color: #059669;
            transform: translateY(-2px);
        }
        .btn-reject {
            background-color: #f87171;
            color: white;
        }
        .btn-reject:hover {
            background-color: #ef4444;
            transform: translateY(-2px);
        }
        .status-pending {
            color: #fbbf24;
            font-weight: 600;
        }
        .status-approved {
            color: #10b981;
            font-weight: 600;
        }
        .status-rejected {
            color: #ef4444;
            font-weight: 600;
        }
        .screenshot-link {
            color: #4facfe;
            text-decoration: none;
            transition: all 0.3s;
        }
        .screenshot-link:hover {
            color: #3b82f6;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="admin-header">
            <h1 class="admin-title">Payment Management</h1>
        </div>
        
        <div class="table-container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Package ID</th>
                        <th>Screenshot</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${payments}">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.userId}</td>
                            <td>${p.packageId}</td>
                            <td>
                                <a href="/screenshots/${p.screenshot_path}" 
                                   class="screenshot-link" 
                                   target="_blank">
                                    <i class="fas fa-image"></i> View
                                </a>
                            </td>
                            <td class="status-${p.status.toLowerCase()}">
                                ${p.status}
                            </td>
                           <td>
    <c:if test="${p.status == 'PENDING'}">
        <form method="post" action="${pageContext.request.contextPath}/approvePayment" style="display:inline;">
            <input type="hidden" name="paymentId" value="${p.id}" />
            <button type="submit" class="btn-action btn-approve">
                <i class="fas fa-check-circle"></i> Approve
            </button>
        </form>
        <form method="post" action="${pageContext.request.contextPath}/rejectPayment" style="display:inline;">
            <input type="hidden" name="paymentId" value="${p.id}" />
            <button type="submit" class="btn-action btn-reject">
                <i class="fas fa-times-circle"></i> Reject
            </button>
        </form>
    </c:if>

    <!-- Edit Button -->
    <a href="${pageContext.request.contextPath}/editPayment?id=${p.id}" 
       class="btn-action btn-approve">
        <i class="fas fa-edit"></i> Edit
    </a>

    <!-- Delete Button -->
    <form method="post" action="${pageContext.request.contextPath}/deletePayment" 
          style="display:inline;" 
          onsubmit="return confirm('Are you sure you want to delete this payment?');">
        <input type="hidden" name="paymentId" value="${p.id}" />
        <button type="submit" class="btn-action btn-reject">
            <i class="fas fa-trash-alt"></i> Delete
        </button>
    </form>
</td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>