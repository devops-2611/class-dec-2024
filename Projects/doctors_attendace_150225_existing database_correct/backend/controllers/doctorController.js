const db = require("../models/db");

exports.markAttendance = (req, res) => {
    const { doctor_name, department } = req.body;
    if (!doctor_name || !department) {
        return res.status(400).json({ message: "Missing fields" });
    }
    const query = "INSERT INTO attendance (doctor_name, department, date) VALUES (?, ?, NOW())";
    db.query(query, [doctor_name, department], (err) => {
        if (err) return res.status(500).json({ message: err.message });
        res.status(201).json({ message: "Attendance marked" });
    });
};

exports.getAttendance = (req, res) => {
    db.query("SELECT * FROM attendance", (err, results) => {
        if (err) return res.status(500).json({ message: err.message });
        res.json(results);
    });
};
