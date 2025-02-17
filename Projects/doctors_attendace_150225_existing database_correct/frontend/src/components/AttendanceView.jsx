import React, { useState, useEffect } from 'react';

const AttendanceView = () => {
    const [attendance, setAttendance] = useState([]);

    useEffect(() => {
        // fetch('/api/attendance')
        fetch('http://[2401:4900:839b:9ab4:e3a3:cb77:72a:c94c]:5000/api/attendance')

            .then(response => response.json())
            .then(data => setAttendance(data))
            .catch(error => console.error('Error fetching attendance:', error));
    }, []);

    return (
        <div>
            <h1>Doctor Attendance</h1>
            <table>
                <thead>
                    <tr>
                        <th>Doctor Name</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    {attendance.map((record, index) => (
                        <tr key={index}>
                            <td>{record.doctor_name}</td>
                            <td>{record.date}</td>
                            <td>{record.status}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default AttendanceView;