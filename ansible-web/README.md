# BÀI 2 - AUTOMATION VỚI ANSIBLE

## 1. Giới thiệu

Bài thực hành xây dựng hệ thống tự động hóa triển khai Web Server bằng Ansible.

Mục tiêu:
- Sử dụng Ansible để quản lý nhiều Web Server.
- Kiểm tra kết nối giữa Ansible Controller và các Web Server.
- Tự động cài đặt và cấu hình Nginx.
- Sử dụng Ansible Role.
- Sử dụng Jinja2 Template để tạo trang Web động.
- Kiểm tra kết quả triển khai trên trình duyệt.

Môi trường thực hành sử dụng Docker để mô phỏng các Web Server.

---

## 2. Công nghệ sử dụng

- Windows
- Docker Desktop
- Ubuntu 24.04
- Ansible
- Nginx
- SSH
- Jinja2 Template

Ansible được chạy bằng Docker image:

```text
alpine/ansible