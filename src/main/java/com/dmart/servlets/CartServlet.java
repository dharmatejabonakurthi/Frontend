package com.dmart.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new ArrayList<>();
        }
        
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        
        Map<String, String> item = new HashMap<>();
        item.put("id", productId);
        item.put("name", productName);
        item.put("price", price);
        item.put("quantity", quantity);
        
        cart.add(item);
        session.setAttribute("cart", cart);
        
        response.sendRedirect("products.jsp");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("remove".equals(action)) {
            String id = request.getParameter("id");
            HttpSession session = request.getSession();
            List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
            
            if (cart != null) {
                cart.removeIf(item -> item.get("id").equals(id));
                session.setAttribute("cart", cart);
            }
        }
        
        response.sendRedirect("cart.jsp");
    }
}
