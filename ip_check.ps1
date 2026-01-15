Write-Output "===== IP Discovery (Windows) ====="
Write-Output ("Hostname: {0}" -f $env:COMPUTERNAME)
Write-Output ("Date: {0}" -f (Get-Date))

# Local IPs excluding loopback
try {
  $ips = Get-NetIPAddress | Where-Object { $_.IPAddress -and $_.AddressFamily -eq 'IPv4' -and $_.IPAddress -ne '127.0.0.1' } | Select-Object -ExpandProperty IPAddress
  Write-Output "Local IPv4 addresses:"
  $ips | ForEach-Object { Write-Output $_ }
} catch {
  Write-Output "Get-NetIPAddress failed: $($_.Exception.Message)"
}

# Public IP via web service
try {
  $publicIp = (Invoke-RestMethod -Uri "https://ifconfig.me/ip" -TimeoutSec 5)
  Write-Output ("Public IP: {0}" -f $publicIp)
} catch {
  Write-Output "Public IP fetch failed"
}

Write-Output "===== End ====="
