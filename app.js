const dotenv = require("dotenv").config();

const express = require("express");
const session = require("express-session");
const cors = require("cors");
const cookieParser = require("cookie-parser");

const course = require("./routes/course");
const auth = require("./routes/auth");
const user = require("./routes/user");
const techCatalog = require("./routes/techCatalog");

const PORT = process.env.PORT || 5000;

const app = express();

app.use(
  session({
    secret: "your-secret-key", // Replace with a secure key
    resave: false,
    saveUninitialized: false, // Prevents creating empty sessions
    cookie: {
      httpOnly: true,
      secure: process.env.NODE_ENV === "production", // Secure cookies in production
      sameSite: "none", // Protects against CSRF
      maxAge: 3600000, // 1 hour
    },
  })
);

app.use(express.json());
const allowedOrigins = [
  "http://localhost:5173",
  "https://greennext-nu.vercel.app",
];

app.use(
  cors({
    origin: (origin, callback) => {
      // Allow requests with no origin (like mobile apps or curl requests)
      if (!origin || allowedOrigins.includes(origin)) {
        callback(null, true);
      } else {
        callback(new Error("Not allowed by CORS"));
      }
    },
    credentials: true,
    methods: ["GET", "POST", "PUT", "DELETE"],
  })
); // allow frontend origin
app.use(cookieParser()); // enable cookie parser

app.use("/api/v1/auth", auth);
app.use("/api/v1/user", user);
app.use("/api/v1/course", course);
app.use("/api/v1/tech-catalog", techCatalog);

app.all("*", (req, res) => {
  res.status(404).json({ success: false, message: "Request not found" });
});
// app.get("/", (req, res) => {
//   const query = "SELECT * FROM course";

//   db.query(query, (err, result) => {
//     if (err) {
//       console.log("Error executing the query", err);
//       return res.status(500).send("Database query failed.");
//     }
//     res.json(result);
//   });
// });

app.listen(PORT, () => {
  console.log(`server listen to port ${PORT}`);
});
