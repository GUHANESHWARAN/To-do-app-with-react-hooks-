# 🔧 Troubleshooting Guide

Common issues and their solutions for the MERN Todo App.

## 🚨 Common Issues

### 1. MongoDB Connection Error

**Error Message:**
```
❌ MongoDB connection error: MongooseServerSelectionError
```

**Solutions:**

**A. If using local MongoDB:**
1. Make sure MongoDB is installed:
   ```bash
   mongod --version
   ```

2. Start MongoDB service:
   - **Windows:** 
     ```bash
     net start MongoDB
     ```
     Or run `mongod` in a terminal
   
   - **Mac/Linux:**
     ```bash
     sudo systemctl start mongod
     # or
     brew services start mongodb-community
     ```

3. Check if MongoDB is running:
   ```bash
   mongo --eval "db.adminCommand('ping')"
   ```

**B. If you don't have MongoDB installed:**

**Option 1: Install MongoDB locally**
- Windows: Download from https://www.mongodb.com/try/download/community
- Mac: `brew install mongodb-community`
- Linux: Follow official MongoDB installation guide

**Option 2: Use MongoDB Atlas (Cloud - FREE)**
1. Go to https://www.mongodb.com/cloud/atlas
2. Create a free account
3. Create a free cluster
4. Get your connection string
5. Update `server/.env`:
   ```env
   MONGODB_URI=mongodb+srv://<username>:<password>@cluster.mongodb.net/mern-todo-app
   ```

---

### 2. Frontend Cannot Connect to Backend

**Error in browser console:**
```
Failed to fetch
Network Error
```

**Solutions:**

1. **Check if backend is running:**
   - Backend should be running on `http://localhost:5000`
   - You should see: `🚀 Server is running on port 5000`

2. **Verify proxy configuration:**
   - Check `client/vite.config.js`:
   ```javascript
   proxy: {
     '/api': {
       target: 'http://localhost:5000',
       changeOrigin: true,
     },
   }
   ```

3. **Check CORS settings:**
   - In `server/server.js`, make sure CORS is enabled:
   ```javascript
   app.use(cors());
   ```

4. **Restart both servers:**
   ```bash
   # Terminal 1 (Backend)
   cd server
   npm run dev
   
   # Terminal 2 (Frontend)
   cd client
   npm run dev
   ```

---

### 3. Port Already in Use

**Error Message:**
```
Error: listen EADDRINUSE: address already in use :::5000
```

**Solutions:**

**Windows:**
```bash
# Find process using port 5000
netstat -ano | findstr :5000

# Kill the process (replace PID with actual number)
taskkill /PID <PID> /F
```

**Mac/Linux:**
```bash
# Find and kill process on port 5000
lsof -ti:5000 | xargs kill -9

# Or for port 3000 (frontend)
lsof -ti:3000 | xargs kill -9
```

**Alternative:** Change the port in `.env` or `vite.config.js`

---

### 4. Login/Register Not Working

**Issue:** Clicking login/register does nothing

**Solutions:**

1. **Check browser console for errors**
   - Press F12 to open DevTools
   - Look in Console tab for error messages

2. **Verify backend is running and MongoDB is connected**
   - Check terminal for backend server
   - Should see: `✅ MongoDB connected successfully`

3. **Check network tab:**
   - Open DevTools → Network tab
   - Try to login
   - Look for failed requests to `/api/auth/login`

4. **Clear localStorage:**
   ```javascript
   // In browser console:
   localStorage.clear()
   location.reload()
   ```

---

### 5. Todos Not Displaying

**Issue:** After login, no todos appear even after creating them

**Solutions:**

1. **Check if you're logged in:**
   ```javascript
   // In browser console:
   localStorage.getItem('token')
   // Should return a JWT token
   ```

2. **Check MongoDB data:**
   ```bash
   # Connect to MongoDB
   mongo
   
   # Switch to database
   use mern-todo-app
   
   # Check todos
   db.todos.find()
   ```

3. **Verify API calls:**
   - Open DevTools → Network tab
   - Filter by "Fetch/XHR"
   - Look for request to `/api/todos`
   - Check response

4. **Clear cache and reload:**
   - Ctrl+Shift+R (Windows/Linux)
   - Cmd+Shift+R (Mac)

---

### 6. Dark Mode Not Persisting

**Issue:** Theme resets on page reload

**Solutions:**

1. **Check localStorage:**
   ```javascript
   // In browser console:
   localStorage.getItem('darkMode')
   ```

2. **Check ThemeContext:**
   - Make sure `ThemeProvider` wraps the app in `App.jsx`

3. **Clear localStorage and try again:**
   ```javascript
   localStorage.removeItem('darkMode')
   location.reload()
   ```

---

### 7. Styles Not Loading

**Issue:** App appears unstyled

**Solutions:**

1. **Check if CSS files are imported:**
   - `main.jsx` should import `index.css`
   - Components should import their CSS files

2. **Clear Vite cache:**
   ```bash
   cd client
   rm -rf node_modules/.vite
   npm run dev
   ```

3. **Check browser console for 404 errors**

---

### 8. npm install Fails

**Error:** Dependencies won't install

**Solutions:**

1. **Clear npm cache:**
   ```bash
   npm cache clean --force
   ```

2. **Delete node_modules and reinstall:**
   ```bash
   rm -rf node_modules package-lock.json
   npm install
   ```

3. **Check Node.js version:**
   ```bash
   node --version
   # Should be v14 or higher
   ```

4. **Try using npm instead of yarn (or vice versa):**
   ```bash
   npm install
   # or
   yarn install
   ```

---

### 9. JWT Token Expired

**Error:** "Token is not valid"

**Solutions:**

1. **Logout and login again:**
   - Click logout button
   - Login with your credentials

2. **Token expires after 7 days** (configured in `server/routes/auth.js`)
   - To change expiration, modify:
   ```javascript
   { expiresIn: '30d' } // 30 days instead
   ```

---

### 10. Cannot Edit or Delete Todos

**Issue:** Edit/delete buttons don't work

**Solutions:**

1. **Check if you're the owner:**
   - Todos can only be modified by their creator
   - Verify you're logged in with the correct account

2. **Check browser console for errors**

3. **Verify authentication token:**
   ```javascript
   // In browser console:
   localStorage.getItem('token')
   ```

4. **Try logging out and back in**

---

## 📋 Debugging Checklist

When something isn't working, check these in order:

- [ ] Is MongoDB running?
- [ ] Is the backend server running (port 5000)?
- [ ] Is the frontend server running (port 3000)?
- [ ] Are there any errors in the browser console?
- [ ] Are there any errors in the backend terminal?
- [ ] Is the internet connection working?
- [ ] Are environment variables set correctly?
- [ ] Did you run `npm install` in both client and server?
- [ ] Are you using the correct MongoDB connection string?
- [ ] Is the JWT token present in localStorage?

---

## 🆘 Getting Help

If you're still stuck:

1. **Check the error message carefully**
   - Google the exact error message
   - Look for stack traces

2. **Console log debugging:**
   ```javascript
   console.log('User data:', user);
   console.log('Todos:', todos);
   ```

3. **Check network requests:**
   - DevTools → Network tab
   - Look at request/response data

4. **Verify data in MongoDB:**
   ```bash
   mongo
   use mern-todo-app
   db.users.find()
   db.todos.find()
   ```

---

## 🔄 Fresh Start

If all else fails, here's how to start fresh:

1. **Stop all servers** (Ctrl+C in terminals)

2. **Clean everything:**
   ```bash
   # Client
   cd client
   rm -rf node_modules package-lock.json .vite
   npm install
   
   # Server
   cd ../server
   rm -rf node_modules package-lock.json
   npm install
   ```

3. **Clear browser data:**
   - Open DevTools → Application tab
   - Clear Storage → Clear site data

4. **Reset MongoDB database:**
   ```bash
   mongo
   use mern-todo-app
   db.dropDatabase()
   ```

5. **Restart everything:**
   ```bash
   # Terminal 1
   cd server
   npm run dev
   
   # Terminal 2
   cd client
   npm run dev
   ```

---

## ✅ Verification Steps

After fixing issues, verify everything works:

1. ✅ Can register a new account
2. ✅ Can login with credentials
3. ✅ Can create a new todo
4. ✅ Can mark todo as complete
5. ✅ Can edit a todo
6. ✅ Can delete a todo
7. ✅ Can filter todos
8. ✅ Can search todos
9. ✅ Dark mode works and persists
10. ✅ Stats update correctly

---

**If you discover a new issue or solution, consider documenting it to help others!**
