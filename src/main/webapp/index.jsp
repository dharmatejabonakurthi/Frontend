<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D-Mart - India's Favorite no.1 Supermarket</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <h1>🛒 D-Mart</h1>
                    <span>India's Favorite no. 1 Supermarket</span>
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
                        <a href="register.jsp">Sign Up</a>
                    <% } %>
                </div>
            </div>
        </div>
    </header>

    <!-- Navigation -->
    <nav class="nav-bar">
        <div class="container">
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="products.jsp?category=grocery">Grocery</a></li>
                <li><a href="products.jsp?category=vegetables">Vegetables</a></li>
                <li><a href="products.jsp?category=fruits">Fruits</a></li>
                <li><a href="products.jsp?category=dairy">Dairy</a></li>
                <li><a href="products.jsp?category=snacks">Snacks</a></li>
                <li><a href="products.jsp?category=beverages">Beverages</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Banner -->
    <section class="hero">
        <div class="hero-content">
            <h2>Big Savings! Bigger Smiles!</h2>
            <p>Up to 50% off on thousands of products</p>
            <a href="products.jsp" class="btn-primary">Shop Now →</a>
        </div>
    </section>

    <!-- Categories -->
    <section class="categories">
        <div class="container">
            <h2>Shop by Category</h2>
            <div class="category-grid">
                <div class="category-card">
                    <div class="category-icon">🍚</div>
                    <h3>Grocery</h3>
                    <p>Rice, Atta, Oil & More</p>
                </div>
                <div class="category-card">
                    <div class="category-icon">🥬</div>
                    <h3>Vegetables</h3>
                    <p>Fresh & Organic</p>
                </div>
                <div class="category-card">
                    <div class="category-icon">🍎</div>
                    <h3>Fruits</h3>
                    <p>Juicy & Fresh</p>
                </div>
                <div class="category-card">
                    <div class="category-icon">🥛</div>
                    <h3>Dairy</h3>
                    <p>Milk, Paneer, Curd</p>
                </div>
                <div class="category-card">
                    <div class="category-icon">🍪</div>
                    <h3>Snacks</h3>
                    <p>Biscuits, Chips, Namkeen</p>
                </div>
                <div class="category-card">
                    <div class="category-icon">🥤</div>
                    <h3>Beverages</h3>
                    <p>Soft Drinks, Juices</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Products -->
    <section class="featured">
        <div class="container">
            <h2>Today's Best Deals</h2>
            <div class="product-grid">
                <div class="product-card">
                    <div class="product-image">🍚</div>
                    <h3>Basmati Rice</h3>
                    <p class="price">₹599 <span class="old-price">₹899</span></p>
                    <button class="btn-add" onclick="addToCart('1','Basmati Rice','599')">Add to Cart</button>
                </div>
                <div class="product-card">
                    <div class="product-image">🫘</div>
                    <h3>Toor Dal</h3>
                    <p class="price">₹129 <span class="old-price">₹199</span></p>
                    <button class="btn-add" onclick="addToCart('2','Toor Dal','129')">Add to Cart</button>
                </div>
                <div class="product-card">
                    <div class="product-image">🍪</div>
                    <h3>Oreo Biscuits</h3>
                    <p class="price">₹35 <span class="old-price">₹50</span></p>
                    <button class="btn-add" onclick="addToCart('3','Oreo Biscuits','35')">Add to Cart</button>
                </div>
                <div class="product-card">
                    <div class="product-image">🥛</div>
                    <h3>Amul Gold Milk</h3>
                    <p class="price">₹56 <span class="old-price">₹70</span></p>
                    <button class="btn-add" onclick="addToCart('4','Amul Gold Milk','56')">Add to Cart</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Offers -->
    <section class="offers">
        <div class="container">
            <div class="offer-banner">
                <div class="offer-content">
                    <h3>First Order Offer!</h3>
                    <p>Get ₹100 off on your first order above ₹499</p>
                    <p class="offer-code">Use Code: DMART100</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>D-Mart</h4>
                    <p>India's Favorite Supermarket</p>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <a href="#">About Us</a>
                    <a href="#">Contact Us</a>
                    <a href="#">FAQs</a>
                </div>
                <div class="footer-section">
                    <h4>Policies</h4>
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms & Conditions</a>
                    <a href="#">Return Policy</a>
                </div>
                <div class="footer-section">
                    <h4>Contact</h4>
                    <p>📞 1800-123-4567</p>
                    <p>✉️ care@dmart.com</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 D-Mart. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>
