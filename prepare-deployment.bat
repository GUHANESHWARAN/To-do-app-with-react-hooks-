@echo off
echo ============================================
echo   Preparing Todo App for Deployment
echo ============================================
echo.

echo Step 1: Checking Git...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Git is not installed. Please install Git first:
    echo     https://git-scm.com/download/win
    pause
    exit /b
)
echo [OK] Git is installed

echo.
echo Step 2: Initialize Git Repository...
if not exist .git (
    git init
    echo [OK] Git repository initialized
) else (
    echo [OK] Git repository already exists
)

echo.
echo Step 3: Creating .gitignore...
(
echo node_modules/
echo .env
echo dist/
echo build/
echo *.log
echo .DS_Store
) > .gitignore
echo [OK] .gitignore created

echo.
echo Step 4: Adding files to Git...
git add .
echo [OK] Files added

echo.
echo Step 5: Creating first commit...
git commit -m "Initial commit - MERN Todo App" >nul 2>&1
echo [OK] Commit created

echo.
echo ============================================
echo   NEXT STEPS:
echo ============================================
echo.
echo 1. Create a GitHub account: https://github.com/signup
echo.
echo 2. Create a new repository on GitHub
echo.
echo 3. Run these commands:
echo    git remote add origin YOUR_GITHUB_REPO_URL
echo    git branch -M main
echo    git push -u origin main
echo.
echo 4. Then follow DEPLOYMENT_GUIDE.md to deploy!
echo.
echo ============================================
pause
