package com.food;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.food.model.CartItem;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        
        if(cart == null || cart.isEmpty()){
            res.sendRedirect("menu.jsp");
            return;
        }
        
       
        Integer userIdObj = (Integer) session.getAttribute("userId");
        if(userIdObj == null){
            res.sendRedirect("login.jsp");
            return;
        }
        int userId = userIdObj;
        
        String address = req.getParameter("address");
        if(address == null || address.trim().equals("")){
            address = "No Address";
        }
        
        try {
            Connection con = DBConnection.getConnection();
            
            int total = 0;
            for(CartItem c : cart){
                total += c.getPrice() * c.getQuantity();
            }
            
            
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO orders(user_id, total_amount, address, status) VALUES(?,?,?,'Placed')", 
                Statement.RETURN_GENERATED_KEYS
            );
            ps.setInt(1, userId);
            ps.setInt(2, total);
            ps.setString(3, address);
            ps.executeUpdate();
            
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int orderId = rs.getInt(1);
            
         
            for(CartItem item : cart){
                PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO order_items(order_id, food_id, quantity, price) VALUES(?,?,?,?)"
                );
                ps2.setInt(1, orderId);
                ps2.setInt(2, item.getId());
                ps2.setInt(3, item.getQuantity());
                ps2.setInt(4, item.getPrice());
                ps2.executeUpdate();
            }
            
          
            session.removeAttribute("cart");
            res.sendRedirect("orderSuccess.jsp?orderId=" + orderId);
            
        } catch(Exception e){
            e.printStackTrace();
            res.sendRedirect("checkout.jsp?error=1");
        }
    }

    
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }
}