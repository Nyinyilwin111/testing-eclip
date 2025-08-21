<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.model.FileMetadata" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Uploaded Files</title></head>
<body>
<h2>Files Uploaded to Google Drive</h2>
<table border="1">
    <tr><th>ID</th><th>Filename</th><th>View</th></tr>
    <c:forEach var="file" items="${files}">
        <tr>
            <td>${file.id}</td>
            <td>${file.filename}</td>
            <td><a href="https://drive.google.com/file/d/${file.fileId}/view" target="_blank">View</a></td>
        </tr>
    </c:forEach>
</table>
<p style="color:red;">${msg}</p>
</body>
</html>
