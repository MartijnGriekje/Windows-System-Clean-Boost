#$ErrorActionPreference = 'SilentlyContinue'
Write-Output "[*] Downloading files"
$url = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/WindowsCleanUpBoost.exe"
$output = "$env:USERPROFILE\Desktop\WindowsCleanUpBoost.exe"
$ls = (New-Object System.Net.WebClient).Downloadstring($url)

if ($ls -eq $null)
{
    Write-Output "[*] Unable to download files. Aborting"
    pause
    #exit
}
try 
{
    Write-Output "[*] Updating WindowsCleanUpBoost.exe"
    Remove-Item "$env:USERPROFILE\Desktop\WindowsCleanUpBoost.exe" -Recurse -Force 
    (New-Object System.Net.WebClient).DownloadFile($url, $output)
    #$ls | Out-File "$env:USERPROFILE\Desktop\WindowsCleanUpBoost.exe"
}
catch [System.Exception] {
    Write-Output "Error saving new version of WindowsCleanUpBoost.exe"
    throw
	Read-Host "Press any key to exit."
	pause
    #exit
}

Write-Output "[*] Done!"
Write-Output "[*] Please restart Windows CleanUp Boost"
pause
