const bcrypt = require("bcrypt");
const db = require("../config/db");
const jwt = require("jsonwebtoken");

const registerUser = async (req, res) => {
  const {
    username,
    password,
    email,
    role = "user",
    created_at,
    updated_at,
  } = req.body;

  // console.log("Request Body:", req.body);

  // basic validation
  if (!username || !email || !password) {
    return res
      .status(400)
      .json({ success: false, message: "All fields are required" });
  }

  try {
    const queryCheckEmail = "SELECT * FROM users WHERE email = ?";

    //check if email already exist
    const [existingUser] = await db.query(queryCheckEmail, [email]);
    if (existingUser.length > 0) {
      return res
        .status(409)
        .json({ success: false, message: "Email already exists" });
    }

    // hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // insert new user to database
    const query =
      "INSERT INTO users (username, email, password, role, created_at, updated_at) VALUES (?, ?, ?, ?, NOW(), NOW())";
    const result = await db.query(query, [
      username,
      email,
      hashedPassword,
      role,
    ]);
    res.status(201).json({
      success: true,
      message: "User successfully registered",
      userId: result.insertId,
    });
  } catch (error) {
    console.error("Error registering user", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

const loginUser = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res
      .status(400)
      .json({ success: false, message: "All fields are required" });
  }

  try {
    // check if user exist
    const findUserQuery = `SELECT * FROM users WHERE email = ?`;
    const [rows] = await db.query(findUserQuery, [email]);

    if (rows.length === 0) {
      return res
        .status(401)
        .json({ success: false, message: "Invalid credentials" });
    }

    const user = rows[0];

    // check password
    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res
        .status(401)
        .json({ success: false, message: "Invalid credentials" });
    }

    // generate jwt token
    const token = jwt.sign(
      {
        id: user.id,
        email: user.email,
        username: user.username,
        role: user.role,
        createdAt: user.created_at,
        updatedAt: user.updated_at,
      },
      "your_jwt_secret",
      { expiresIn: "1h" }
    );

    // set token in an HTTP-Only Cookie
    res.cookie("token", token, {
      httpOnly: true,
      secure: true,
      sameSite: "none",
      maxAge: 3600000,
    });
    console.log("Response headers:", res.getHeaders());

    console.log("Set-Cookie Header:", res.getHeaders()["set-cookie"]);

    res.status(200).json({
      success: true,
      message: "Login Successful",
      token,
      // user: req.user,
    });
  } catch (error) {
    console.error("Error Logging in user", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

// middleware authenthicate token
const authenticateToken = (req, res, next) => {
  const token = req.cookies?.token; // retrieve token from cookie using optional chaining
  // console.log("Token from Cookies:", token);

  // console.log("All Cookies:", req.cookies);
  // console.log("Token:", req.cookies?.token);
  // console.log("Headers:", req.headers);

  if (!token) {
    return res
      .status(401)
      .json({ success: false, message: "Access Denied : No Token Provided" });
  }

  try {
    const decoded = jwt.verify(token, "your_jwt_secret"); // veriy token
    req.user = decoded; // attach user info to request
    console.log("User : ", req.user);
    next();
  } catch (error) {
    console.error("Invalid Token", error.message);
    res.status(403).json({ success: false, message: "Invalid Token" });
  }
};

const logoutUser = async (req, res) => {
  res.setHeader(
    "Cache-Control",
    "no-store, no-cache, must-revalidate, proxy-revalidate"
  );
  res.setHeader("Expires", "0");
  res.setHeader("Pragma", "no-cache");
  console.log("Session data:", req.session);
  if (!req.session) {
    return res.status(400).json({ message: "Session not found" });
  }
  await req.session.destroy((err) => {
    if (err) {
      console.error("Error destroying session:", err);
      return res
        .status(500)
        .json({ success: false, message: "Error Logout failed" });
    }
    res.clearCookie("token", {
      httpOnly: true,
      secure: false,
      sameSite: "lax",
      maxAge: 3600000,
      path: "/",
    });
    console.log("token cookie cleared");
    res
      .status(200)
      .json({ success: true, message: "Logged out successfully!" });
  });
};

// middleware for authorized user
const authorizeRole = (requiredRole = "admin") => {
  return (req, res, next) => {
    if (!requiredRole) {
      return res
        .status(400)
        .json({ success: false, message: "No Role passsed" });
    }
    const userRole = req.user.role; // get the user role set by authenthicate token middleware
    if (userRole !== requiredRole) {
      return res.status(403).json({ success: false, message: "Access Denied" });
    }
    next();
  };
};

module.exports = {
  registerUser,
  loginUser,
  authenticateToken,
  logoutUser,
  authorizeRole,
};
