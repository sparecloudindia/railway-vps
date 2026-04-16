<div align="center">
  <img src="https://githubusercontent.com" width="150" alt="Core Logo">
  
  # ⚡ RAILWAY VPS ULTIMATE EDITION ⚡
  ### [ HIGH-PERFORMANCE PTERODACTYL ALL-IN-ONE STACK ]
  
  <p align="center">
    <img src="https://shields.io" alt="Version" />
    <img src="https://shields.io" alt="Security" />
    <img src="https://shields.io" alt="RAM" />
  </p>
</div>

---

## 📖 PROJECT OVERVIEW
This repository contains a highly optimized **Ubuntu 22.04 LTS** environment designed to run on **Railway.app**. It bypasses standard container limitations to deploy a full **Pterodactyl Panel** and **Wings** daemon in a single instance. 

> **"Designed for speed, built for stability."**

---

## 🛠️ THE TECHNOLOGY STACK
*   **Operating System:** Ubuntu 22.04 (Jammy Jellyfish)
*   **Web Engine:** Nginx (High Performance)
*   **Back-end:** PHP 8.1 FPM
*   **Database:** MariaDB 10.6 (MySQL Compatible)
*   **Cache:** Redis Server 6.x
*   **Daemon:** Pterodactyl Wings (Latest Build)

---

## 🚀 STEP-BY-STEP SETUP GUIDE (THE LONG READ)

Follow these exact steps to ensure your VPS and Game Panel run without errors.

### Phase 1: Deployment
1.  **Fork the Repo:** Click the `Fork` button at the top right of this page.
2.  **Connect to Railway:** Go to [Railway.app](https://railway.app), start a new project, and select your forked GitHub repository.
3.  **Wait for Build:** Railway will read the `Dockerfile`. This takes about 5 minutes as it installs PHP, MySQL, and Nginx.

### Phase 2: Networking (Crucial)
1.  Go to the **Settings** tab of your project in Railway.
2.  Scroll down to **Networking**.
3.  Click **Generate Domain** (You will get a link like `xyz.up.railway.app`).
4.  Set **Expose Port** to `80`. This allows you to see the Panel in your browser.

### Phase 3: Identity & Security (Admin Creation)
Once the build is "Active", the Panel is running, but you can't login yet. You must create an admin:
1.  Open the **Deploy Logs** or **Terminal** in Railway.
2.  Type the following command:
    ```bash
    cd /var/www/pterodactyl
    php artisan p:user:make
    ```
3.  Follow the prompts:
    *   **Is this user an administrator?** Type `yes`.
    *   **Email:** Use a real email.
    *   **Username:** Your name.
    *   **Password:** Use a strong password.

### Phase 4: Wings Setup (The Engine)
1.  Login to your Panel using the URL generated in Phase 2.
2.  Go to **Admin Settings** > **Nodes** > **Create New**.
3.  Fill in the details (Use your Railway domain for the FQDN).
4.  Copy the **Configuration Token** provided by the Panel.
5.  In your Railway Terminal, create the config:
    ```bash
    nano /etc/pterodactyl/config.yml
    ```
6.  Paste the token and save.

---

## 📁 PERSISTENT STORAGE (IMPORTANT!)
By default, Railway containers are "read-only" after restart. **To save your game data forever**, you MUST:
1. Go to **Settings** > **Volumes**.
2. Mount a volume to `/var/lib/mysql` (for database).
3. Mount a volume to `/var/lib/pterodactyl` (for game files).

---

<div align="center">
  <p>© 2026 StartupGaming</p>
  <p><i>build with 💖 by bot dev team</i></p>
</div>
