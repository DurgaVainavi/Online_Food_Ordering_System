<%@ page import="java.sql.*, com.food.DBConnection" %>
<%@ page import="com.food.DBConnection" %>
<%
Integer userId = (Integer) session.getAttribute("userId");
if(userId==null){
    response.sendRedirect("login.jsp");
    return;
}
Connection con = com.food.DBConnection.getConnection();
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h2>My Orders</h2>
<%
PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE user_id=? ORDER BY order_id DESC");
ps.setInt(1, userId);
ResultSet rs = ps.executeQuery();
while(rs.next()){
    int orderId = rs.getInt("order_id");
%>
<div class="card mb-4 shadow-sm">
<div class="card-header d-flex justify-content-between">
  <b>Order ID: <%=orderId%></b>
  <span class="badge bg-success"><%=rs.getString("status")%></span>
  <span>Rs. <%=rs.getInt("total_amount")%></span>
  <small><%=rs.getTimestamp("order_date")%></small>
</div>
<div class="card-body">
<p><b>Address:</b> <%=rs.getString("address")%></p>
<table class="table table-sm">
<tr><th>Food</th><th>Qty</th><th>Price</th></tr>
<%
PreparedStatement ps2 = con.prepareStatement("SELECT oi.*, f.food_name FROM order_items oi JOIN food_items f ON oi.food_id = f.food_id WHERE oi.order_id=?");
ps2.setInt(1, orderId);
ResultSet rs2 = ps2.executeQuery();
while(rs2.next()){
%>
<tr>
<td><%=rs2.getString("food_name")%></td>
<td><%=rs2.getInt("quantity")%></td>
<td>Rs. <%=rs2.getInt("price")%></td>
</tr>
<% } %>
</table>
</div>
</div>
<% } %>
<a href="menu.jsp" class="btn btn-primary">Order More Food</a>
</div>
</body>
</html>