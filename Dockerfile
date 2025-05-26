# Sử dụng image Node.js phiên bản 16 trên nền tảng Alpine Linux để giảm kích thước image
FROM node:16-alpine AS builder

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép file package.json vào thư mục làm việc
COPY nodejs-webapp/package.json ./

# Cài đặt các dependencies được định nghĩa trong package.json
RUN npm install

# Sao chép toàn bộ mã nguồn ứng dụng vào thư mục làm việc
COPY nodejs-webapp/ ./

# Mở cổng 8081 để ứng dụng có thể lắng nghe
EXPOSE 8081

# Lệnh khởi chạy ứng dụng
CMD ["npm", "start"]