@echo off
echo === Pushing to GitHub ===
echo.
echo 1. Checking Git version...
git --version
echo.
echo 2. Initializing Git repository...
git init
echo.
echo 3. Adding files...
git add .
echo.
echo 4. Committing changes...
git commit -m "Add multiple card designs with scratch effects and enlargement feature"
echo.
echo 5. Adding remote repository...
git remote add origin https://github.com/sawai39/Birthday-Gift
echo.
echo 6. Verifying remote...
git remote -v
echo.
echo 7. Pushing to remote...
git push -u origin main
echo.
echo === Done ===
echo Check the output above for any errors.
pause