<div align="center">
  <img src="https://railway.app" width="100" height="100" alt="Logo">
  <h1>🚀 RAILWAY ULTIMATE VPS</h1>
  <p><b>The Most Powerful All-in-One Pterodactyl & Ubuntu Environment on Railway</b></p>

  [![Deploy on Railway](https://railway.app)](https://railway.app)

  ![Ubuntu](https://shields.io)
  ![Docker](https://shields.io)
  ![Status](https://shields.io)
</div>

---

## ⚡ Why This Template?
This isn't just a basic Ubuntu container. It’s a **pre-configured beast** designed to bypass common restrictions and get your Game Panel running in minutes.

- **🔥 Hyper-Performance:** Optimized for Intel Xeon / AMD EPYC environments.
- **🛠️ Integrated Stack:** Nginx, PHP 8.1, MariaDB, Redis, and Wings — all in one repo.
- **🛡️ Full Root:** Complete `sudo` control with automated `entrypoint` execution.
- **🎮 Game Ready:** Designed specifically for Pterodactyl-based hosting.

---

## 🏗️ Architecture Specs

| Feature | Technology |
| :--- | :--- |
| **Core OS** | Ubuntu 22.04 LTS (Jammy) |
| **Web Server** | Nginx (Optimized for Ptero) |
| **Engine** | PHP 8.1 FPM |
| **Database** | MariaDB 10.x |
| **Caching** | Redis Server |
| **Daemon** | Pterodactyl Wings (Latest) |

---

## 🚀 Instant Deployment Guide

### 1. Fork & Deploy
Click the **Deploy on Railway** button above or link this repo manually to a new Railway project.

### 2. Configure Networking
Go to **Settings > Networking** in Railway:
- Click **Generate Domain**.
- Set **Expose Port** to `80` (Primary Panel Port).

### 3. Create God-User (Admin)
Once the build is green, open the **Deploy Logs/Terminal** and run:
```bash
cd /var/www/pterodactyl
php artisan p:user:make
