// Perform search
async function performSearch() {
    const query = document.getElementById('searchInput').value;
    
    if (!query.trim()) {
        alert('Please enter a search term');
        return;
    }
    
    // Show loading state
    const resultsDiv = document.getElementById('results');
    resultsDiv.innerHTML = '<div class="result-item">🔍 Searching privately...</div>';
    
    try {
        const response = await fetch(`/search?q=${encodeURIComponent(query)}`);
        const data = await response.json();
        
        // Display results
        displayResults(data);
    } catch (error) {
        resultsDiv.innerHTML = '<div class="result-item">⚠️ Error searching. Please try again.</div>';
    }
}

// Display search results
function displayResults(data) {
    const resultsDiv = document.getElementById('results');
    
    if (data.results && data.results.length > 0) {
        resultsDiv.innerHTML = `
            <div style="margin-bottom: 1rem; color: #aaa;">
                Showing results for: <strong style="color: #ff6b6b;">${data.query}</strong>
            </div>
            ${data.results.map(result => `
                <div class="result-item">
                    <div class="result-title">🔗 ${result.title}</div>
                    <div class="result-url">${result.url}</div>
                    <div style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;">
                        Privacy protected • No trackers
                    </div>
                </div>
            `).join('')}
        `;
    } else {
        resultsDiv.innerHTML = '<div class="result-item">No results found.</div>';
    }
}

// Search on Enter key
document.getElementById('searchInput').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        performSearch();
    }
});

// Simulate Brave's privacy shield
console.log('🛡️ Brave Shield Active - Blocking trackers and ads');

// Track stats animation
function animateNumbers() {
    const numbers = document.querySelectorAll('.stat-number');
    numbers.forEach(number => {
        const final = number.innerText;
        let current = 0;
        const increment = parseFloat(final) / 50;
        const timer = setInterval(() => {
            current += increment;
            if (current >= parseFloat(final)) {
                number.innerText = final;
                clearInterval(timer);
            } else {
                if (final.includes('.')) {
                    number.innerText = current.toFixed(1);
                } else if (final.includes('M')) {
                    number.innerText = Math.floor(current) + 'M';
                } else if (final.includes('B')) {
                    number.innerText = Math.floor(current) + 'B';
                } else {
                    number.innerText = Math.floor(current);
                }
            }
        }, 30);
    });
}

// Animate stats when they come into view
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            animateNumbers();
            observer.unobserve(entry.target);
        }
    });
});

const statsSection = document.querySelector('.stats');
if (statsSection) {
    observer.observe(statsSection);
}

// Simulate ad blocking count
let adsBlocked = 0;
setInterval(() => {
    adsBlocked += Math.floor(Math.random() * 10);
    const adsBlockedElement = document.querySelector('.stat-box:first-child .stat-number');
    if (adsBlockedElement && adsBlocked < 1000) {
        adsBlockedElement.textContent = adsBlocked;
    }
}, 3000);

// Add privacy notice
window.addEventListener('load', () => {
    console.log('🔒 Private browsing mode active');
    console.log('🛡️ Tracking protection enabled');
    console.log('📡 HTTPS upgrade enabled');
});
