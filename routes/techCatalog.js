const express = require("express");
const router = express.Router();

const {
  authenticateToken,
  authorizeRole,
} = require("../controllers/authController");

const {
  addCatalog,
  getOrfindCatalog,
  updateCatalog,
  getCatalogById,
  deleteCatalog,
} = require("../controllers/techCatalogController");

router.get("/", getOrfindCatalog);
router.post("/", authenticateToken, authorizeRole("admin"), addCatalog);
router.put("/:id", authenticateToken, authorizeRole("admin"), updateCatalog);
router.get("/:id", getCatalogById);
router.delete("/:id", authenticateToken, authorizeRole("admin"), deleteCatalog);

module.exports = router;
