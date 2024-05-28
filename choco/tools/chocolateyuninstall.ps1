$ErrorActionPreference = 'Stop'

$packageName = 'healthcheck'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir 'healthcheck.exe'

# Remove the binary from the tools directory
Write-Host "Removing $exePath"
if (Test-Path $exePath) {
   Remove-Item -Path $exePath -Force
} else {
   Write-Host "$exePath does not exist."
}

# Remove from PATH
Write-Host "Uninstalling $packageName from PATH"
Uninstall-BinFile -Name 'healthcheck'

Write-Host "$packageName has been uninstalled."