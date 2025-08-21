<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>All Reviews</title>
</head>
<body>
    <h2>Review List</h2>
    <table border="1">
        <tr>
            <th>User</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Date</th>
            <th>Movie ID</th>
            
        </tr>
        <c:forEach var="r" items="${reviews}">
            <tr>
               <td>
                  <c:if test="${not empty r.user}">
                  <img src="${pageContext.request.contextPath}${r.user.profilePicUrl}" width="50" height="50" />
                   <br/>
                    ${r.user.username}
                  </c:if>
                </td>
                <td>${r.rating}</td>
                <td>${r.comment}</td>
                <td>${r.reviewDate}</td>
                <td>${r.moviesId}</td>
                
            </tr>
        </c:forEach>
    </table>
</body>
</html>
