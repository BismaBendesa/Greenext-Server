const express = require("express");
const router = express.Router();
const {
  authenticateToken,
  authorizeRole,
} = require("../controllers/authController");

const {
  getOrSearchCourse,
  addCourse,
  updateCourse,
  getCourseById,
  deleteCourse,
} = require("../controllers/courseController");

// router.get("/", searchCourse); // http://localhost:5000/api/v1/course/ GET
router.get("/", getOrSearchCourse); // http://localhost:5000/api/v1/course/ GET
router.post("/", authenticateToken, authorizeRole("admin"), addCourse); // http://localhost:5000/api/v1/course/ POST
router.put("/:id", authenticateToken, authorizeRole("admin"), updateCourse);
router.get("/:id", getCourseById);
router.delete("/:id", authorizeRole("admin"), deleteCourse);

module.exports = router;
