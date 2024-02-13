<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMS</title>

<link rel="stylesheet" href="CommonComponents/style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<%@include file="CommonComponents/AllCss.jsp" %>
<style>

  
	
</style>
</head>
<body>
<%@include file="CommonComponents/navbar.jsp" %>
<div class="wrapper">

  <!--This is for user registration success or error occur - -->
					
					<% String sucssMsg=(String) session.getAttribute("sucssMsg");
					   String errorMsg=(String) session.getAttribute("errorMsg");
					   if(sucssMsg !=null){
				    %>
				    <p class="text-success text-center"><%=sucssMsg %></p>
				    <%
					}
					   if(errorMsg !=null){
						   %>
						   <p class="text-danger text-center"><%=errorMsg %></p>
						  <% 
					   }
					   session.removeAttribute("sucssMsg");
					   session.removeAttribute("errorMsg");
					%>
					
					 <!-- This is for invalid user or password -->
					
					<%
					String invalidMsg=(String)session.getAttribute("invalidMsg");
					if(invalidMsg!=null)
					{%>
					
						<p class="text-danger text-center"><%=invalidMsg %></p>
					<% }
					session.removeAttribute("invalidMsg");
					
					%>
					
					
     <form action= "Login" method="post">
     <h1>Login</h1>
     
     <div class="input-box">
     <input type="text" placeholder="Username" name="name"
     required>
     <i class='bx bxs-user'></i>
     </div>
     
      <div class="input-box">
     <input type="password" placeholder="Password" name="password"
     required>
     <i class='bx bxs-lock-alt'></i>
     </div>
     <div class="remember-forgot">
     <label><input type="checkbox">Remember me</label>
     <a href="#" >Forgot password?</a>
     </div>
     <button type="submit" class="btn">Login</button>
     <div class="register-link">
     <p>Don't have an account?<a href="register.jsp">Register</a></p>
     </div>
     
     </form>

</div>

</body>
</html>