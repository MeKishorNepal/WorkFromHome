<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <%@include file="../CommonComponents/AllCss.jsp" %>
    <style>
    
    .form-group{
    width:30%;
    background:transparent ;
    backdrop-filter:blur(20px);
    border-radius:8px;
    box-shadow:0 0 10px rgba(0, 0, 0, .8);
  
    }
    .button{
      margin-top:10px;
      background:transparent !important;
      
    }
    .button:hover{
    font-size:18px;
    font-weight:bold;
    border:15px;
    border-radius:10px;
    
    }
    
    </style>

</head>
<body>
<% 
    User  u1 = (User)session.getAttribute("user");
if(u1==null)
    {
    	session.setAttribute("invalidMsg","Login Please..");
    	response.sendRedirect("../login.jsp");
    	}%>

<%@include file="usernavbar.jsp" %>

<h3 style="margin-top:80px; color:white;">Update the task</h3><br>

<% int tid=Integer.parseInt(request.getParameter("tid"));%>

	<form action="../updatetask?tid=<%=tid %>" method="post">
		
		<div class="form-group">
			<select class="form-control" name="status">
				<option>-Select-</option>
				<option>In-Progress</option>
				<option>Complete</option>
			</select>
		</div>
		<input type="submit" class="btn btn-warning button" name="update"
			value="Update" required>

		

	</form>


</body>
</html>