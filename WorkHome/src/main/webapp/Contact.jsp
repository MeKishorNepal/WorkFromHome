<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMS</title>
<%@include file="CommonComponents/AllCss.jsp" %>
<link rel="stylesheet" href="CommonComponents/style.css">
<style>
body {
	background-image: url('img/about.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-color: #33a3cf;
	margin: 0;
	padding: 0 20px;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.container {
	width: 600px;
    background: transparent;
    border: 2px solid rgba(255, 255, 255, .2);
    backdrop-filter: blur(20px);
    box-shadow: 0 0 10px rgba(0, 0, 0, .2);
    color: #fff;
    border-radius: 20px;
    margin: auto;  
    padding: 30px;
    margin-top:80px;
}

form {
	max-width: 100%;
}

h2 {
	text-align: center;
}

p {
	margin-top: 15px;
}

input, textarea, button {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: none;
	border-radius: 5px;
}

button {
	background-color: #3498db;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #2980b9;
}

.btn-sm {
	padding: 5px 10px;
	font-size: 14px;
}

.social-icons {
	margin-top: 20px;
}

.social-icons a {
	display: inline-block;
	margin-right: 18px;
	color: #fff;
}
.form-group placeholder{
color:white;
}
.form-group input{
background:transparent;
border-radius:20px;
box-shadow: 0 0 10px rgba(0, 0, 0, .2);
}

.form-group button{
background:transparent;
border-radius:20px;
box-shadow: 0 0 10px rgba(0, 0, 0, .2);

}
.form-group textarea{
background:transparent;
border-radius:20px;
box-shadow: 0 0 10px rgba(0, 0, 0, .2);
}
</style>
</head>
<body>

<%@include file="CommonComponents/navbar.jsp" %>

<div class="container">
        <h2 style="color:white;">Contact Us</h2>

        <!-- Introduction -->
        <p>Welcome to our Contact Us page. We would love to hear from you!</p>

        <!-- Contact Information -->
        <div class="para">
            <p>Email: kishornepal877@gmail.com</p>
            <p>Phone: 9813256298</p>
            <p>Address: Imadol, Lalitpur, Nepal</p>
        </div>

        <!-- Contact Form -->
        <form action="SendMessageServlet" method="post" class="form-group">
            <!-- Add your form fields here (name, email, subject, message) -->
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <input type="text" name="subject" placeholder="Subject" required>
            <textarea name="message" placeholder="Your Message" required></textarea>
            <button type="submit" class="btn btn-sm btn-primary">Send Message</button>
        </form>

        <!-- Social Media Links -->
        <h6 class="text-white ">Also Kindly message us in below social media</h6>
        <div class="social-icons">
            <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
            <!-- Add more social media icons as needed -->
        </div>
    </div>

</body>
</html>