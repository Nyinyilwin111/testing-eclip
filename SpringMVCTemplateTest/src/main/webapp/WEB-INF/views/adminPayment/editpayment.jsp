<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-dark text-light">
<div class="container mt-5">
    <h2>Edit Payment</h2>
    <form action="${pageContext.request.contextPath}/updatePayment" method="post">
        <input type="hidden" name="id" value="${payment.id}" />
        
        <div class="mb-3">
            <label>User ID:</label>
            <input type="text" name="userId" class="form-control" value="${payment.userId}" required />
        </div>
        <div class="mb-3">
            <label>Package ID:</label>
            <input type="text" name="packageId" class="form-control" value="${payment.packageId}" required />
        </div>
        <div class="mb-3">
            <label>Payment Method ID:</label>
            <input type="text" name="paymentMethodId" class="form-control" value="${payment.paymentMethodId}" required />
        </div>
        <div class="mb-3">
            <label>Payment Date:</label>
            <input type="date" name="paymentDate" class="form-control" value="${payment.paymentDate}" required />
        </div>
        <div class="mb-3">
            <label>Screenshot Path:</label>
            <input type="text" name="screenshot_path" class="form-control" value="${payment.screenshot_path}" />
        </div>
        <div class="mb-3">
            <label>Status:</label>
            <select name="status" class="form-control">
                <option ${payment.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                <option ${payment.status == 'APPROVED' ? 'selected' : ''}>APPROVED</option>
                <option ${payment.status == 'REJECTED' ? 'selected' : ''}>REJECTED</option>
            </select>
        </div>
        
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="${pageContext.request.contextPath}/payments" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
