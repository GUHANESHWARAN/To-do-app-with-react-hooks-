# 📋 Quick Command Reference

## 🚀 Available NPM Scripts (from root directory)

### **Running the Application**

```bash
# Start both servers together (EASIEST)
npm run dev

# Start only backend server
npm run server

# Start only frontend server  
npm run client
```

### **Installation**

```bash
# Install all dependencies (root + client + server)
npm run install-all

# Install only server dependencies
npm run install-server

# Install only client dependencies
npm run install-client
```

### **Building**

```bash
# Build frontend for production
npm run build
```

---

## 📁 Directory-Specific Commands

### **From /server directory:**
```bash
cd server

# Start development server with auto-reload
npm run dev

# Start production server
npm start
```

### **From /client directory:**
```bash
cd client

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

---

## 🛑 Stopping the Application

### **If running with `npm run dev`:**
```bash
# Press in terminal:
Ctrl + C
```

### **If servers are stuck:**
```bash
# Kill backend (port 5000)
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Kill frontend (port 3000)
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Kill all Node processes (nuclear option)
taskkill /IM node.exe /F
```

---

## 🗄️ MongoDB Commands

### **Start MongoDB (Windows):**
```bash
net start MongoDB
```

### **Connect to MongoDB:**
```bash
mongosh
# or older versions:
mongo
```

### **Check MongoDB data:**
```bash
mongosh
use mern-todo-app
db.users.find()
db.todos.find()
```

---

## 🔧 Troubleshooting Commands

### **Clear node_modules and reinstall:**
```bash
# From root
npm run install-all

# Manual clean install
rm -rf node_modules package-lock.json
cd client
rm -rf node_modules package-lock.json
cd ../server
rm -rf node_modules package-lock.json
cd ..
npm run install-all
```

### **Clear npm cache:**
```bash
npm cache clean --force
```

### **Check ports in use:**
```bash
# Windows
netstat -ano | findstr :3000
netstat -ano | findstr :5000
netstat -ano | findstr :27017

# Mac/Linux
lsof -ti:3000
lsof -ti:5000
lsof -ti:27017
```

---

## 📊 Project Structure Commands

### **View directory structure:**
```bash
# Windows
tree /F

# Mac/Linux
tree
```

### **Count lines of code:**
```bash
# Windows PowerShell
(Get-ChildItem -Recurse -Include *.js,*.jsx,*.css | Get-Content | Measure-Object -Line).Lines

# Mac/Linux
find . -name "*.js" -o -name "*.jsx" -o -name "*.css" | xargs wc -l
```

---

## 🧪 Testing Commands

### **Check if servers are responding:**
```bash
# Backend health check
curl http://localhost:5000/api/health

# Frontend check
curl http://localhost:3000
```

---

## 🎯 Common Workflows

### **Fresh Start (Everything from scratch):**
```bash
# 1. Clean everything
rm -rf node_modules client/node_modules server/node_modules
rm -rf package-lock.json client/package-lock.json server/package-lock.json

# 2. Install all dependencies
npm run install-all

# 3. Start MongoDB (if local)
net start MongoDB

# 4. Run the app
npm run dev
```

### **Deploy Preparation:**
```bash
# Build frontend
npm run build

# Test production build
cd client
npm run preview
```

### **Database Reset:**
```bash
mongosh
use mern-todo-app
db.dropDatabase()
exit
```

---

## 💡 Pro Tips

1. **Always run from root directory** - Use `npm run dev` instead of navigating to client/server
2. **Use concurrently** - The root package.json runs both servers together
3. **Check logs** - Both server outputs appear in the same terminal
4. **Environment variables** - Make sure `.env` file exists in server directory

---

## ⚡ Quick Shortcuts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start everything |
| `Ctrl + C` | Stop servers |
| `npm run install-all` | Install all dependencies |
| `npm run build` | Build for production |

---

**Always run commands from the root `/demo` directory unless specified otherwise!**
