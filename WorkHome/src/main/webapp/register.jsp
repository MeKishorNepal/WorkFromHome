
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<%@include file="CommonComponents/AllCss.jsp" %>
<link rel="stylesheet" href="CommonComponents/style.css">
<style>
body{
background-color:#33a3cf;
}
</style>
</head>
<body>
<%@include file="CommonComponents/navbar.jsp" %>

<div class="wrapper">
     <form action= "register" method="post">
     <h1>Register</h1>
     
     <div class="input-box">
     <input type="text" placeholder="Name" name="name"
     required>
     </div>
     
      <div class="input-box">
     <input type="email" placeholder="Email" name="email"
     required>
     </div>
     
     <div class="input-box">
     <input type="password" placeholder="Password" name="password"
     required>
      <i class='bx bxs-lock-alt'></i>
     </div>
      <div class="input-box">
     <input type="number" placeholder="Phone no" name="phone"
     required>
     </div>
     
     
     <button type="submit" class="btn">register</button>
     
     
     </form>

</div>
</body>
</html>