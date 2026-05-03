const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000;

// Serve static files from 'public' directory
app.use(express.static('public'));

// Main route
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Search endpoint (simulates Brave Search)
app.get('/search', (req, res) => {
    const query = req.query.q;
    res.json({
        query: query,
        message: `Search results for: ${query}`,
        results: [
            { title: `About ${query}`, url: `https://example.com/1` },
            { title: `${query} - Wikipedia`, url: `https://example.com/2` },
            { title: `Latest ${query} news`, url: `https://example.com/3` }
        ]
    });
});

app.listen(PORT, () => {
    console.log(`🚀 Brave Clone running at http://localhost:${PORT}`);
    console.log(`📡 Press Ctrl+C to stop`);
});
