@echo off

REM Check if Git is installed
git --version > git_output.txt 2>&1
if errorlevel 1 (
    echo Git is not installed. Please install Git and try again. >> git_output.txt
    goto end
)

REM Initialize Git repository if not already initialized
if not exist ".git" (
    echo Initializing Git repository... >> git_output.txt
    git init >> git_output.txt 2>&1
)

REM Add all files
echo Adding files... >> git_output.txt
git add . >> git_output.txt 2>&1

REM Commit changes
echo Committing changes... >> git_output.txt
git commit -m "Add multiple card designs with scratch effects and enlargement feature" >> git_output.txt 2>&1

REM Check remote repositories
echo Checking remote repositories... >> git_output.txt
git remote -v >> git_output.txt 2>&1

echo.
echo To push to a remote repository, run:
echo git remote add origin [YOUR_REPOSITORY_URL]
echo git push -u origin main
echo.
echo Done! Check git_output.txt for details.

:end
pause