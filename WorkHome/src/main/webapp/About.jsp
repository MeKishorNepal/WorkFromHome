<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="CommonComponents/AllCss.jsp" %>
<style>
body {
    font-family: 'Arial', sans-serif;
    background: url('img/about.jpg');
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    background: transparent;
    border: 2px solid rgba(255, 255, 255, .2);
    backdrop-filter: blur(20px);
    box-shadow: 0 0 10px rgba(0, 0, 0, .2);
    color: #fff;
    border-radius: 40px;

    padding: 30px; 
    margin-top:100px;
}

h2 {
    color: #333;
    text-align: center;
    color:white;
}

section {
    margin-bottom: 20px;
}

h3 {
    color: white;
    font-weight:bold;
    
}

p {
    line-height: 1.6;
    color: white;
}


</style>
</head>
<body>
<%@include file="CommonComponents/navbar.jsp" %>

<div class="container">
        <h2>About Task Management System</h2>

        <section>
            <h3>Introduction</h3>
            <p>
                Welcome to the Task Management System (TMS), a powerful tool designed to streamline your workflow,
                enhance collaboration, and boost productivity. This application helps organizations increase their
                productivity and provides work-from-home options for their employees.
            </p>
        </section>

        <section>
            <h3>Mission and Vision</h3>
            <p>
                Our mission is to provide an efficient and user-friendly task management solution that empowers
                individuals and organizations to achieve their goals. We envision a workplace where tasks are managed with
                ease, communication is seamless, and projects are delivered successfully. Our vision is to provide a place
                where each member of an organization can update, delete, check, and various other options are also available.
            </p>
        </section>

        <section>
            <h3>Team</h3>
            <p>
                The TMS team is dedicated to creating innovative solutions.In our team currently two memeber Kishor Nepal and Subash Regmi
                And we will try to make it more advance day by day.
              
            </p>
        </section>

        <section>
            <h3>Development Process</h3>
            <p>
                TMS is developed using the latest technologies and follows an agile development methodology.
                Our iterative approach allows us to respond to user feedback and continuously improve the system.
            </p>
        </section>

        <section>
            <h3>User Benefits</h3>
            <p>
                By using TMS, users can experience improved task organization, efficient collaboration, and
                enhanced productivity. Stay organized, stay focused with Task Management System.
            </p>
        </section>
        <section>
            <h3>Future Planning.</h3>
            <p>
            Our team will make this system more productive, efficient and powerful in future.In upcoming future we will make
            sure that our team will add more features in system that makes it more stable and useful.
            </p>
        </section>

    </div>



</body>
</html>