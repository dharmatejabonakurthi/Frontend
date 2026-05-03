package com.dmart.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // In-memory user database
    private static Map<String, Map<String, String>> users = new HashMap<>();
    
    static {
        // Demo user
        Map<String, String> user1 = new HashMap<>();
        user1.put("name", "John Doe");
        user1.put("email", "john@example.com");
        user1.put("password", "password123");
        user1.put("phone", "9876543210");
        users.put("john@example.com", user1);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (users.containsKey(email) && users.get(email).get("password").equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user_email", email);
            session.setAttribute("user_name", users.get(email).get("name"));
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
