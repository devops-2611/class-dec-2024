const express = require("express");
const router = express.Router();
const doctorController = require("../controllers/doctorController");

router.post("/mark-attendance", doctorController.markAttendance);
router.get("/attendance", doctorController.getAttendance);

module.exports = router;
