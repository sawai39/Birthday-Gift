# Check if Git is installed
Write-Output "Checking if Git is installed..."
$gitVersion = git --version 2>&1
Write-Output "Git version: $gitVersion"

# Check if repository is initialized
Write-Output "\nChecking if repository is initialized..."
if (Test-Path ".git") {
    Write-Output "Repository is initialized"
} else {
    Write-Output "Repository is not initialized. Initializing..."
    git init
}

# Check current branch
Write-Output "\nChecking current branch..."
$currentBranch = git branch --show-current 2>&1
Write-Output "Current branch: $currentBranch"

# Check status
Write-Output "\nChecking git status..."
git status

# Add remote
Write-Output "\nAdding remote repository..."
git remote add origin https://github.com/sawai39/Birthday-Gift 2>&1

# Check remote
Write-Output "\nChecking remote repositories..."
git remote -v

# Push to remote
Write-Output "\nPushing to remote..."
git push -u origin main 2>&1

Write-Output "\nDone!"
