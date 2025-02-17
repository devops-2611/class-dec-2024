import React from 'react';
import AttendanceView from './components/AttendanceView.jsx';
import './styles.css';

const App = () => {
    return (
        <div className="app">
            <h1>Welcome to Our Hospital</h1>
            <p>We provide the best healthcare services.</p>
            <AttendanceView />
        </div>
    );
};

export default App;