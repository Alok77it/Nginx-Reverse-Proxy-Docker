# 🚀 NGINX Reverse Proxy with Docker Compose

Easily run and route multiple backend services using Docker Compose and NGINX!  
This project demonstrates how to connect a Go (Golang) app and a Python (Flask) app behind one NGINX reverse proxy, using clean path-based routing.

---

## 🧩 What’s Inside?

- **service1:** Go backend (listens on port 8001)
- **service2:** Python Flask backend (listens on port 8002)
- **nginx:** Reverse proxy for both services (exposes port 8080)

All managed with **Docker Compose** for easy local development.

---

## 🗂️ Folder Structure

```
.
├── docker-compose.yml      # Compose file - brings everything up
├── Makefile                # Simple commands for build/run/clean
├── nginx/
│   ├── nginx.conf          # NGINX config (reverse proxy)
│   └── Dockerfile          # Builds NGINX image
├── service_1/
│   ├── main.go             # Go app
│   └── Dockerfile          # Builds Go image
├── service_2/
│   ├── app.py              # Python Flask app
│   └── Dockerfile          # Builds Python image
└── README.md
```

---

## 🔀 How Traffic is Routed

| URL Path                 | Goes To                   | Container Port | Language        |
|--------------------------|---------------------------|---------------|-----------------|
| `http://localhost:8080/service1/*` | `service1` (`main.go`)        | 8001          | Go (Golang)     |
| `http://localhost:8080/service2/*` | `service2` (`app.py`)         | 8002          | Python (Flask)  |

All requests come to **NGINX** on port **8080**, which smartly routes them to the correct backend based on the path.

---

## 🚦 Quick Start

1. **Start Everything:**
   ```sh
   make up
   ```

2. **Test Your Services:**
   ```sh
   curl http://localhost:8080/service1/hello
   curl http://localhost:8080/service2/ping
   ```
   Or open those URLs in your browser!

3. **Stop All Services:**
   ```sh
   make down
   ```

---

## 🛠️ Common Makefile Commands

| Command      | What it Does                          |
|--------------|---------------------------------------|
| `make up`    | Build & start all containers          |
| `make down`  | Stop all containers                   |
| `make logs`  | View real-time logs                   |
| `make clean` | Remove containers, images, and volumes|

---

## 🆘 Troubleshooting

### 1. **502 Bad Gateway**
- **Check:** NGINX can’t reach your backend
- **Fix:** Make sure Go runs on `8001`, Python on `8002`, and your `nginx.conf` and `docker-compose.yml` match.

### 2. **Could not resolve host: service2**
- **Check:** Service name typo?
- **Fix:** Service name in both `docker-compose.yml` and `nginx.conf` must be `service2`.

### 3. **Port 8080 already in use**
- **Fix:** Free the port:
  ```sh
  sudo lsof -i :8080
  sudo kill -9 <PID>
  ```

### 4. **go.mod or go.sum not found**
- **Fix:** In `service_1` folder, run:
  ```sh
  go mod init service1
  ```

---

## 📚 Pro Tips

- **Change ports?** Update in both `docker-compose.yml` and `nginx.conf`.
- **Add new services?** Copy the pattern for service1/service2 and update NGINX routes!

---
