# 📝 Advanced MERN Stack Todo Application

A full-featured todo application built with the MERN stack (MongoDB, Express.js, React, Node.js) with advanced features including authentication, categories, priorities, filtering, and dark mode.

## ✨ Features

### Core Features
- ✅ **User Authentication** - Secure JWT-based authentication
- 📝 **CRUD Operations** - Create, Read, Update, Delete todos
- 🎯 **Categories** - Organize tasks by categories (Personal, Work, Shopping, Health, Fitness, Study, Other)
- 🔥 **Priority Levels** - High, Medium, Low priority tasks
- 📅 **Due Dates** - Set and track due dates with overdue notifications
- ✔️ **Completion Tracking** - Mark tasks as complete/incomplete

### Advanced Features
- 🔍 **Search Functionality** - Search tasks by title or description
- 🎛️ **Filtering & Sorting** - Filter by status, category, and sort by date/priority/due date
- 📊 **Statistics Dashboard** - View total, active, completed, and high-priority task counts
- 🌓 **Dark Mode** - Toggle between light and dark themes
- 📱 **Responsive Design** - Works seamlessly on desktop, tablet, and mobile
- ⚡ **Real-time Updates** - Instant UI updates with React hooks
- 🎨 **Beautiful Animations** - Smooth transitions and animations

### React Hooks Used
- `useState` - Component state management
- `useEffect` - Side effects and lifecycle management
- `useContext` - Global state management (Theme, Auth, Todos)
- Custom context providers for clean architecture

## 🛠️ Tech Stack

### Frontend
- **React 18** - UI library
- **Vite** - Build tool and dev server
- **Context API** - State management
- **Axios** - HTTP client
- **CSS3** - Custom styling with CSS variables

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - Database
- **Mongoose** - ODM for MongoDB
- **JWT** - Authentication
- **bcryptjs** - Password hashing

## 📁 Project Structure

```
demo/
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/    # React components
│   │   │   ├── Dashboard.jsx
│   │   │   ├── Header.jsx
│   │   │   ├── Login.jsx
│   │   │   ├── TodoForm.jsx
│   │   │   ├── TodoList.jsx
│   │   │   ├── TodoItem.jsx
│   │   │   ├── FilterBar.jsx
│   │   │   └── Stats.jsx
│   │   ├── context/       # Context providers
│   │   │   ├── AuthContext.jsx
│   │   │   ├── ThemeContext.jsx
│   │   │   └── TodoContext.jsx
│   │   ├── services/      # API services
│   │   │   ├── authService.js
│   │   │   └── todoService.js
│   │   ├── App.jsx
│   │   ├── main.jsx
│   │   └── index.css
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
│
└── server/                # Node.js backend
    ├── models/           # Mongoose models
    │   ├── User.js
    │   └── Todo.js
    ├── routes/           # Express routes
    │   ├── auth.js
    │   └── todos.js
    ├── middleware/       # Custom middleware
    │   └── auth.js
    ├── server.js         # Entry point
    ├── .env              # Environment variables
    └── package.json
```

## 🚀 Getting Started

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (local or Atlas)
- npm or yarn

### Installation

1. **Clone or navigate to the project directory**
   ```bash
   cd demo
   ```

2. **Install all dependencies (root, server, and client)**
   ```bash
   npm run install-all
   ```
   
   Or install manually:
   ```bash
   # Install root dependencies
   npm install
   
   # Install server dependencies
   cd server
   npm install
   
   # Install client dependencies
   cd ../client
   npm install
   ```

3. **Configure Environment Variables**
   - Edit `server/.env` file with your MongoDB URI:
   ```env
   MONGODB_URI=mongodb://localhost:27017/mern-todo-app
   JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
   PORT=5000
   ```

### Running the Application

**Option 1: Run both servers together (Recommended)**
```bash
npm run dev
```
This will start both backend and frontend servers simultaneously.

**Option 2: Run servers separately**

1. **Start MongoDB** (if using local MongoDB)
   ```bash
   mongod
   ```

2. **Start the Backend Server (Terminal 1)**
   ```bash
   npm run server
   # or
   cd server
   npm run dev
   ```
   Server will run on http://localhost:5000

3. **Start the Frontend (Terminal 2)**
   ```bash
   npm run client
   # or
   cd client
   npm run dev
   ```
   Client will run on http://localhost:3000

**Option 3: Use the start script (Windows)**
```bash
start.bat
```

4. **Open your browser**
   Navigate to http://localhost:3000

## 🔑 API Endpoints

### Authentication
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Login user

### Todos (Protected Routes)
- `GET /api/todos` - Get all todos for authenticated user
- `POST /api/todos` - Create a new todo
- `PUT /api/todos/:id` - Update a todo
- `DELETE /api/todos/:id` - Delete a todo

## 💡 Usage

1. **Register/Login** - Create an account or login
2. **Add Tasks** - Click on the input field to add new tasks with details
3. **Manage Tasks** - Edit, delete, or mark tasks as complete
4. **Filter & Sort** - Use the filter bar to organize your tasks
5. **Search** - Search tasks by title or description
6. **Toggle Theme** - Switch between light and dark mode
7. **Track Progress** - View your statistics dashboard

## 🎨 Features Showcase

### Dark Mode
- Persistent theme preference (saved in localStorage)
- Smooth transitions between themes
- CSS variables for easy theme customization

### Advanced Filtering
- Filter by completion status (All, Active, Completed)
- Filter by category
- Sort by date created, priority, or due date
- Real-time search functionality

### Smart Due Dates
- Visual indicators for due dates
- "Today" and "Tomorrow" labels
- Overdue task highlighting with pulse animation

### Priority System
- Color-coded priorities (High: Red, Medium: Orange, Low: Blue)
- Sort by priority to focus on important tasks

## 🔒 Security Features

- JWT-based authentication
- Password hashing with bcryptjs
- Protected API routes
- User-specific data isolation

## 📱 Responsive Design

- Mobile-first approach
- Breakpoints for tablet and desktop
- Touch-friendly interface
- Optimized layouts for all screen sizes

## 🧪 Testing the App

1. Register a new account
2. Add several tasks with different:
   - Categories
   - Priorities
   - Due dates
3. Test filtering and sorting
4. Try the search functionality
5. Toggle dark mode
6. Mark tasks as complete/incomplete
7. Edit and delete tasks

## 🚀 Deployment

### Frontend (Vercel/Netlify)
```bash
cd client
npm run build
# Deploy the 'dist' folder
```

### Backend (Heroku/Railway/Render)
- Set environment variables
- Deploy the server folder
- Update the frontend API URL

## 📝 License

This project is open source and available under the MIT License.

## 👏 Acknowledgments

Built with modern web technologies and best practices for a full-stack MERN application.

---

**Happy Task Managing! 📝✨**
