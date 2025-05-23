const express = require("express");
const path = require("path");
const app = express();
const PORT = 8081;

// Serve static files
app.use(express.static("."));

// Route cho trang chủ
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

// Route cho trang about
app.get("/about", (req, res) => {
  res.sendFile(path.join(__dirname, "about.html"));
});

// Khởi động server
app.listen(PORT, () => {
  console.log(`Server đang chạy trên cổng ${PORT}`);
  console.log(`Truy cập: http://localhost:${PORT}`);
});
