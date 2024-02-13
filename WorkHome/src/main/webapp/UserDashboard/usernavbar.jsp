<%@ page import="com.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="stylebutton.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<%@include file="../CommonComponents/AllCss.jsp" %>
<style>
body{
background: url("../img/userdash.jpg");
width: 100%;
height: 80vh;
background-repeat:no-repeat;
background-size: cover;
}

.logo {
    width: 50px;
    height: 50px;
    overflow: hidden;
    border-radius: 50%;
    background-color: #fff;
}
.logo img {
    width: 100%;
    height: auto;
}

 .navbar {
            background: transparent !important;
            padding: 0px;
            position: fixed;
            font-weigth:bold;
            width: 100%;
            top: 0;
            z-index: 100;
        }

.navbar-nav {
    padding: 1px 4px; 
    margin:0; 
}

.navbar-nav .nav-item {
    margin-bottom: 6px; 
}

.navbar-nav .nav-link {
    color: black !important;
    font-size: 20px;
    font-weight: smooth;
    text-align: center; 
    transition: all 0.3s ease;
}

.navbar a {
    color: white;
    text-decoration: none;
}



.nav-item:hover .nav-link {
    color: #fff;
    background-color: #007bff;
    border-radius: 15px;
    padding: 5px 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.nav-item.active .nav-link {
    color: #fff;
    background-color: #fff;
    border-radius: 20px;
    padding: 10px 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transform: scale(1.1);
}
.user{
border:20px;
color:black;
background:#007bff;
border-radius:20px;

}
.logbutton{
border:100px !important;
border-radius:5px;
background:transparent;
color:black !important;

}
.logbutton:hover{
      color: #fff;
    background-color: #007bff;
    border-radius: 15px;
    padding: 5px 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary navbar-custom">
    <header>
        <div class="logo">
            <img src="img/logo_transparent.png" alt="Logo">
        </div>
    </header>
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp" style="color:black; font-weight:bold; font-size:30px;">TMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="userDashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="Update task.jsp"> Update Task</a></li>
                <li class="nav-item"><a class="nav-link" href="applyleave.jsp">Apply leave</a></li>
                <li class="nav-item"><a class="nav-link" href="leavestatus.jsp">Leave Status</a></li>
                </ul>
                
                
                <% User user=(User)session.getAttribute("user");
		if(user==null)
			{
			%>
			
		
				 response.sendRedirect("../login.jsp");

			
		<% }
			else 
			{%>

	
				<button style="margin-right: 20px;" class="user"><%=user.getName()%></button>

				<a  class="logbutton" href="../index.jsp">Logout</a>


			
		<%
			}
			%>
             </div>
             </div>
     
        
        
    </nav>
   
</body>
</html>