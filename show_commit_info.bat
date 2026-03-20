@echo off
echo === Git Commit Information ===
echo.
echo Last commit:
git log --oneline -1
echo.
echo Commit SHA:
git rev-parse HEAD
echo.
echo === Done ===
pause