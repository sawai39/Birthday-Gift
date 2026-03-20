Write-Output "Adding remote repository..." | Out-File -FilePath git_push_output.txt -Append
try {
    git remote add origin https://github.com/sawai39/Birthday-Gift 2>&1 | Out-File -FilePath git_push_output.txt -Append
    Write-Output "\nPushing to remote..." | Out-File -FilePath git_push_output.txt -Append
    git push -u origin main 2>&1 | Out-File -FilePath git_push_output.txt -Append
    Write-Output "\nDone!" | Out-File -FilePath git_push_output.txt -Append
} catch {
    Write-Output "Error: $($_.Exception.Message)" | Out-File -FilePath git_push_output.txt -Append
}