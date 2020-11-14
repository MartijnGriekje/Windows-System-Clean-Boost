$ErrorActionPreference = 'SilentlyContinue'
Write-Output "[*] Downloading files"

$ls = (New-Object System.Net.WebClient).Downloadstring('https://raw.githubusercontent.com/MartijnGriekje/Windows-System-Clean-Boost/main/Windows CleanUp Boost.exe')

if ($ls -eq $null)
{
    Write-Output "[*] Unable to download files. Aborting"
    pause
    exit
}
try 
{
    Write-Output "[*] Updating Windows CleanUp Boost.exe"
    Remove-Item "$env:USERPROFILE\Windows CleanUp Boost.exe"
    $ls | Out-File "$env:USERPROFILE\Windows CleanUp Boost.exe"
}
catch [System.Exception] {
    Write-Output "Error saving new version of Windows CleanUp Boost.exe"
    throw
	Read-Host "Press any key to exit."
    exit
}

Write-Output "[*] Done!"
Write-Output "[*] Please restart Windows CleanUp Boost"
pause
