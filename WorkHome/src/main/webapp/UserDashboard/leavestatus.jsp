<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.entities.Task" %>
<%@ page import="com.Dao.userDao"%>
<%@ page import="com.conn.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entities.User" %>
<%@page import="com.entities.Leave" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../CommonComponents/AllCss.jsp" %>
<style>
.table-group h3{
margin-top:50px;
}
.table-group{
padding:20px;

}
.table{
margin-top:5px;
background:trannsparent;
backdrop-filter:blur(20px);
box-shadow:0 0 10px rgba(0,0,0,.9);

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


<div class="table-group">

    <br>

<% 
User u = (User)session.getAttribute("user");
userDao dao = new userDao(DBConnect.getCon());

if (u != null && dao != null) {

	List<Leave> leave=dao.getLeaveById(u.getId());

    %>
        <h3>Your leave application</h3>
    <table class="table" style="width:75vw;">

    <tr>
        <th>S.NO</th>
        <th>Subject</th>
        <th>Message</th>
        <th>Status</th>
</tr>
 <% 
    int sno = 1; // Initialize the sno counter
    for (Leave l : leave) {
    %>
        <tr>
            <td><%= sno++ %></td>
            
            <td><%= l.getSubject() %></td>
            <td><%= l.getMessage() %></td>
            <td><%= l.getStatus() %></td>
            
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
</div>

</body>
</html>