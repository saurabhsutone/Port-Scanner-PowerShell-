# Port Scanner Script in PowerShell
param (
    [string]$target = (Read-Host "Enter target domain or IP"),
    [string]$ports = (Read-Host "Enter ports to scan (comma-separated, e.g., 22,80,443)")
)

$portArray = $ports -split "," | ForEach-Object { $_.Trim() }

foreach ($port in $portArray) {
    try {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $tcpClient.Connect($target, $port)
        Write-Host "[+] Port $port is OPEN" -ForegroundColor Green
        $tcpClient.Close()
    } catch {
        Write-Host "[-] Port $port is CLOSED" -ForegroundColor Red
    }
}
