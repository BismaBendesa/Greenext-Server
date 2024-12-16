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
  createModule,
  createModuleContent,
  createModuleReference,
  getModule,
} = require("../controllers/courseController");

// router.get("/", searchCourse); // http://localhost:5000/api/v1/course/ GET
router.get("/", getOrSearchCourse); // http://localhost:5000/api/v1/course/ GET
router.post("/", authenticateToken, authorizeRole("admin"), addCourse); // http://localhost:5000/api/v1/course/ POST

// module_content routes
router.post(
  "/module/:id/content",
  authenticateToken,
  authorizeRole("admin"),
  createModuleContent
);

// module_reference routes
router.post(
  "/module/:id/reference",
  authenticateToken,
  authorizeRole("admin"),
  createModuleReference
);

router.get("/module/:idCourse", authenticateToken, getModule);

// module routes
router.post(
  "/module/:id",
  authenticateToken,
  authorizeRole("admin"),
  createModule
);

router.put("/:id", authenticateToken, authorizeRole("admin"), updateCourse); // http://localhost:5000/api/v1/course/id PUT
router.get("/:id", getCourseById); // http://localhost:5000/api/v1/course/id GET
router.delete("/:id", authorizeRole("admin"), deleteCourse); // http://localhost:5000/api/v1/course/id DELETE
module.exports = router;
