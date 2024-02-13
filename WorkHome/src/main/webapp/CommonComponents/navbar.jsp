<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="stylebutton.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" type="text/css" href="CommonComponents/navbar.css">
    <style>
       
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary navbar-custom">
        <header>
            <div class="logo">
            <img src="../img/logo.png" alt="logo">
            </div>
        </header>
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">TMS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp"><i
                                class='bx bxs-home'></i>Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="About.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-disabled="false"
                            href="Contact.jsp">ContactUs</a></li>
                </ul>
            </div>
            <div class="container1">
                <a href="login.jsp"><span>SignIn</span></a>
                <a href="register.jsp"><span>SignUp</span></a>
                <a href="adminLogin.jsp"><span>Manager</span></a>
            </div>
        </div>
    </nav>
   
</body>
</html>
