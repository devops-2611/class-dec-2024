import mysql from 'mysql2';

// const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'hospital-db', // Use the container name as the host
    user: 'root',
    password: 'password', // Match the password set in the Docker run command
    database: 'hospital'
});

connection.connect(err => {
    if (err) {
        console.error('Error connecting to the database:', err.stack);
        return;
    }
    console.log('Connected to the database.');
});

module.exports = connection;