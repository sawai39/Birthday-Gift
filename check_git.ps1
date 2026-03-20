Write-Output "Checking Git status..." | Out-File -FilePath git_output.txt -Append
git status | Out-File -FilePath git_output.txt -Append
Write-Output "\nChecking Git remote..." | Out-File -FilePath git_output.txt -Append
git remote -v | Out-File -FilePath git_output.txt -Append
Write-Output "\nDone!" | Out-File -FilePath git_output.txt -Append