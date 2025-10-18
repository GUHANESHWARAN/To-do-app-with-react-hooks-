@echo off
echo ===================================
echo   MERN Todo App - Quick Start
echo ===================================
echo.
echo Checking if MongoDB is running...
timeout /t 2 /nobreak >nul
echo.
echo Starting Both Servers...
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo ===================================
echo.
npm run dev
echo.
pause
