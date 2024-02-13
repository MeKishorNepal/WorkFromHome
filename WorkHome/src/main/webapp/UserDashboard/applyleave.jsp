<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@include file="../CommonComponents/AllCss.jsp" %>
    <style>
        #leave {
            margin-top: 80px;
            background-color: rgba(255, 255, 255, 0.7); 
            padding: 18px; 
        }

        .form {
            margin-top: 5px;
        }
     

      .row .form-group .sub {
             !important;
        }
        .row .form .form-control{
 
        border:20px;
        border-radius:15px;
        
        }
          .row .form .form-control:hover{
           background-color: rgba(255, 255, 255, 0.7); 
           box-shadow:0 0 10px rgba(0,0,0,.9);
           background:transparent;
         
         }
          .row .form .sub{
          padding: 8px; 
          margin-top:8px; 
          font-weight:bold;
           background-color: green;
            border-radius:7px;
            background:transparent;" 
          
          }
          .row .form .sub:hover{
           background-color: rgba(255, 255, 255, 0.7);
           font-size:18px;
          
          }
    </style>
</head>
<body>
<% 
    User u1 = (User)session.getAttribute("user");
    if(u1 == null) {
        session.setAttribute("invalidMsg", "Login Please..");
        response.sendRedirect("../login.jsp");
    }
%>

<%@include file="usernavbar.jsp" %>

<div class="row">
    <div class="col-md-6" id="leave">
        <h3>Apply Leave</h3>
        <form action="../applyleave?uid=<%=u1.getId() %>" method="post" class="form-group">
            <div class="form">
                <input type="text" class="form-control"  placeholder="Subject" name="subject" required>
                <textarea class="form-control" row="5" col="50" style="margin-top:5px;" placeholder="Message" name="message" required></textarea>
            
            
                <input type="submit" class="sub" name="submit_leave">
      
            </div>
        </form>
    </div>
</div>

</body>
</html>
