from flask import Flask, render_template, request, redirect, url_for, session, jsonify
from functools import wraps
import json
import os
from datetime import datetime
import uuid

app = Flask(__name__)
app.secret_key = 'rapido-secret-key-change-in-production-2024'

# Data file paths
RIDES_FILE = 'rides_data.json'
USERS_FILE = 'users_data.json'

# Initialize data files
def init_data_files():
    if not os.path.exists(RIDES_FILE):
        with open(RIDES_FILE, 'w') as f:
            json.dump([], f)
    
    if not os.path.exists(USERS_FILE):
        with open(USERS_FILE, 'w') as f:
            json.dump([], f)

init_data_files()

# Helper functions
def load_users():
    with open(USERS_FILE, 'r') as f:
        return json.load(f)

def save_users(users):
    with open(USERS_FILE, 'w') as f:
        json.dump(users, f, indent=2)

def load_rides():
    with open(RIDES_FILE, 'r') as f:
        return json.load(f)

def save_rides(rides):
    with open(RIDES_FILE, 'w') as f:
        json.dump(rides, f, indent=2)

# Login decorator
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

# Routes
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        phone = request.form.get('phone')
        password = request.form.get('password')
        
        users = load_users()
        user = next((u for u in users if u['phone'] == phone and u['password'] == password), None)
        
        if user:
            session['user_id'] = user['id']
            session['user_name'] = user['name']
            session['user_phone'] = user['phone']
            return redirect(url_for('dashboard'))
        else:
            return render_template('login.html', error='Invalid phone number or password')
    
    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        password = request.form.get('password')
        
        users = load_users()
        
        # Check if user already exists
        if any(u['phone'] == phone for u in users):
            return render_template('register.html', error='Phone number already registered')
        
        # Create new user
        new_user = {
            'id': str(uuid.uuid4()),
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
            'created_at': datetime.now().isoformat()
        }
        
        users.append(new_user)
        save_users(users)
        
        return redirect(url_for('login'))
    
    return render_template('register.html')

@app.route('/dashboard')
@login_required
def dashboard():
    user_rides = [ride for ride in load_rides() if ride['customer_phone'] == session['user_phone']]
    return render_template('dashboard.html', rides=user_rides[-5:])  # Last 5 rides

@app.route('/book', methods=['GET', 'POST'])
@login_required
def book_ride():
    if request.method == 'POST':
        pickup = request.form.get('pickup')
        destination = request.form.get('destination')
        distance = float(request.form.get('distance', 5))
        
        # Calculate fare
        base_fare = 25
        per_km_rate = 12
        booking_fee = 10
        total_fare = base_fare + (distance * per_km_rate) + booking_fee
        
        # Create new ride
        new_ride = {
            'ride_id': str(uuid.uuid4())[:8],
            'customer_name': session['user_name'],
            'customer_phone': session['user_phone'],
            'pickup': pickup,
            'destination': destination,
            'distance': distance,
            'fare': round(total_fare, 2),
            'status': 'pending',
            'captain': 'Searching for captain...',
            'captain_phone': '',
            'captain_vehicle': '',
            'booking_time': datetime.now().isoformat(),
            'otp': str(uuid.uuid4())[:6]
        }
        
        rides = load_rides()
        rides.append(new_ride)
        save_rides(rides)
        
        return redirect(url_for('ride_status', ride_id=new_ride['ride_id']))
    
    return render_template('booking.html')

@app.route('/ride_status/<ride_id>')
@login_required
def ride_status(ride_id):
    rides = load_rides()
    ride = next((r for r in rides if r['ride_id'] == ride_id), None)
    
    if not ride:
        return redirect(url_for('dashboard'))
    
    # Simulate captain assignment
    if ride['status'] == 'pending' and ride['captain'] == 'Searching for captain...':
        import random
        captains = [
            {'name': 'Rahul Sharma', 'phone': '9876543210', 'vehicle': 'CB 01 AB 1234', 'rating': 4.8},
            {'name': 'Amit Kumar', 'phone': '9876543211', 'vehicle': 'CB 02 CD 5678', 'rating': 4.9},
            {'name': 'Vikram Singh', 'phone': '9876543212', 'vehicle': 'CB 03 EF 9012', 'rating': 4.7}
        ]
        captain = random.choice(captains)
        
        ride['status'] = 'confirmed'
        ride['captain'] = captain['name']
        ride['captain_phone'] = captain['phone']
        ride['captain_vehicle'] = captain['vehicle']
        ride['captain_rating'] = captain['rating']
        
        rides = [r if r['ride_id'] != ride_id else ride for r in rides]
        save_rides(rides)
    
    return render_template('ride_status.html', ride=ride)

@app.route('/cancel_ride/<ride_id>')
@login_required
def cancel_ride(ride_id):
    rides = load_rides()
    rides = [r for r in rides if r['ride_id'] != ride_id]
    save_rides(rides)
    return redirect(url_for('dashboard'))

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

# API endpoints for live tracking
@app.route('/api/ride/<ride_id>')
def api_ride_status(ride_id):
    rides = load_rides()
    ride = next((r for r in rides if r['ride_id'] == ride_id), None)
    if ride:
        return jsonify({
            'status': ride['status'],
            'captain_location': {'lat': 28.6139, 'lng': 77.2090} if ride['status'] == 'confirmed' else None,
            'eta': '5 minutes' if ride['status'] == 'confirmed' else None
        })
    return jsonify({'error': 'Ride not found'}), 404

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
