<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - D-Mart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Header (same as index.jsp) -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <h1>🛒 D-Mart</h1>
                </div>
                <div class="search-bar">
                    <input type="text" placeholder="Search for products...">
                    <button>🔍</button>
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

    <!-- Product Grid -->
    <div class="container">
        <div class="page-header">
            <h2>All Products</h2>
            <div class="filters">
                <select id="sort">
                    <option>Sort by: Featured</option>
                    <option>Price: Low to High</option>
                    <option>Price: High to Low</option>
                </select>
            </div>
        </div>
        
        <div class="product-grid">
            <!-- Grocery Products -->
            <div class="product-card">
                <div class="product-image">🍚</div>
                <h3>Basmati Rice (5kg)</h3>
                <p class="price">₹599 <span class="old-price">₹899</span></p>
                <p class="discount">33% OFF</p>
                <button class="btn-add" onclick="addToCart('101','Basmati Rice (5kg)','599')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🫘</div>
                <h3>Toor Dal (1kg)</h3>
                <p class="price">₹129 <span class="old-price">₹199</span></p>
                <p class="discount">35% OFF</p>
                <button class="btn-add" onclick="addToCart('102','Toor Dal (1kg)','129')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🌾</div>
                <h3>Wheat Flour (5kg)</h3>
                <p class="price">₹249 <span class="old-price">₹350</span></p>
                <p class="discount">29% OFF</p>
                <button class="btn-add" onclick="addToCart('103','Wheat Flour (5kg)','249')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🛢️</div>
                <h3>Fortune Oil (1L)</h3>
                <p class="price">₹115 <span class="old-price">₹160</span></p>
                <p class="discount">28% OFF</p>
                <button class="btn-add" onclick="addToCart('104','Fortune Oil (1L)','115')">Add to Cart</button>
            </div>
            
            <!-- Vegetables -->
            <div class="product-card">
                <div class="product-image">🥔</div>
                <h3>Potato (1kg)</h3>
                <p class="price">₹25 <span class="old-price">₹40</span></p>
                <p class="discount">38% OFF</p>
                <button class="btn-add" onclick="addToCart('201','Potato (1kg)','25')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🍅</div>
                <h3>Tomato (1kg)</h3>
                <p class="price">₹30 <span class="old-price">₹50</span></p>
                <p class="discount">40% OFF</p>
                <button class="btn-add" onclick="addToCart('202','Tomato (1kg)','30')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🧅</div>
                <h3>Onion (1kg)</h3>
                <p class="price">₹28 <span class="old-price">₹45</span></p>
                <p class="discount">38% OFF</p>
                <button class="btn-add" onclick="addToCart('203','Onion (1kg)','28')">Add to Cart</button>
            </div>
            
            <!-- Fruits -->
            <div class="product-card">
                <div class="product-image">🍎</div>
                <h3>Apple (1kg)</h3>
                <p class="price">₹160 <span class="old-price">₹220</span></p>
                <p class="discount">27% OFF</p>
                <button class="btn-add" onclick="addToCart('301','Apple (1kg)','160')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🍊</div>
                <h3>Orange (1kg)</h3>
                <p class="price">₹90 <span class="old-price">₹140</span></p>
                <p class="discount">36% OFF</p>
                <button class="btn-add" onclick="addToCart('302','Orange (1kg)','90')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🍌</div>
                <h3>Banana (dozen)</h3>
                <p class="price">₹35 <span class="old-price">₹55</span></p>
                <p class="discount">36% OFF</p>
                <button class="btn-add" onclick="addToCart('303','Banana (dozen)','35')">Add to Cart</button>
            </div>
            
            <!-- Dairy -->
            <div class="product-card">
                <div class="product-image">🥛</div>
                <h3>Amul Milk (1L)</h3>
                <p class="price">₹56 <span class="old-price">₹70</span></p>
                <p class="discount">20% OFF</p>
                <button class="btn-add" onclick="addToCart('401','Amul Milk (1L)','56')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🧀</div>
                <h3>Amul Paneer (200g)</h3>
                <p class="price">₹55 <span class="old-price">₹75</span></p>
                <p class="discount">27% OFF</p>
                <button class="btn-add" onclick="addToCart('402','Amul Paneer (200g)','55')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🍦</div>
                <h3>Amul Ice Cream</h3>
                <p class="price">₹120 <span class="old-price">₹180</span></p>
                <p class="discount">33% OFF</p>
                <button class="btn-add" onclick="addToCart('403','Amul Ice Cream','120')">Add to Cart</button>
            </div>
            
            <!-- Snacks -->
            <div class="product-card">
                <div class="product-image">🍪</div>
                <h3>Oreo Biscuits</h3>
                <p class="price">₹35 <span class="old-price">₹50</span></p>
                <p class="discount">30% OFF</p>
                <button class="btn-add" onclick="addToCart('501','Oreo Biscuits','35')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🥨</div>
                <h3>Lays Chips</h3>
                <p class="price">₹20 <span class="old-price">₹30</span></p>
                <p class="discount">33% OFF</p>
                <button class="btn-add" onclick="addToCart('502','Lays Chips','20')">Add to Cart</button>
            </div>
            
            <div class="product-card">
                <div class="product-image">🍿</div>
                <h3>Kurkure</h3>
                <p class="price">₹20 <span class="old-price">₹30</span></p>
                <p class="discount">33% OFF</p>
                <button class="btn-add" onclick="addToCart('503','Kurkure','20')">Add to Cart</button>
            </div>
        </div>
    </div>
    
    <script src="js/script.js"></script>
</body>
</html>
