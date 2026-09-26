<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Online Food Ordering</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body{
  background: linear-gradient(to right, #ff9a00, #ff5e00);
  height: 100vh;
  display:flex;
  align-items:center;
  justify-content:center;
  font-family: Arial;
}
.box{
  background:white;
  padding:40px;
  border-radius:15px;
  text-align:center;
  box-shadow: 0 5px 20px rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<div class="box">
<h1>🍔 Online Food Ordering System</h1>
<p>Order your favourite food now!</p>
<br>
<a href="login.jsp" class="btn btn-warning btn-lg">Login</a>
<a href="menu.jsp" class="btn btn-success btn-lg">View Menu</a>
<br><br>
<a href="myOrders.jsp" class="btn btn-outline-dark">My Orders</a>
</div>
</body>
</html>