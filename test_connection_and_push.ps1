# Test network connection to GitHub
Write-Output "Testing connection to GitHub..." | Out-File -FilePath network_test.txt -Append
Test-Connection github.com -Count 4 | Out-File -FilePath network_test.txt -Append

# Test HTTPS connection to GitHub
Write-Output "\nTesting HTTPS connection to GitHub..." | Out-File -FilePath network_test.txt -Append
try {
    $response = Invoke-WebRequest -Uri "https://github.com" -UseBasicParsing
    Write-Output "HTTPS connection successful. Status code: $($response.StatusCode)" | Out-File -FilePath network_test.txt -Append
} catch {
    Write-Output "HTTPS connection failed: $($_.Exception.Message)" | Out-File -FilePath network_test.txt -Append
}

# Try to push to GitHub
Write-Output "\nTrying to push to GitHub..." | Out-File -FilePath network_test.txt -Append
try {
    git remote -v | Out-File -FilePath network_test.txt -Append
    git push -u origin main 2>&1 | Out-File -FilePath network_test.txt -Append
} catch {
    Write-Output "Push failed: $($_.Exception.Message)" | Out-File -FilePath network_test.txt -Append
}

Write-Output "\nDone! Check network_test.txt for results." | Out-File -FilePath network_test.txt -Append