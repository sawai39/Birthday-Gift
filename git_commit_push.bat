@echo off
echo =====================================
echo Git Commit and Push to GitHub
echo =====================================
echo.

REM Check if Git is installed
echo 1. Checking Git installation...
git --version
if errorlevel 1 (
    echo Git is not installed. Please install Git from https://git-scm.com/downloads
    goto end
)
echo.

REM Initialize Git repository if not already initialized
if not exist ".git" (
    echo 2. Initializing Git repository...
    git init
    echo.
)

REM Add all files
echo 3. Adding files to repository...
git add .
echo.

REM Commit changes
echo 4. Committing changes...
git commit -m "Add multiple card designs with scratch effects and enlargement feature"
echo.

REM Add remote repository
echo 5. Adding remote repository...
git remote add origin https://github.com/sawai39/Birthday-Gift 2>NUL
echo.

REM Verify remote
echo 6. Verifying remote repository...
git remote -v
echo.

REM Push to remote
echo 7. Pushing to GitHub...
git push -u origin main
echo.

echo =====================================
echo Process completed!
echo =====================================
echo.
echo If you encountered any errors, please check the output above.
echo For authentication issues, make sure you have the correct GitHub credentials.

:end
pause