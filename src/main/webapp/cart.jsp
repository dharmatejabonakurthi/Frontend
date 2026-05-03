<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - D-Mart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <h1>🛒 D-Mart</h1>
                </div>
                <div class="header-actions">
                    <a href="cart.jsp" class="cart-icon">🛒 Cart</a>
                    <% if(session.getAttribute("user_email") != null) { %>
                        <span>Welcome, <%= session.getAttribute("user_name") %></span>
                        <a href="logout.jsp">Logout</a>
                    <% } else { %>
                        <a href="login.jsp">Login</a>
                    <% } %>
                </div>
            </div>
        </div>
    </header>

    <div
