const db = require("../config/db");

const getUsers = async (req, res) => {
  try {
    const query = `SELECT * FROM users`;
    const [result] = await db.query(query);
    res
      .status(200)
      .json({ success: true, data: result, message: "Get Users Successfull" });
  } catch (error) {
    console.error("Error get user data.", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

const getAdmins = async (req, res) => {
  try {
    const query = "SELECT * FROM users WHERE role = 'admin'";
    const [result] = await db.query(query);
    res
      .status(200)
      .json({ success: true, message: "Get admin successful", data: result });
  } catch (error) {
    console.error("Error Get Admin", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

module.exports = {
  getUsers,
  getAdmins,
};
