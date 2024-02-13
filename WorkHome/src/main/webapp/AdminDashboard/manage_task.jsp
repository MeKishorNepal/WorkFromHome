<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.entities.Task" %>
<%@ page import="com.Dao.userDao"%>
<%@ page import="com.conn.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entities.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.heading{
margin-top:70px;
}
</style>
</head>
<body>
	<%@include file="adminnavbar.jsp"%>
	
	<% if(a==null)
    {
    	session.setAttribute("invalidMsg","Login Please..");
    	response.sendRedirect("../adminLogin.jsp");
    	}%>
    	s
	<div class="heading">
	<h3> All assigned tasks</h3><br>

	</div>
	
	<%
	String succMsg = (String) session.getAttribute("succMsg");
	String errorMsg = (String) session.getAttribute("errorMsg");
	if (succMsg != null) {
	%>

	<div class="alert alert-success" role="alert">
		<%=succMsg%>
	</div>
	<%
	session.removeAttribute("succMsg");
	}
	if (errorMsg != null) {
	%>
	<p class="text-danger text-center"><%=errorMsg%></p>
	<%
	}
	session.removeAttribute("failedMsg");
	%>
<%

userDao dao = new userDao(DBConnect.getCon());

if(dao !=null){
    List<Task> tasks = dao.getAllTask();
    %> 

<table class="table" style="background-color:whitesmoke; width:75vw;">
    <tr>
        <th>S.No</th>
        <th>Task ID</th>
        <th>Description</th>
        <th>Start_Date</th>
        <th>End_Date</th>
        <th>Status</th>
        <th>Action</th>
</tr>

 <% 
    int sno = 1; 
    for (Task task : tasks) {
    %>
    <tr>
            <td><%= sno++ %></td>
            <td><%= task.getTid() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.getStart_date() %></td>
            <td><%= task.getEnd_date() %></td>
            <td><%= task.getStatus() %></td>
            <td><div class="text-center">
							<a href="Edit_task.jsp?Tid=<%=task.getTid() %>"
								class="btn btn-success btn-sm text-white">Edit</a>
							<a	href="../delete?Tid=<%=task.getTid() %>"
								class="btn btn-danger btn-sm text-white">Delete</a>
						</div></td>
           
  
        </tr>
    <%
    }
    %>
</table>
<%
} else {
    out.println("User or userDao is null");
}
%>
</body>
</html>