<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.entities.User"%>
<%@ page import="com.entities.admin"%>
<%@ page import="com.Dao.userDao"%>
<%@ page import="com.conn.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entities.Task"%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.task-heading {
	margin-top: 70px;
	text-align: center;
	font-size: 22px;
	font-family: sans-serif;
}

.row2 {
	display: flex;
	font-size: 20px;
	justify-content: space-around;
}

.form-group2 {
	margin-top: 10px;
}

.submit {
	margin-top: 5px;
	border-radius: 8px;
	background-color: brown;
}

.submit:hover {
	background-color: #33a3cf;
}
</style>
</head>
<body>
	<%@include file="adminnavbar.jsp"%>

	<%
User u=(User) session.getAttribute("User");

%>

	<div class="task-heading">
		<h2>Edit Task</h2>
	</div>
	
	                    <% String succMsg=(String) session.getAttribute("succMsg");
					   String errorMsg=(String) session.getAttribute("errorMsg");
					   if(succMsg !=null){
				    %>
				   <div class="alert alert-success" role="alert">
	                         	<%=succMsg%>
	                   </div>
				    <%
					}
					   if(errorMsg!=null){
						   %>
						   <div class="alert alert-success" role="alert">
	                                       	<%=errorMsg%>
	                               </div>
						  <% 
					   }
					   session.removeAttribute("succMsg");
					   session.removeAttribute("errorMsg");
					%>
					

					

	<div class="row2">
		<!-- In Bootstrap, the "row" class is used to create a horizontal grouping of columns -->
		<div class="col-md-6">
			<!-- The "col-md-6" class defines a column that spans 6 grid units out of 12 when the screen size is medium (md) or larger -->
	<%
       
        String tidParam = request.getParameter("Tid");

        if (tidParam != null && !tidParam.isEmpty()) {
            int taskId = Integer.parseInt(tidParam);
            userDao dao = new userDao(DBConnect.getCon());
            Task task = dao.getTaskDetails(taskId);
    %>
			<form action="../TaskEdit?tid=<%=taskId %>"  method="post">
				<div class="form-group2">
					<!-- The "form-group" class is used to group form elements together and apply styling to them -->

					<label>Select user:</label> <select class="form-control2" name="id">
						<option>-Select-</option>
						<%
                        userDao dao2=new userDao(DBConnect.getCon());
                         List<User> user=dao2.getDetails(u);
      
                        %>
						<% 
    
                          for (User us : user) {
                        	  %>
                        
					<option value="<%= us.getId() %>">
                         <%= us.getName() %>
						<% }%>	

					</select>
				</div>

				<div class="form-group2">
					<label>Description:</label>
					<textarea   value=""class="form-control" rows="3" cols="50" name="description"   placeholder="Mention the task"><%= task.getDescription() %></textarea>
				</div>

				<div class="form-group2">
					<label>Start date:</label> <input value="<%= task.getStart_date() %>" type="date" class="form-control"
						name="start_date" >
				</div>

				<div class="form-group2">
					<label>End date:</label> <input type="date" class="form-control" value="<%= task.getEnd_date() %>"
						name="end_date">
				</div>

				<input type="submit"  class="submit" name="submit_task"
					value="Update">
			</form>
			
			<%
        } else {
            // Handle the case where Tid is not present or empty
            out.println("Task ID is missing or invalid.");
        }
    %>
		</div>
	</div>




</body>
</html>