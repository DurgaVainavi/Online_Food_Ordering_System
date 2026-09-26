package com.food.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.food.model.CartItem;
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            int price = Integer.parseInt(request.getParameter("price"));
            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");         
            if(cart == null) {
                cart = new ArrayList<>();
            }
            boolean exists = false;
            for(CartItem item : cart) {
                if(item.getId() == id) {
                    item.setQuantity(item.getQuantity() + 1);
                    exists = true;
                    break;
                }
            }
            if(!exists) {
                cart.add(new CartItem(id, name, image, price));
            }
            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }
}