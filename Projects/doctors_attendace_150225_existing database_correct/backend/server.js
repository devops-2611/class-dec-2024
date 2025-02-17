const express = require('express');
const mysql = require('mysql');
const cors = require('cors');  // Import the cors package
const db = require('./db');

const app = express();
const port = 5000;

// Enable CORS for all origins (you can restrict it to specific origins if needed)
app.use(cors({
    origin: 'http://[2401:4900:839b:9ab4:e3a3:cb77:72a:c94c]:3000'  // Replace with your frontend address
}));

// Middleware to parse JSON requests
app.use(express.json());

// Route to fetch attendance data
app.get('/api/attendance', (req, res) => {
    const query = 'SELECT * FROM attendance';
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
