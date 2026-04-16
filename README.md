<div align="center">

# ⚡ RAILWAY VPS — ULTIMATE MODE ⚡
### Full Pterodactyl Panel + Wings • Single Deployment • High Performance

<img src="https://githubusercontent.com" width="120" alt="logo"/>

<p>
  <img src="https://img.shields.io/badge/Ubuntu-22.04-E95420?style=for-the-badge&logo=ubuntu" />
  <img src="https://img.shields.io/badge/Pterodactyl-Latest-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Railway-Compatible-success?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Performance-Optimized-red?style=for-the-badge" />
</p>

<b>🚀 Run a full game hosting stack on Railway — no external VPS required</b>

</div>

---

## 🧠 OVERVIEW

This project transforms Railway into a **pseudo-VPS environment** capable of running:

- ⚡ Pterodactyl Panel  
- ⚡ Wings Daemon  
- ⚡ MariaDB + Redis  
- ⚡ Nginx + PHP-FPM  

All inside **one deployment**.

> You are bending Railway to act like a VPS.

---

## 🔥 FEATURES

- 🚀 All-in-One Deployment (Panel + Wings)
- ⚙️ Optimized Stack (Low Overhead)
- 💾 Persistent Storage Ready
- 🌐 Railway Networking Compatible
- 🔐 Secure Admin Setup
- ⚡ Fast Boot + Stable Runtime

---

## 🏗️ ARCHITECTURE

```
[ User ]
   ↓
[ NGINX ]
   ↓
[ PHP-FPM ]
   ↓
[ Pterodactyl Panel ]
   ↓
 ├── MariaDB
 ├── Redis
 └── Wings
```

---

## 🛠️ STACK

| Layer        | Technology |
|-------------|-----------|
| OS          | Ubuntu 22.04 |
| Web Server  | Nginx |
| Backend     | PHP 8.1 |
| Database    | MariaDB 10.6 |
| Cache       | Redis |
| Daemon      | Wings |
| Platform    | Railway |

---

## 🚀 DEPLOYMENT

### 1. Fork & Deploy
- Fork this repository  
- Go to Railway  
- Create new project → Deploy from GitHub  
- Wait for build (~5 minutes)

---

### 2. Networking (IMPORTANT)

- Go to **Settings → Networking**
- Click **Generate Domain**
- Set:

```
Expose Port: 80
```

---

### 3. Create Admin

Open Railway terminal:

```
cd /var/www/pterodactyl
php artisan p:user:make
```

Fill:
- Admin → yes  
- Email → real email  
- Username → anything  
- Password → strong  

---

### 4. Configure Wings

In Panel:
- Admin → Nodes → Create Node  
- Use Railway domain as FQDN  
- Copy configuration token  

Then run:

```
nano /etc/pterodactyl/config.yml
```

Paste → Save → Exit

---

## 💾 PERSISTENT STORAGE (CRITICAL)

Railway resets data without volumes.

Go to **Settings → Volumes** and add:

| Path | Purpose |
|------|--------|
| /var/lib/mysql | Database |
| /var/lib/pterodactyl | Server Files |

---

## ⚡ PERFORMANCE NOTES

- Railway is not a full VPS  
- Limited CPU and RAM  
- Best for:
  - Development  
  - Small hosting  
  - Testing environments  

---

## 🧨 TROUBLESHOOTING

| Issue | Cause |
|------|------|
| Panel not loading | Port not exposed |
| Login fails | Admin not created |
| Wings offline | Configuration error |
| Data lost | No volumes |
| Slow performance | Resource limits |

---

## 🧠 FINAL NOTE

This setup works only with proper execution.

Break steps → break system  
Follow correctly → full hosting stack on Railway

---

<div align="center">

### ⚡ StartupGaming ⚡  
<i>No limits. Only execution.</i>

</div>
