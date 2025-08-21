<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0d0d2b;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
        }
        .card {
            background-color: #1a1a40;
            padding: 30px 40px;
            border-radius: 20px;
            width: 400px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            text-align: center;
        }
        .card h2 {
            margin-bottom: 20px;
            color: #ffffff;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #bbb;
        }
        input[type="text"], input[type="email"], input[type="number"], input[type="file"] {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: none;
            outline: none;
            background: #2a2a5c;
            color: white;
        }
        input[type="submit"] {
            background-color: #ff4757;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 15px;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #e84118;
        }
        .error {
            color: red;
            margin-bottom: 15px;
        }
        .profile-pic-preview {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 2px solid white;
        }
       #profilePreview {
    cursor: pointer;
    display: none;
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
    margin: 0 auto; /* ✅ This centers it */
}

            
    </style>
</head>
<body>

<div class="card">
    <h2>Edit Your Profile</h2>
    
    <!-- Profile Preview -->
                        <div style="margin-bottom: 20px; text-align: center;">
                            <img id="profilePreview" src="#" alt="Profile Preview" />
                        </div>

    <c:if test="${not empty errorMsg}">
        <div class="error">${errorMsg}</div>
    </c:if>

    <form:form method="post" action="editProfile" modelAttribute="userObj" enctype="multipart/form-data">
        <form:hidden path="id" />
        <form:hidden path="passwordHash" />

        

        <div class="form-group">
            <label>Username</label>
            <form:input path="username" />
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email" type="email"/>
        </div>

        <div class="form-group">
            <label>Gender</label>
            <form:input path="gender" />
        </div>

        <div class="form-group">
            <label>Age</label>
            <form:input path="age" type="number"/>
        </div>

       
        <div class="input__item">
                            <form:input type="file" path="profilePic" id="profilePicInput"/>
                            <span class="icon_camera"></span>
                        </div>
        

        <input type="submit" value="Update Profile" />
    </form:form>
</div>





!-- Fullscreen Image Modal -->
<div id="imageModal">
    <img id="modalImage" src="" />
</div>

<!-- JS Plugins -->
<script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/js/player.js' />"></script>
<script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
<script src="<c:url value='/resources/js/mixitup.min.js' />"></script>
<script src="<c:url value='/resources/js/jquery.slicknav.js' />"></script>
<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
<script src="<c:url value='/resources/js/main.js' />"></script>

<!-- Image preview & modal -->
<script>
    document.getElementById("profilePicInput").addEventListener("change", function(event) {
        const file = event.target.files[0];
        if (file && file.type.startsWith("image/")) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.getElementById("profilePreview");
                img.src = e.target.result;
                img.style.display = "block";
            };
            reader.readAsDataURL(file);
        } else {
            document.getElementById("profilePreview").style.display = "none";
        }
    });

    document.getElementById("profilePreview").addEventListener("click", function () {
        const modal = document.getElementById("imageModal");
        const modalImg = document.getElementById("modalImage");
        modalImg.src = this.src;
        modal.style.display = "flex";
    });

    document.getElementById("imageModal").addEventListener("click", function () {
        this.style.display = "none";
    });
</script>










</body>
</html>
