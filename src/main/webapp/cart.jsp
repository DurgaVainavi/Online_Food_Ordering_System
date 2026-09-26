<%@ page import="java.util.*, com.food.model.CartItem" %>
<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h2>Your Cart</h2>
<% if(cart==null || cart.isEmpty()){ %>
<p>Cart is empty <a href="menu.jsp">Go to Menu</a></p>
<% } else { %>
<table class="table table-bordered">
<tr><th>Image</th><th>Name</th><th>Price</th><th>Qty</th><th>Total</th></tr>
<%
int grandTotal=0;
for(CartItem item: cart){
int total = item.getPrice()*item.getQuantity();
grandTotal+=total;
%>
<tr>
<td><img src="images/<%=item.getImage()%>" width="60"></td>
<td><%=item.getName()%></td>
<td>Rs. <%=item.getPrice()%></td>
<td><%=item.getQuantity()%></td>
<td>Rs. <%=total%></td>
</tr>
<% } %>
</table>
<h4 class="text-end">Grand Total: Rs. <%=grandTotal%></h4>
<a href="menu.jsp" class="btn btn-secondary">Continue Shopping</a>
<a href="checkout.jsp" class="btn btn-success">Checkout</a>
<% } %>
</div>
</body>
</html>