const express = require("express");
const cors = require("cors");
require("dotenv").config();

const doctorRoutes = require("./routes/doctorRoutes");

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/doctors", doctorRoutes);

module.exports = app;
