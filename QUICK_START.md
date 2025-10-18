# 🚀 Quick Start Guide

## ⚠️ IMPORTANT: Before You Start

You need **MongoDB** running for this application to work!

### Option 1: Install MongoDB Locally (Recommended for Development)

**Windows:**
1. Download MongoDB Community Server from: https://www.mongodb.com/try/download/community
2. Install it (use default settings)
3. MongoDB will start automatically, or run:
   ```bash
   net start MongoDB
   ```
   Or manually start:
   ```bash
   "C:\Program Files\MongoDB\Server\7.0\bin\mongod.exe"
   ```

**Mac:**
```bash
# Install via Homebrew
brew tap mongodb/brew
brew install mongodb-community

# Start MongoDB
brew services start mongodb-community
```

**Linux:**
```bash
# Follow official MongoDB installation guide for your distro
# Then start it:
sudo systemctl start mongod
```

### Option 2: Use MongoDB Atlas (Cloud - FREE, No Installation)

1. Go to https://www.mongodb.com/cloud/atlas
2. Sign up for a free account
3. Create a free cluster (M0)
4. Click "Connect" → "Connect your application"
5. Copy the connection string
6. Update `server/.env`:
   ```env
   MONGODB_URI=mongodb+srv://<username>:<password>@cluster.mongodb.net/mern-todo-app?retryWrites=true&w=majority
   ```
   Replace `<username>` and `<password>` with your credentials

---

## ✅ Steps to Run the Application

### Step 1: Ensure MongoDB is Running

**Check if MongoDB is running:**
```bash
# Windows
tasklist | findstr mongod

# Mac/Linux
ps aux | grep mongod
```

If not running, start it using one of the methods above.

### Step 2: Start the Backend Server

Open a terminal and run:
```bash
cd server
npm run dev
```

You should see:
```
🚀 Server is running on port 5000
✅ MongoDB connected successfully
```

❌ If you see "MongoDB connection error", MongoDB is not running!

### Step 3: Start the Frontend

Open a **NEW** terminal and run:
```bash
cd client
npm run dev
```

You should see:
```
VITE ready in XXX ms
➜  Local:   http://localhost:3000/
```

### Step 4: Open in Browser

1. Click the preview button in the tool panel, OR
2. Open your browser and go to: **http://localhost:3000**

---

## 🎯 First Time Setup

1. **Register a new account**
   - Click "Register" link
   - Enter your name, email, and password (min 6 characters)
   - Click "Register"

2. **Start creating todos!**
   - Click on the input field to expand the form
   - Add task details, category, priority, and due date
   - Click "Add" button

3. **Try advanced features:**
   - ✅ Mark tasks as complete
   - 🔍 Search for tasks
   - 🎛️ Filter by status or category
   - 📊 Sort by priority or due date
   - ✏️ Edit tasks inline
   - 🗑️ Delete tasks
   - 🌓 Toggle dark mode

---

## 🛠️ Using the Quick Start Script

**Windows users can use the batch file:**
```bash
# Just double-click start.bat
# Or run in terminal:
start.bat
```

This will:
- Open two terminal windows
- Start backend server in one
- Start frontend server in the other

---

## ❌ Troubleshooting

### MongoDB Not Connecting?

1. **Verify MongoDB is running:**
   ```bash
   # Try to connect to MongoDB
   mongo
   # or
   mongosh
   ```

2. **Check the port:**
   - MongoDB should be on port 27017
   - Check with: `netstat -an | findstr 27017`

3. **Use MongoDB Atlas instead** (see Option 2 above)

### Port Already in Use?

If you see `EADDRINUSE` error:

**Backend (port 5000):**
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Mac/Linux  
lsof -ti:5000 | xargs kill -9
```

**Frontend (port 3000):**
```bash
# Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Mac/Linux
lsof -ti:3000 | xargs kill -9
```

### Other Issues?

Check **TROUBLESHOOTING.md** for detailed solutions!

---

## 📱 Current Status

**Backend Server:** ✅ Running on http://localhost:5000

**Frontend Server:** ✅ Running on http://localhost:3000

**MongoDB:** ⚠️ **You need to start MongoDB!**

Once MongoDB is running, you'll see `✅ MongoDB connected successfully` in the backend terminal.

---

## 🎉 You're Ready!

Once you see:
- ✅ Backend running (port 5000)
- ✅ Frontend running (port 3000)
- ✅ MongoDB connected

Open http://localhost:3000 and start managing your tasks!

---

## 📚 Next Steps

- Read **README.md** for complete documentation
- Check **FEATURES.md** to learn about all advanced features
- See **TROUBLESHOOTING.md** if you run into issues

**Happy task managing! 📝✨**
