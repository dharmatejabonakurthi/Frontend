// Fare calculator
function calculateFare(distance) {
    const baseFare = 25;
    const perKmRate = 12;
    const bookingFee = 10;
    return baseFare + (distance * perKmRate) + bookingFee;
}

// Validate phone number
function validatePhone(phone) {
    const phoneRegex = /^[0-9]{10}$/;
    return phoneRegex.test(phone);
}

// Show notification
function showNotification(message, type = 'success') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 3000);
}

// Auto-refresh ride status
setInterval(() => {
    const rideStatusDiv = document.querySelector('.ride-status-card');
    if (rideStatusDiv && window.location.pathname.includes('/ride_status/')) {
        location.reload();
    }
}, 10000);

// Calculate ETA
function calculateETA(distance) {
    const avgSpeed = 30; // km/h
    const timeInHours = distance / avgSpeed;
    const minutes = Math.round(timeInHours * 60);
    return `${minutes} minutes`;
}

// Share ride details
function shareRideDetails(rideId) {
    if (navigator.share) {
        navigator.share({
            title: 'My Ride Details',
            text: `I'm taking a ride with RapidoClone. Ride ID: ${rideId}`,
            url: window.location.href
        });
    } else {
        alert(`Share ride ID: ${rideId} with your family`);
    }
}

// Emergency contact
function emergencyCall() {
    if (confirm('Emergency! Call 100?')) {
        window.location.href = 'tel:100';
    }
}

// Add emergency button to all ride pages
document.addEventListener('DOMContentLoaded', () => {
    if (document.querySelector('.ride-status-card')) {
        const emergencyBtn = document.createElement('button');
        emergencyBtn.textContent = '🆘 EMERGENCY';
        emergencyBtn.className = 'btn-danger';
        emergencyBtn.style.position = 'fixed';
        emergencyBtn.style.bottom = '20px';
        emergencyBtn.style.right = '20px';
        emergencyBtn.style.zIndex = '1000';
        emergencyBtn.onclick = emergencyCall;
        document.body.appendChild(emergencyBtn);
    }
});
