<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Upload to Google Drive</title>
</head>
<body>
    <h2>Upload Image</h2>
    <form method="post" enctype="multipart/form-data" action="upload">
        <input type="file" name="file" required />
        <button type="submit">Upload</button>
    </form>
</body>
</html>
