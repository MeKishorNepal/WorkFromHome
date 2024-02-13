<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../CommonComponents/AllCss.jsp" %>
<style>

#instruction{
color:black;
margin-top:120px;
font-weight:bold;
margin-inline:20px;
padding:10px;
text-size:30px;
backdrop-filter:blur(20px);
width:50%;
box-shadow:0 0 10px rgba(0,0,0,.9);

}

</style>
</head>
<body>

<%@include file="usernavbar.jsp" %>

<% if(user==null)
    {
    	session.setAttribute("invalidMsg","Login Please..");
    	response.sendRedirect("../login.jsp");
    	}%>


<%
String succMsg=(String) session.getAttribute("succMsg");
if(succMsg !=null){
	%>
	 <p class="text-success text-center"><%=succMsg %></p>

<%}

%>
 
<div class ="col-md-10"id="instruction" >
   <h2 style="font-size:40px;">Instructions for Employees</h2>
    <ul style="font-size:30px;">
        <li>All the employee should mark their attendance daily.</li>
        <li>Everyone must complete the task assigned to them.</li>
        <li>Kindly maintain documents of the office.</li>
        <li>Keep office and your area neat and clean.</li>
     </ul>
  </div>


</body>
</html>