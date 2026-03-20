$output = Test-Connection github.com -Count 4
$output | Out-File -FilePath connection_test.txt -Force
Write-Host "Connection test completed. Check connection_test.txt for results."