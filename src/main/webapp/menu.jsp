<%@ page import="java.sql.*, com.food.DBConnection" %>
<%
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM food_items WHERE availability='Available'");
ResultSet rs = ps.executeQuery();
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.card img{ height:180px; object-fit:cover; }
</style>
</head>
<body>
<div class="container mt-4">
<h2 class="mb-3">Our Menu</h2>
<div class="row">
<%
while(rs.next()){
%>
<div class="col-md-4 mb-4">
  <div class="card p-2 shadow-sm">
    <img src="images/<%= rs.getString("image") %>" class="card-img-top">
    <div class="card-body">
      <h5><%= rs.getString("food_name") %></h5>
      <p class="text-muted small"><%= rs.getString("category") %> | <%= rs.getString("description") %></p>
      <h6 class="text-success">Rs. <%= rs.getString("price") %></h6>
      
      <form action="addToCart" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("food_id") %>">
        <input type="hidden" name="name" value="<%= rs.getString("food_name") %>">
        <input type="hidden" name="price" value="<%= rs.getInt("price") %>">
        <input type="hidden" name="image" value="<%= rs.getString("image") %>">
        <button class="btn btn-warning w-100">Add to Cart</button>
      </form>
    </div>
  </div>
</div>
<% } %>
</div>
</div>
</body>
</html>