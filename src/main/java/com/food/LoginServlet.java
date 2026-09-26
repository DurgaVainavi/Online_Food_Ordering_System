package com.food;

import java.io.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet({"/login", "/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                int userId = 0;
                try { userId = rs.getInt("id"); } catch(Exception e){ userId = rs.getInt("user_id"); }
                HttpSession session = req.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("userEmail", email);
                res.sendRedirect("menu.jsp");
            } else {
                res.sendRedirect("login.jsp?error=1");
            }
        } catch(Exception e){ e.printStackTrace(); res.sendRedirect("login.jsp?error=1"); }
    }
}