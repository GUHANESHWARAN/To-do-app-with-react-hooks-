# 🚀 MongoDB Atlas Setup Guide (5 Minutes)

## Why MongoDB Atlas?
- ✅ **100% FREE** tier available
- ✅ **No installation** required
- ✅ **Works from anywhere**
- ✅ **Already configured** for cloud deployment

---

## Step-by-Step Setup:

### 1. Create Account
Go to: https://www.mongodb.com/cloud/atlas/register

- Sign up with email or Google
- Choose the **FREE tier** (M0)

### 2. Create a Cluster
- Click "Build a Database"
- Choose **FREE** (M0 Sandbox)
- Select a cloud provider (AWS recommended)
- Choose a region closest to you
- Click "Create Cluster" (takes 3-5 minutes)

### 3. Create Database User
- Click "Database Access" in left menu
- Click "Add New Database User"
- Authentication Method: **Password**
- Username: `admin` (or any name you want)
- Password: Click "Autogenerate Secure Password" and **COPY IT**
- User Privileges: **Read and write to any database**
- Click "Add User"

### 4. Whitelist IP Address
- Click "Network Access" in left menu
- Click "Add IP Address"
- Click "Allow Access from Anywhere" (0.0.0.0/0)
- Click "Confirm"

### 5. Get Connection String
- Click "Database" in left menu
- Click "Connect" button on your cluster
- Choose "Connect your application"
- Driver: **Node.js**
- Version: **5.5 or later**
- Copy the connection string (looks like):
  ```
  mongodb+srv://admin:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
  ```

### 6. Update Your .env File
Replace `<password>` with your actual password:

```env
MONGODB_URI=mongodb+srv://admin:YOUR_PASSWORD_HERE@cluster0.xxxxx.mongodb.net/mern-todo-app?retryWrites=true&w=majority
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
PORT=5000
```

### 7. Restart the Server
The server will auto-restart with nodemon, or press `Ctrl+C` and run:
```bash
npm run dev
```

---

## ✅ You should see:
```
✅ MongoDB connected successfully
```

---

## 🎉 That's it! 
Your app is now connected to a cloud database!

**Total time: ~5 minutes**
