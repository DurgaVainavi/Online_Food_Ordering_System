<%@ page import="java.util.*, com.food.model.CartItem" %>
<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
if(cart==null || cart.isEmpty()){ response.sendRedirect("menu.jsp"); return; }
int grandTotal=0;
for(CartItem c: cart) grandTotal += c.getPrice()*c.getQuantity();
%>
<html><head><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body>
<div class="container mt-4" style="max-width:500px">
<h2>Checkout</h2>
<h5>Grand Total: Rs. <%=grandTotal%></h5>
<form action="placeOrder" method="post">
<textarea name="address" class="form-control mb-3" placeholder="Enter Delivery Address" required></textarea>
<select name="payment" class="form-control mb-3">
<option>Cash on Delivery</option>
<option>UPI</option>
<option>Card</option>
</select>
<button class="btn btn-success w-100">Place Order</button>
</form>
</div>
</body>
</html>