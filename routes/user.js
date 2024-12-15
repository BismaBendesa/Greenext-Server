const express = require("express");
const router = express.Router();

const { getUsers, getAdmins } = require("../controllers/userController");

router.get("/", getUsers); //http://localhost:5000/api/v1/user
router.get("/admin", getAdmins); //http://localhost:5000/api/v1/user/admin

module.exports = router;
