# Terraform Web Server

## 1. Giới thiệu

Project thực hành DevOps sử dụng Terraform để triển khai hạ tầng Web Server trên môi trường Docker.

Project tạo:
- 2 Web Server Ubuntu container
- 1 Docker Network
- Nginx Web Server
- Port HTTP 8081 và 8082

## 2. Cấu trúc project

```text
terraform-web/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── README.md
└── screenshot/
    ├── terraform-plan.png
    ├── terraform-apply.png
    └── server-running.png
3. Công nghệ sử dụng
Terraform
Docker Desktop
Ubuntu 24.04
Nginx
4. Các biến Terraform

Các biến được khai báo trong variables.tf:

server_name: tên server
server_count: số lượng server
cpu: CPU
ram: RAM
disk: Disk
ssh_key: SSH key
region: Region/Zone
ubuntu_image: Ubuntu image
web_ports: HTTP ports
5. Khởi tạo Terraform

Chạy Terraform bằng Docker:

docker run --rm -v "${PWD}:/workspace" -w /workspace hashicorp/terraform:latest init
6. Kiểm tra cấu hình
docker run --rm -v "${PWD}:/workspace" -w /workspace hashicorp/terraform:latest validate
7. Xem kế hoạch triển khai
docker run --rm -v "${PWD}:/workspace" -w /workspace hashicorp/terraform:latest plan

Kết quả:

Plan: 4 to add, 0 to change, 0 to destroy.
8. Triển khai

Docker socket được mount để Terraform có thể giao tiếp với Docker:

docker run --rm -v "${PWD}:/workspace" -v /var/run/docker.sock:/var/run/docker.sock -w /workspace hashicorp/terraform:latest apply -auto-approve

Kết quả:

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
9. Kiểm tra output
docker run --rm -v "${PWD}:/workspace" -w /workspace -v /var/run/docker.sock:/var/run/docker.sock hashicorp/terraform:latest output

Output:

server_count = 2

server_names = [
  "devops-web-1",
  "devops-web-2",
]

server_ports = [
  8081,
  8082,
]

server_urls = [
  "http://localhost:8081",
  "http://localhost:8082",
]
10. Kiểm tra Web Server

Server 1:

http://localhost:8081

Server 2:

http://localhost:8082

Cả hai server chạy Nginx và hiển thị trang Welcome to nginx.

11. Kiểm tra Docker
docker ps

Kết quả có:

devops-web-1
devops-web-2
12. Xóa hạ tầng

Khi hoàn thành bài:

docker run --rm -v "${PWD}:/workspace" -v /var/run/docker.sock:/var/run/docker.sock -w /workspace hashicorp/terraform:latest destroy -auto-approve
13. Kết quả

Terraform đã tạo thành công:

Docker Network devops-web-network
Web Server devops-web-1
Web Server devops-web-2
Ubuntu 24.04 image
Nginx Web Server