# DevOps Test 1 - Website

## Giới thiệu
Website demo cho bài thực hành CI/CD với GitHub, Jenkins, Docker và Telegram.

## Công nghệ
- HTML, CSS, JavaScript
- GitHub
- Jenkins Pipeline
- Docker
- Nginx
- Telegram Bot

## Chạy bằng Docker
Build image:

```bash
docker build -t devops-test1-website .
```

Chạy container:

```bash
docker run -d --name devops-test1-website -p 8081:80 devops-test1-website
```

Truy cập website:

http://localhost:8081

## CI/CD
Jenkins sẽ lấy source từ branch main, kiểm tra source, build Docker image và triển khai website.
Test automatic CI CD trigger - 15/10/2026

Test Jenkins Poll SCM
