# Git Commit and Push Instructions

## Step 1: Check if Git is Installed
Open a command prompt or PowerShell and run:
```
git --version
```

## Step 2: Initialize Git Repository (if not already done)
```
git init
```

## Step 3: Add All Files
```
git add .
```

## Step 4: Commit Changes
```
git commit -m "Add multiple card designs with scratch effects and enlargement feature"
```

## Step 5: Add Remote Repository
```
git remote add origin [YOUR_REPOSITORY_URL]
```
Replace `[YOUR_REPOSITORY_URL]` with your actual repository URL (e.g., https://github.com/username/repo.git).

## Step 6: Push to Remote
```
git push -u origin main
```

## Troubleshooting
- If you get an error about "main" not existing, try using "master" instead.
- If you get an error about not being able to push, make sure you have the correct permissions for the repository.
- If Git is not installed, download and install it from https://git-scm.com/downloads.