$ErrorActionPreference = 'SilentlyContinue'
Write-Output "[*] Downloading files"
$url = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/WindowsCleanUpBoost.exe"
$output = "$env:USERPROFILE\Desktop\WindowsCleanUpBoost.exe"
$ls = (New-Object System.Net.WebClient).Downloadstring($url)

if ($ls -eq $null)
{
    Write-Output "[*] Unable to download files. Aborting"
    pause
    exit
}
try 
{
    Write-Output "[*] Updating WindowsCleanUpBoost.exe"
    If (Get-Process -Name WindowsCleanUpBoost){
    Stop-Process -Name WindowsCleanUpBoost -Force}
    Remove-Item "$env:USERPROFILE\Desktop\WindowsCleanUpBoost.exe" -Force 
    (New-Object System.Net.WebClient).DownloadFile($url, $output)
 }
catch [System.Exception] {
    Write-Output "Error saving new version of WindowsCleanUpBoost.exe"
    throw
	Read-Host "Press any key to exit."
    exit
}

Write-Output "[*] Done!"
Write-Output "[*] Please restart Windows CleanUp Boost"
pause
