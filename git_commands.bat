@echo off
echo Checking Git version...
git --version
echo.
echo Initializing Git repository...
git init
echo.
echo Adding files...
git add .
echo.
echo Committing changes...
git commit -m "Add multiple card designs with scratch effects and enlargement feature"
echo.
echo Checking remote repositories...
git remote -v
echo.
echo Done!
pause