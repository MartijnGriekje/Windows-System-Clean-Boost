ErrorActionPreference = 'SilentlyContinue'
Write-Output "[*] Downloading files"

$ls = (New-Object System.Net.WebClient).Downloadstring('https://raw.githubusercontent.com/MartijnGriekje/Windows-System-Clean-Boost/main/WindowsCleanupBoost.ps1')

if ($ls -eq $null)
{
    Write-Output "[*] Unable to download files. Aborting"
    pause
    exit
}
try 
{
    Write-Output "[*] Updating WindowsCleanupBoost.ps1"
    Remove-Item "C:\CleanUpAll\WindowsCleanupBoost.ps1"
    $ls | Out-File "C:\CleanUpAll\WindowsCleanupBoost.ps1"
}
catch [System.Exception] {
    Write-Output "Error saving new version of WindowsCleanupBoost.ps1"
    throw
	Read-Host "Press any key to exit."
    exit
}

Write-Output "[*] Done!"
pause
