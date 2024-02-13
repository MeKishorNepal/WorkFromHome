<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Your Tasks</title>
    <%@include file="../CommonComponents/AllCss.jsp" %>
    <style>
        .table {
            width: 30%;
            background:transparent;
            border: 2px solid rgba(255, 255, 255, .2);
             backdrop-filter: blur(20px);
             box-shadow: 0 0 10px rgba(0, 0, 0, .8);
           
        }
        .table:hover{
        width:40%;
        border:3px solid rgba(255,255,255,.6);
        box-shadow:0 0 15px) rgba(0,0,0,.9)
        background:transparent;
        color:;
        }
        

        .table th {
            color: black;
            text-weight:bold;
        }
        
        .update:hover{
        font-size:18px;
        font-weight:bold;
        
        
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

<h3 style="margin-top:80px; color:white;">Your Tasks</h3>

<%
User u = (User)session.getAttribute("user");
userDao dao = new userDao(DBConnect.getCon());

if (u != null && dao != null) {
    List<Task> tasks = dao.getTaskByID(u.getId());
%>

<%
	String succMsg = (String) session.getAttribute("succMsg");
	String errorMsg = (String) session.getAttribute("failedMsg");
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

<table class="table" style=" width:75vw;">
    <tr>
        <th>sno</th>
        <th>Task ID</th>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Action</th>
    </tr>

    <% 
    int sno = 1; // Initialize the sno counter
    for (Task task : tasks) {
    %>
        <tr>
            <td><%= sno++ %></td>
            <td><%= task.getTid() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.getStart_date() %></td>
            <td><%= task.getEnd_date() %></td>
            <td><%= task.getStatus() %></td>
            <td><a  class="update" href="update.jsp?tid=<%=task.getTid()%>">update</a></td>
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
