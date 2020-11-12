# Written By Martijn G.
# 11-09-2020

$ErrorActionPreference = 'SilentlyContinue'
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
[void][System.Reflection.Assembly]::LoadWithPartialName( “Microsoft.VisualBasic”)
[void] [System.Reflection.Assembly]::LoadWithPartialName(“System.Drawing”)
[void] [System.Reflection.Assembly]::LoadWithPartialName(“System.Windows.Forms”)

$version = "1.0"
Clear-Host 
 <## hide the powerhsell console
    Add-Type -Name Window -Namespace Console -MemberDefinition '
    [DllImport("Kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
    '
    $consolePtr = [Console.Window]::GetConsoleWindow()

    [Console.Window]::ShowWindow($consolePtr, 0) # hide
#>
$defaultValue = “”

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(869,760)
$Form.text                       = "Windows System Clean-Up & Boost"
$Form.TopMost                    = $false

$WinForm1                        = New-Object system.Windows.Forms.Form
$WinForm1.ClientSize             = New-Object System.Drawing.Point(400,400)
$WinForm1.text                   = "Form"
$WinForm1.TopMost                = $false

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Automatic"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(17,18)
$Label1.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))

$RemoveAppx                      = New-Object system.Windows.Forms.Button
$RemoveAppx.text                 = "!Coming Soon!"
$RemoveAppx.width                = 152
$RemoveAppx.height               = 52
$RemoveAppx.location             = New-Object System.Drawing.Point(17,216)
$RemoveAppx.Font                 = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$RemoveAppx.Enabled              = $false

$RestoreAppx                     = New-Object system.Windows.Forms.Button
$RestoreAppx.text                = "Restore Appx"
$RestoreAppx.width               = 152
$RestoreAppx.height              = 52
$RestoreAppx.location            = New-Object System.Drawing.Point(17,290)
$RestoreAppx.Font                = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Optional Fixes and Changes:"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(17,368)
$Label3.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Windows 10 Built-in Apps:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(17,180)
$Label2.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))

$ScanWindows                     = New-Object system.Windows.Forms.Button
$ScanWindows.text                = "Quick Scan Defender"
$ScanWindows.width               = 235
$ScanWindows.height              = 52
$ScanWindows.location            = New-Object System.Drawing.Point(17,586)
$ScanWindows.Font                = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$RemoveOneDrive                  = New-Object system.Windows.Forms.Button
$RemoveOneDrive.text             = "Remove OneDrive"
$RemoveOneDrive.width            = 235
$RemoveOneDrive.height           = 52
$RemoveOneDrive.location         = New-Object System.Drawing.Point(17,492)
$RemoveOneDrive.Font             = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$RemoveRestore                   = New-Object system.Windows.Forms.Button
$RemoveRestore.text              = "Remove Restore Points"
$RemoveRestore.width             = 235
$RemoveRestore.height            = 52
$RemoveRestore.location          = New-Object System.Drawing.Point(17,424)
$RemoveRestore.Font              = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$CleanBoost                      = New-Object system.Windows.Forms.Button
$CleanBoost.text                 = "Clean-Up & Boost"
$CleanBoost.width                = 233
$CleanBoost.height               = 83
$CleanBoost.location             = New-Object System.Drawing.Point(17,57)
$CleanBoost.Font                 = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$CleanBoost.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("#24be45")

$Reboot                          = New-Object system.Windows.Forms.Button
$Reboot.text                     = "Reboot System"
$Reboot.width                    = 146
$Reboot.height                   = 35
$Reboot.Anchor                   = 'right,bottom,left'
$Reboot.location                 = New-Object System.Drawing.Point(17,685)
$Reboot.Font                     = New-Object System.Drawing.Font('Arial',14)

$ProgressBar1                    = New-Object system.Windows.Forms.ProgressBar
$ProgressBar1.width              = 850
$ProgressBar1.height             = 16
$ProgressBar1.value              = 0
$ProgressBar1.Anchor             = 'right,bottom,left'
$ProgressBar1.location           = New-Object System.Drawing.Point(10,733)

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Move Windows Update Folder:"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(355,180)
$Label4.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))

$MoveUpdateFolder                = New-Object system.Windows.Forms.Button
$MoveUpdateFolder.text           = "!Coming Soon!"
$MoveUpdateFolder.width          = 210
$MoveUpdateFolder.height         = 52
$MoveUpdateFolder.location       = New-Object System.Drawing.Point(355,217)
$MoveUpdateFolder.Font           = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$MoveUpdateFolder.Enabled        = $false

$RestoreUpdate                   = New-Object system.Windows.Forms.Button
$RestoreUpdate.text              = "Restore Update Folder"
$RestoreUpdate.width             = 210
$RestoreUpdate.height            = 52
$RestoreUpdate.location          = New-Object System.Drawing.Point(355,290)
$RestoreUpdate.Font              = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$SpaceFreed1                     = New-Object system.Windows.Forms.TextBox
$SpaceFreed1.multiline           = $false
$SpaceFreed1.width               = 163
$SpaceFreed1.height              = 20
$SpaceFreed1.location            = New-Object System.Drawing.Point(590,72)
$SpaceFreed1.Font                = New-Object System.Drawing.Font('Arial',14)
$SpaceFreed1.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#7ed321")

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Space Cleared:"
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(451,76)
$Label5.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))

$SpaceFreed                      = New-Object system.Windows.Forms.MaskedTextBox
$SpaceFreed.multiline            = $false
$SpaceFreed.width                = 194
$SpaceFreed.height               = 33
$SpaceFreed.location             = New-Object System.Drawing.Point(589,110)
$SpaceFreed.Font                 = New-Object System.Drawing.Font('Arial',14)

$CancelButton                    = New-Object system.Windows.Forms.Button
$CancelButton.text               = "Cancel"
$CancelButton.width              = 146
$CancelButton.height             = 35
$CancelButton.Anchor             = 'right,bottom,left'
$CancelButton.location           = New-Object System.Drawing.Point(658,685)
$CancelButton.Font               = New-Object System.Drawing.Font('Arial',14)
$CancelButton.DialogResult       = [System.Windows.Forms.DialogResult]::Cancel
$CancelButton.Add_Click({$objForm.Close()})

$Feed                            = New-Object system.Windows.Forms.RichTextBox
$Feed.multiline                  = $true
$Feed.width                      = 475
$Feed.height                     = 267
$Feed.Anchor                     = 'right,bottom,left'
$Feed.location                   = New-Object System.Drawing.Point(329,368)
$Feed.Font                       = New-Object System.Drawing.Font('Consolas',10)
$Feed.ScrollBars                 = “Vertical”
$Feed.ReadOnly                   = $true 

$InputBox                        = New-Object system.Windows.Forms.TextBox
$InputBox.multiline              = $false
$InputBox.Text                   = $defaultValue
$InputBox.width                  = 475
$InputBox.height                 = 20
$InputBox.Anchor                 = 'right,bottom,left'
$InputBox.location               = New-Object System.Drawing.Point(329,646)
$InputBox.Font                   = New-Object System.Drawing.Font('Arial',14)
$InputBox.AcceptsReturn          = $true

$x = @()
$OKButton                        = New-Object system.Windows.Forms.Button
$OKButton.text                   = "OK"
$OKButton.width                  = 146
$OKButton.height                 = 35
$OKButton.Anchor                 = 'right,bottom,left'
$OKButton.location               = New-Object System.Drawing.Point(496,685)
$OKButton.Font                   = New-Object System.Drawing.Font('Arial',14)
#$OKButton.DialogResult           = [System.Windows.Forms.DialogResult]::OK
$OKButton.Enabled                = $false 
$OKButton.Add_Click({$x +=@(TextToArray)})

$Form.controls.AddRange(@($Label1,$RemoveAppx,$RestoreAppx,$Label3,$Label2,$ScanWindows,$RemoveOneDrive,$RemoveRestore,$CleanBoost,$Reboot,$ProgressBar1,$Label4,$MoveUpdateFolder,$RestoreUpdate,$SpaceFreed1,$Label5,$SpaceFreed,$CancelButton,$Feed,$InputBox,$OKButton))


<#$Updates = "Windows Updates are finished?"
#Prompt asking if you'd like to reboot your machine
$Prompt1 = [Windows.MessageBox]::Show($Updates, "Windows Update", $Button, $Warn)
        Switch ($Prompt1) {
            Yes {
             
            }
            No {
                Add-OutputBoxLine -Message "==> Please wait until Windows Updates are finished and restart this script." 
                Start-Sleep 3
                Exit
            }
            Cancel {
                Exit
            }
        }
#>

Function Add-OutputBoxLine {
    Param ($Message)
    $Feed.SelectionColor = 'black'
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
}

Function Add-OutputBoxLine-Red {
    Param ($Message)
    $Feed.SelectionColor = 'red'
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
}

Function Add-OutputBoxLine-Blue {
    Param ($Message)
    $Feed.SelectionColor = 'Blue'
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
}

Function Add-OutputBoxLine-Green {
    Param ($Message)
    $Feed.SelectionColor = 'Green'
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
}


#Get data from text box and assigned to an array

function TextToArray{

       $returndata = @()

       $txtboxdata = New-Object System.IO.StringReader($InputBox.Text)

       $Linedata = $txtboxdata.readline()

       while ($Linedata -ne $null)

           {

               $returndata += @($Linedata)

               $Linedata = $txtboxdata.readline()

           }

       $InputBox.Clear()

       $txtboxdata.dispose()

       return $returndata

}



Add-OutputBoxLine-Blue -Message "==============================================================="
Add-OutputBoxLine-Blue -Message "|       Welcome to System CleanUp and Boost Ver. 2.0.0(Beta)  |"
Add-OutputBoxLine-Blue -Message "|                                                             |"
Add-OutputBoxLine-Blue -Message "|       Made by Martijn G.                                    |"
Add-OutputBoxLine-Blue -Message "==============================================================="

Add-OutputBoxLine -Message "==> Checking to make sure you have Local Admin rights..." 
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
Add-OutputBoxLine -Message "Please run this script as an Administrator!"
If (!($psISE)){"Press any key to continueâ€¦";[void][System.Console]::ReadKey($true)}
Exit 1
else{ Add-OutputBoxLine -Message "You are an Adimistrator!"}
}


#Add-OutputBoxLine -Message "==> Capture current free disk space on Drive C..."  
$FreespaceBefore = (Get-WmiObject win32_logicaldisk -filter "DeviceID='C:'" | select Freespace).FreeSpace/1GB

#Optional fixes/cleans:
Function Uninstall-OneDrive {

    Add-OutputBoxLine -Message "==> Checking for pre-existing files and folders located in the OneDrive folders..." 
    Start-Sleep 1
    If (Test-Path "$env:USERPROFILE\OneDrive\*") {
        Add-OutputBoxLine -Message "==> Files found within the OneDrive folder! Checking to see if a folder named OneDriveBackupFiles exists." 
        Start-Sleep 1
              
        If (Test-Path "$env:USERPROFILE\Desktop\OneDriveBackupFiles") {
            Add-OutputBoxLine -Message "==> A folder named OneDriveBackupFiles already exists on your desktop." 
            Add-OutputBoxLine -Message "==> All files from your OneDrive location will be moved to that folder." 
        }
        else {
            If (!(Test-Path "$env:USERPROFILE\Desktop\OneDriveBackupFiles")) {
                Add-OutputBoxLine -Message "==> A folder named OneDriveBackupFiles will be created and will be located on your desktop." 
                Add-OutputBoxLine -Message "==> All files from your OneDrive location will be located in that folder." 
                New-item -Path "$env:USERPROFILE\Desktop" -Name "OneDriveBackupFiles"-ItemType Directory -Force
                Add-OutputBoxLine -Message "==> Successfully created the folder 'OneDriveBackupFiles' on your desktop." 
            }
        }
        Start-Sleep 1
        Move-Item -Path "$env:USERPROFILE\OneDrive\*" -Destination "$env:USERPROFILE\Desktop\OneDriveBackupFiles" -Force
        Add-OutputBoxLine -Message "==> Successfully moved all files/folders from your OneDrive folder to the folder 'OneDriveBackupFiles' on your desktop." 
        Start-Sleep 1
        Add-OutputBoxLine -Message "==> Proceeding with the removal of OneDrive." 
        Start-Sleep 1
    }
    Else {
        Add-OutputBoxLine -Message "==> Either the OneDrive folder does not exist or there are no files to be found in the folder. Proceeding..." 
        Start-Sleep 1
        Add-OutputBoxLine -Message "==> Enabling the Group Policy 'Prevent the usage of OneDrive for File Storage'." 
        $OneDriveKey = 'HKLM:Software\Policies\Microsoft\Windows\OneDrive'
        If (!(Test-Path $OneDriveKey)) {
            Mkdir $OneDriveKey
            Set-ItemProperty $OneDriveKey -Name OneDrive -Value DisableFileSyncNGSC
        }
        Set-ItemProperty $OneDriveKey -Name OneDrive -Value DisableFileSyncNGSC
    }

Add-OutputBoxLine -Message "==> Uninstalling OneDrive. Please wait..." 
    
    New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
    $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
    $ExplorerReg1 = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
    $ExplorerReg2 = "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
	Stop-Process -Name "OneDrive*"
	Start-Sleep 2
	If (!(Test-Path $onedrive)) {
		$onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
	}
	Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
	Start-Sleep 2
    Add-OutputBoxLine -Message "==> Stopping explorer..." 
    Start-Sleep 1
	.\taskkill.exe /F /IM explorer.exe
	Start-Sleep 3
    Add-OutputBoxLine -Message "==> Removing leftover files..." 
	If (Test-Path "$env:USERPROFILE\OneDrive") {
            Remove-Item "$env:USERPROFILE\OneDrive" -Force -Recurse
        }
        If (Test-Path "$env:LOCALAPPDATA\Microsoft\OneDrive") {
            Remove-Item "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse
        }
        If (Test-Path "$env:PROGRAMDATA\Microsoft OneDrive") {
            Remove-Item "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse
        }
        If (Test-Path "$env:SYSTEMDRIVE\OneDriveTemp") {
            Remove-Item "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse
        }
        Add-OutputBoxLine -Message "==> Removing OneDrive from windows explorer"
        If (!(Test-Path $ExplorerReg1)) {
            New-Item $ExplorerReg1
        }
        Set-ItemProperty $ExplorerReg1 System.IsPinnedToNameSpaceTree -Value 0 
        If (!(Test-Path $ExplorerReg2)) {
            New-Item $ExplorerReg2
        }
        Set-ItemProperty $ExplorerReg2 System.IsPinnedToNameSpaceTree -Value 0
        Add-OutputBoxLine -Message "==> Restarting Explorer that was shut down before."
        Start-Process explorer.exe -NoNewWindow
        Add-OutputBoxLine-Green -Message "==> OneDrive has been successfully uninstalled!"
        
        Remove-item env:OneDrive
  
    
}

Function Delete-ComputerRestorePoints{
[CmdletBinding(SupportsShouldProcess=$True)]param(
[Parameter(
Position=0,
Mandatory=$true,
ValueFromPipeline=$true
)]
$restorePoints
)
begin{
$fullName="SystemRestore.DeleteRestorePoint"
#check if the type is already loaded
$isLoaded=([AppDomain]::CurrentDomain.GetAssemblies() | foreach {$_.GetTypes()} | where {$_.FullName -eq $fullName}) -ne $null
if (!$isLoaded){
$SRClient= Add-Type -memberDefinition @"
[DllImport ("Srclient.dll")]
public static extern int SRRemoveRestorePoint (int index);
"@ -Name DeleteRestorePoint -NameSpace SystemRestore -PassThru
}
}
process{
foreach ($restorePoint in $restorePoints){
if($PSCmdlet.ShouldProcess("$($restorePoint.Description)","Deleting Restorepoint")) {
[SystemRestore.DeleteRestorePoint]::SRRemoveRestorePoint($restorePoint.SequenceNumber)
}
}
}

}
          
Function Appx-Remove {
Add-OutputBoxLine -Message "==> Uninstall Windows 10 Built-in Apps..." 

# Disable Windows Store Automatic Updates
            $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"
            If (!(Test-Path $registryPath)) {
                Mkdir $registryPath
                New-ItemProperty $registryPath AutoDownload -Value 2 
            }
            Set-ItemProperty $registryPath AutoDownload -Value 2

            #Stop WindowsStore Installer Service and set to Disabled
            Add-OutputBoxLine -Message "==> Stopping InstallService" 
            Stop-Service InstallService
            Add-OutputBoxLine -Message "==> Setting InstallService Startup to Disabled" 
            Set-Service InstallService -StartupType Disabled

#Setting Mixed Reality Portal value to 0 so that you can uninstall it in Settings"
    $Holo = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic'    
    If (Test-Path $Holo) {
        New-ItemProperty $Holo -Name 'FirstRunSucceeded' -PropertyType DWord -Value '0' -Force
    }

$AppX = @(
        "Microsoft.549981C3F5F10",
        "Microsoft.3dbuilder",
        "Microsoft.BingNews",
        "Microsoft.Bingsports",
        "Microsoft.Bingfinance",
        "Microsoft.GetHelp",
        "Microsoft.Getstarted",
        "Microsoft.Messaging",
        "Microsoft.Microsoft3DViewer",
        "Microsoft.MicrosoftOfficeHub",
        "Microsoft.MicrosoftSolitaireCollection"
        "Microsoft.MicrosoftSkydrive",
        "Microsoft.MixedReality.Portal",
        "Microsoft.NetworkSpeedTest",
        "Microsoft.News",
        "Microsoft.Office.Lens",
        "Microsoft.Office.OneNote",
        "Microsoft.Office.Sway",
        "Microsoft.OneConnect",
        "Microsoft.People",
        "Microsoft.Print3D",
        "Microsoft.PPIProjection",
        "Microsoft.RemoteDesktop",
        "Microsoft.SkypeApp",
        #"Microsoft.StorePurchaseApp",
        "Microsoft.Office.Todo.List",
        'Microsoft.Wallet',
        "Microsoft.Whiteboard",
        "Microsoft.WindowsAlarms",
        #"Microsoft.WindowsCamera",
        "Microsoft.windowscommunicationsapps",
        "Microsoft.WindowsFeedbackHub",
        "Microsoft.WindowsMaps",
        "Microsoft.WindowsScan",
        "Microsoft.WindowsSoundRecorder",
        "Microsoft.WindowsPhone",
        "Microsoft.Xbox.TCUI",
        "Microsoft.XboxApp",
        "Microsoft.XboxOneSmartGlass",
        "Microsoft.XboxGameOverlay",
        "Microsoft.XboxGamingOverlay",
        "Microsoft.XboxGameCallableUI",
        "Microsoft.XboxIdentityProvider",
        "Microsoft.XboxSpeechToTextOverlay",
        "Microsoft.ZuneMusic",
        "Microsoft.ZuneVideo"

        "*Appconnector*",
        "*EclipseManager*"
        "*ActiproSoftwareLLC*"
        "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
        "*Duolingo-LearnLanguagesforFree*"
        "*dragonmania*"
        "*hiddencity*",
        "*PandoraMediaInc*"
        "*cookingfever*",
        "*CandyCrush*"
        "*BubbleWitch3Saga*"
        "*Wunderlist*"
        "*Flipboard*"
        "*Twitter*"
        "*Facebook*"
        "*Spotify*"
        "*Minecraft*"
        "*Royal Revolt*"
        "*Sway*"
        "*Speed Test*"
        "*Dolby*"
        "*CandyCrushSaga*",
        "*CandyCrushSodaSaga*",
        "*ContactSupport*",
        "*CommsPhone*",
        "*DrawboardPDF*",
        "*Empires*"
        
                )
foreach ($App in $AppX) {
    $ProgressPreference = 'SilentlyContinue'
    if (Get-Appxpackage -allusers $App) {
    Get-Appxpackage -Allusers $App | Remove-AppxPackage 
    Get-AppxProvisionedPackage -Online $App | Remove-AppxProvisionedPackage -Online -Allusers
    Add-OutputBoxLine -Message "Trying to remove $App." }
}
Add-OutputBoxLine-Green -Message "==> Successfully removed Windows 10 Built-in Apps" 
}

Function Appx-Restore{
Add-OutputBoxLine -Message "==> Restoring Windows 10 Built-in Apps..." 
Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
Add-OutputBoxLine-Green -Message "==> Successfully restored Windows 10 Built-in App" 
}

Function Junction-Updatefolder{
Add-OutputBoxLine -Message $x
if ((Get-Item -Path "$env:windir\SoftwareDistribution\" -Force).LinkType -ne "Junction") {
Start-Service wuauserv 

$Getvolume = Get-Volume | Where-Object FileSystemType -ne Unknown | Where-Object DriveLetter -ne $Null| Select-Object -Property Driveletter, FriendlyName,  FileSystemType, SizeRemaining |Sort-Object -Property Driveletter | Format-Table -AutoSize | Out-String 
Add-OutputBoxLine($Getvolume)

$diskletter = "."
$lettercheck = $false
$NTFScheck = $false


Add-OutputBoxLine -Message "==> Set DiskLetter for new location Windows update folder"

$InputBox.Add_TextChanged({
$OKButton.Enabled = $false 
if ($InputBox.Text.Trim() -ne ''){
$OKButton.Enabled = $true }
  })
$x = @()
$OKButton.Add_Click({$x +=@(TextToArray)})


Add-OutputBoxLine -Message $x

Add-OutputBoxLine -Message $diskletter
pause


if (Get-Volume | Where-Object Driveletter -EQ $diskletter | Where-Object FileSystemType -NE Unknown) {
{$lettercheck = $true} 
else {

Add-OutputBoxLine -Message "No Drive found"
}
}



<#Do {
    $diskletter
    #$diskletter = Read-Host
    if (Get-Volume | Where-Object Driveletter -EQ $diskletter | Where-Object FileSystemType -NE Unknown) 
    {$lettercheck = $true} else {Add-OutputBoxLine -Message "No Drive found" -ForegroundColor Red}
    if (Get-Volume -DriveLetter ${diskletter}  | Where-Object FileSystemType -eq NTFS) 
    {$NTFScheck = $true} elseif ($lettercheck -eq $true) {Add-OutputBoxLine -Message "No NTFS FileType, Please Format to NTFS or choose other Drive" -ForegroundColor Red}
  }until (($lettercheck -eq $true) -and ($NTFScheck -eq $true))
#>
if ($lettercheck -eq $true -and $NTFScheck -eq $true){
Add-OutputBoxLine -Message "==> DriveLetter is set to: "$diskletter"" 
Start-Sleep 2
pause

Stop-Service wuauserv -Force -Verbose
Stop-Service UsoSvc -Force -Verbose
Stop-Service cryptSvc -Force -Verbose
Stop-Service BITS -Force -Verbose
Stop-Service msiserver -Force -Verbose
robocopy C:\Windows\SoftwareDistribution "${diskletter}:\NewWindowsUpdateFolder\" /copyall /e
Remove-Item -Path "$env:windir\SoftwareDistribution\" -Force -Recurse
New-Item -ItemType Junction -Path "C:\Windows\SoftwareDistribution" -Target "${diskletter}:\NewWindowsUpdateFolder\"
Start-Service wuauserv -Verbose
Start-Service UsoSvc -Verbose
Start-Service cryptSvc -Verbose
Start-Service BITS -Verbose
Start-Service msiserver -Verbose
}
}
Add-OutputBoxLine-Green -Message "==> Successfully moved Windows Update Folder" 
}

Function Restore-Updatefolder {
Add-OutputBoxLine -Message "==> Restoring Windows Update folder..." 
Stop-Service wuauserv -Force -Verbose
Stop-Service TrustedInstaller -Force -Verbose
Remove-Item -Path "$env:windir\SoftwareDistribution\" -Recurse -Force
Start-Service wuauserv -Verbose
Start-Service TrustedInstaller -Verbose
Add-OutputBoxLine -Message "==> Successfully restored Windows Update folder" 
}

Function QuickScan-Defender {
Add-OutputBoxLine -Message "==> Running QuickScan..."
Update-MpSignature
Start-MpScan -ScanType QuickScan
Add-OutputBoxLine-Green -Message "==> QuickScan Finished"  }

Function Reboot-System {
Remove-PSDrive HKCR 
Start-Sleep 1
Add-OutputBoxLine -Message "==> Initiating reboot." 
Stop-Transcript
Start-Sleep 2
Restart-Computer
}

#Clean-up & Boost:
  
Function Disable-Services {
Add-OutputBoxLine -Message "==> Disable Services..." 
$services = @(
    # See https://virtualfeller.com/2017/04/25/optimize-vdi-windows-10-services-original-anniversary-and-creator-updates/

    # Connected User Experiences and Telemetry
    'DiagTrack',

    # Data Usage service
    'DusmSvc',

    # AllJoyn Router Service (IoT)
    'AJRouter',

    # SSDP Discovery (UPnP)
    'SSDPSRV',
    'upnphost',

    # Superfetch
    'SysMain',

    # http://www.csoonline.com/article/3106076/data-protection/disable-wpad-now-or-have-your-accounts-and-private-data-compromised.html
    'iphlpsvc',
    
    # Black Viper 'Safe for DESKTOP' services.
    # See http://www.blackviper.com/service-configurations/black-vipers-windows-10-service-configurations/
    'tzautoupdate',
    'AppVClient',
    'RemoteRegistry',
    'RemoteAccess',
    'shpamsvc',
    'SCardSvr',
    'UevAgentService',
    'ALG',
    'PeerDistSvc',
    'NfsClnt',
    'dmwappushservice',
    'MapsBroker',
    'lfsvc',
    'HvHost',
    'vmickvpexchange', 
    'vmicguestinterface',
    'vmicshutdown',
    'vmicheartbeat',
    'vmicvmsession',
    'vmicrdv',
    'vmictimesync',
    'vmicvss',
    'irmon',
    'SharedAccess',
    'MSiSCSI',
    'SmsRouter',
    'sedsvc',
    'CscService',
    'SEMgrSvc',
    'PhoneSvc',
    'RpcLocator',
    'RetailDemo',
    'SensorDataService',
    'SensrSvc',
    'SensorService',
    'ScDeviceEnum',
    'SCPolicySvc',
    'SNMPTRAP',
    'TabletInputService',
    'WFDSConSvc',
    'FrameServer',
    'wisvc',
    'icssvc',
    'WinRM',
    'WwanSvc',
    'WSearch',
    'XboxGipSvc',
    'XblAuthManager',
    'XblGameSave',
    'XboxNetApiSvc'
)


foreach ($service in $services) {
    if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Disabled"})){ 
    Stop-Service $service -Force -Verbose
    Set-Service $service -StartupType Disabled -Verbose}
}
}

Function Disable-Features {

Add-OutputBoxLine -Message '==> Disabling optional features...' 
$features = @(
    'MediaPlayback',
    'SMB1Protocol',
    'Xps-Foundation-Xps-Viewer',
    'WorkFolders-Client',
    'WCF-Services45',
    'NetFx4-AdvSrvs',
    'Printing-Foundation-Features',
    #'Printing-PrintToPDFServices-Features',
    'Printing-XPSServices-Features',
    'MSRDC-Infrastructure',
    'MicrosoftWindowsPowerShellV2Root',
    'Internet-Explorer-Optional-amd64',
    'Microsoft-Hyper-V-All',
    'Microsoft-Hyper-V',
    'Microsoft-Hyper-V-Tools-All',
    'Microsoft-Hyper-V-Management-PowerShell',
    'Microsoft-Hyper-V-Hypervisor',
    'Microsoft-Hyper-V-Services',
    'Microsoft-Hyper-V-Management-Clients'
    'HypervisorPlatform'
    'Internet-Explorer-Optional-amd64'
)
foreach ($feature in $features) {
    if((Get-WindowsOptionalFeature -FeatureName $feature -Online).State -eq "Enabled"){
    Disable-WindowsOptionalFeature -Online -FeatureName $feature -NoRestart
    }            
}
}

Function Disable-Tasks {
Add-OutputBoxLine -Message "==> Disabling Tasks..." 
$tasks = @(
    'XblGameSaveTaskLogon',
    'XblGameSaveTask',
    'Consolidator',
    'UsbCeip',
    'DmClient',
    'DmClientOnScenarioDownload',
    'Windows Defender Scheduled Scan',
    'shell'
)
foreach ($task in $tasks) {
    if((Get-ScheduledTask | Where-Object {$_.TaskName -like $task}) -and (Get-ScheduledTask -TaskName $task).State -eq "Ready"){
    Get-ScheduledTask -TaskName $task | Disable-ScheduledTask
    } 
}

#Get-ScheduledTask -TaskPath "\Microsoft\Windows\rempl" -TaskName "shell" | Disable-ScheduledTask 
}

Function Defrag-Schedule{
Add-OutputBoxLine -Message "==> Enable Defrag Monthly Schedule" 
$TASK_CREATE_OR_UPDATE = 6
$TASK_TRIGGER_MONTHLY = 4
$ALL_MONTHS = 0xFFF

$computerName = "localhost"
$taskName = "\Microsoft\Windows\Defrag\ScheduledDefrag"
$taskService = new-object -comobject "Schedule.Service"
$taskService.Connect($computerName)
$taskFolder = $taskService.GetFolder("\")
$registeredTask = $taskFolder.GetTask($taskName)
$registeredTask.Enabled = $TRUE
$taskDefinition = $registeredTask.Definition
$triggerCollection = $taskDefinition.Triggers
$triggerCollection.Clear()
$monthlyTrigger = $triggerCollection.Create($TASK_TRIGGER_MONTHLY)
$monthlyTrigger.DaysOfMonth = 1
$monthlyTrigger.Enabled = $TRUE
$monthlyTrigger.Id = "DefragMonthlyTrigger"
$monthlyTrigger.MonthsOfYear = $ALL_MONTHS
$monthlyTrigger.StartBoundary = "2011-01-01T04:00:00"
[Void] $taskFolder.RegisterTaskDefinition($taskName, $taskDefinition,
 $TASK_CREATE_OR_UPDATE, $NULL, $NULL, $taskDefinition.Principal.LogonType)
Get-ScheduledTask -TaskName 'ScheduledDefrag' | Enable-ScheduledTask
}

Function Update-Registry{
Add-OutputBoxLine -Message '==> Updating registry settings...' 

# Disables Hibernate file (Hiberfil.sys)
powercfg -h off 
 
# Disables Windows Feedback Experience
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost' -Name 'EnableWebContentEvaluation' -PropertyType DWord -Value '0' -Force 

# Disable some of the "new" features of Windows 10, such as forcibly installing apps you don't want, and the new annoying animation for first time login.
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\' -Name 'CloudContent'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableSoftLanding' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableFirstLogonAnimation' -PropertyType DWord -Value '0' -Force

# Disable Windows Defender submission of samples and reporting.
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\' -Name 'Spynet'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'SpynetReporting' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'SubmitSamplesConsent' -PropertyType DWord -Value '2' -Force

# Disable data collection and telemetry settings.
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -PropertyType String -Value 'Off' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Name 'ShowedToastAtLevel' -Value '1' -Force
reg load HKU\Default_User C:\Users\Default\NTUSER.DAT
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -Value '0' -Force
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Value '0' -Force
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -Value '0' -Force
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEnabled' -Value '0' -Force
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEverEnabled' -Value '0' -Force
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'OemPreInstalledAppsEnabled' -Value '0' -Force
reg unload HKU\Default_User
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\CDPUserSvc' -Name 'Start' -Value '4' -Force
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc' -Name 'Start' -Value '4' -Force
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc'-Name 'Start' -Value '4' -Force

# Set some commonly changed settings for the current user. The interesting one here is "NoTileApplicationNotification" which disables a bunch of start menu tiles.
New-Item -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\' -Name 'PushNotifications'
New-ItemProperty -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'NoTileApplicationNotification' -PropertyType DWord -Value '1' -Force
New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\' -Name 'CabinetState'
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState' -Name 'FullPath' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name 'VisualFXSetting' -PropertyType DWord -Value '2' -Force
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'FontSmoothing' -Value '2' -Force
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name 'HiberbootEnabled' -Value '1' -Force

# Disable Cortana, and disable any kind of web search or location settings.
#New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\' -Name 'Windows Search'
#New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -PropertyType DWord -Value '0' -Force
#New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowSearchToUseLocation' -PropertyType DWord -Value '0' -Force
#New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'DisableWebSearch' -PropertyType DWord -Value '1' -Force
#New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'ConnectedSearchUseWeb' -PropertyType DWord -Value '0' -Force
#New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'BingSearchEnabled' -PropertyType DWord -Value '0' -Force

# Change Explorer home screen back to "This PC"
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -PropertyType DWord -Value '1' -Force

# Change Windows Updates to "Notify to schedule restart"
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'UxOption' -PropertyType DWord -Value '1' -Force

<#
# Disable Cortana
    $Cortana1 = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
    $Cortana2 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
    $Cortana3 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
	If (!(Test-Path $Cortana1)) {
		New-Item $Cortana1
	}
	New-ItemProperty $Cortana1 -Name 'AcceptedPrivacyPolicy' -PropertyType DWord -Value '0' -Force
	If (!(Test-Path $Cortana2)) {
		New-Item $Cortana2
	}
	New-ItemProperty $Cortana2 -Name 'RestrictImplicitTextCollection' -PropertyType DWord -Value '1' -Force
	New-ItemProperty $Cortana2 -Name 'RestrictImplicitInkCollection' -PropertyType DWord -Value '1' -Force
	If (!(Test-Path $Cortana3)) {
		New-Item $Cortana3
	}
	New-ItemProperty $Cortana3 -Name 'HarvestContacts' -PropertyType DWord -Value '0' -Force
#>

# Stops the Windows Feedback Experience from sending anonymous data
    $Period1 = 'HKCU:\Software\Microsoft\Siuf'
    $Period2 = 'HKCU:\Software\Microsoft\Siuf\Rules'
    $Period3 = 'HKCU:\Software\Microsoft\Siuf\Rules\PeriodInNanoSeconds'
    If (!(Test-Path $Period3)) { 
        mkdir $Period1 
        mkdir $Period2 
        mkdir $Period3 
        New-ItemProperty $Period3 -Name 'PeriodInNanoSeconds' -PropertyType DWord -Value '0' -Force
    }

# Disables Wi-fi Sense
    $WifiSense1 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting"
    $WifiSense2 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots"
    $WifiSense3 = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
    If (!(Test-Path $WifiSense1)) {
	    New-Item $WifiSense1
    }
    Set-ItemProperty $WifiSense1 -Name  'Value' -Value '0' -Force
	If (!(Test-Path $WifiSense2)) {
	    New-Item $WifiSense2
    }
    Set-ItemProperty $WifiSense2 -Name  'Value' -Value '0' -Force 
	Set-ItemProperty $WifiSense3 -Name  'AutoConnectAllowedOEM' -Value '0' -Force

# Disabling Location Tracking
    $SensorState = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
    $LocationConfig = "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
    If (!(Test-Path $SensorState)) {
        New-Item $SensorState
    }
    Set-ItemProperty $SensorState -Name 'SensorPermissionState' -Value '0' -Force 
    If (!(Test-Path $LocationConfig)) {
        New-Item $LocationConfig
    }
    Set-ItemProperty $LocationConfig -Name 'Status' -Value '0' -Force  
 
# Removing 3D Objects from explorer 'My Computer' submenu
    $Objects32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
    $Objects64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
    If (Test-Path $Objects32) {
        Remove-Item $Objects32 -Recurse 
    }
    If (Test-Path $Objects64) {
        Remove-Item $Objects64 -Recurse 
    } 

# Disables People icon on Taskbar
    $People = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"    
    If (!(Test-Path $People)) {
        New-Item $People
    }
    Set-ItemProperty $People  PeopleBand -Value 0 

<# Removing CloudStore from registry if it exists !Removes Microsoft settings (Start Tile, Menu etc)!
     $CloudStore = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore'
     If (Test-Path $CloudStore) {
     .\taskkill.exe /F /IM explorer.exe
     Remove-Item $CloudStore -Recurse -Force
     Start-Process -FilePath Explorer.exe -NoNewWindow -Wait
    }     
#>
}

Function Delete-Registry{
Add-OutputBoxLine -Message '==> Delete registry keys...' 
#These are the registry keys that it will delete.            
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT   
$Keys = @(
            
        #Remove Background Tasks
        "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
        "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
        "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
        "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.19041.423.0_neutral_neutral_cw5n1h2txyewy"
            
        #Windows File
        "HKCR:\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            
        #Registry keys to delete if they aren't uninstalled by RemoveAppXPackage/RemoveAppXProvisionedPackage
        "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
        "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
        "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.19041.423.0_neutral_neutral_cw5n1h2txyewy"
                   
        #Scheduled Tasks to delete
        "HKCR:\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
            
        #Windows Protocol Keys
        "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
        "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
        #"HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.19041.423.0_neutral_neutral_cw5n1h2txyewy"
                      
        #Windows Share Target
        "HKCR:\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"

    )
        
    #This writes the output of each key it is removing and also removes the keys listed above.
    ForEach ($Key in $Keys) {
        Write-Output "Removing $Key from registry"
        Remove-Item $Key -Recurse -force      
    }
}

Function DISM-Cleanup{
Add-OutputBoxLine -Message "==> DISM CleanUp..." 
Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /RestoreHealth' -Wait
Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /StartComponentCleanup /ResetBase' -Wait
Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /spsuperseded' -Wait
Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Enable-Feature /FeatureName:NetFx3 /All' -Wait     
}

Function Delete-Rougefolders{
Add-OutputBoxLine -Message "==> Deleting Rouge folders..." 
if (test-path "c:\Config.Msi") {remove-item -Path C:\Config.Msi -force -recurse}
if (test-path "c:\Intel") {remove-item -Path c:\Intel -force -recurse}
if (test-path "c:\PerfLogs") {remove-item -Path c:\PerfLogs -force -recurse}
if (test-path "c:\swsetup") {remove-item -Path c:\swsetup -force -recurse} # HP Software and Driver Repositry
if (test-path $env:windir\memory.dmp) {remove-item $env:windir\memory.dmp -force}
}

Function Delete-WER{
Add-OutputBoxLine -Message "==> Deleting Windows Error Reporting files..." 
if (test-path C:\ProgramData\Microsoft\Windows\WER) {Get-ChildItem -Path C:\ProgramData\Microsoft\Windows\WER -Recurse | Remove-Item -force -recurse}
}

Function Delete-Temp{

Add-OutputBoxLine -Message "==> Removing System and User Temp Files..." 
if(Test-Path -Path "$env:windir\Temp\*"){Remove-Item -Path "$env:windir\Temp\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\minidump\*"){Remove-Item -Path "$env:windir\minidump\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\Prefetch\*"){Remove-Item -Path "$env:windir\Prefetch\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Temp\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WER\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WER\*" -Force -Recurse} 
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Temporary Internet Files\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Force -Recurse} 
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IECompatCache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IECompatCache\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IEDownloadHistory\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IEDownloadHistory\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCookies\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCookies\*" -Force -Recurse} 
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Terminal Server Client\Cache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Terminal Server Client\Cache\*" -Force -Recurse} 
if(Test-Path -Path "C:\ServiceProfiles\LocalService\AppData\Local\Temp\*"){Remove-Item -Path "C:\ServiceProfiles\LocalService\AppData\Local\Temp\*" -Force -Recurse}
if(Test-Path -Path "C:\ProgramData\Microsoft\Windows\WER\ReportQueue\*"){Remove-Item -Path "C:\ProgramData\Microsoft\Windows\WER\ReportQueue\*" -Force -Recurse} 
if(Test-Path -Path "C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*"){Remove-Item -Path "C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*" -Force -Recurse} 
if(Test-Path -Path "C:\Program Files\rempl") {Remove-Item -Path "C:\Program Files\rempl" -Force -Recurse }
if(Test-path -Path "C:\Program Files\Downloaded Program Files\") {Remove-Item -Path "C:\Program Files\Downloaded Program Files" -Force -Recurse }
Get-ChildItem "C:\inetpub\logs\LogFiles\*" -Recurse -Force | Where-Object { ($_.CreationTime -le $(Get-Date).AddDays(-60)) } | Remove-Item -Force -Recurse
}

Function Delete-Updatedownloads{

Add-OutputBoxLine -Message "==> Removing Windows Updates Downloads..." 
Stop-Service wuauserv -Force -Verbose
Stop-Service TrustedInstaller -Force -Verbose
Get-ChildItem -Path "$env:windir\SoftwareDistribution\" -Exclude "DataStore" | Remove-Item -force -recurse
Remove-Item -Path "$env:windir\SoftwareDistribution\DataStore\Logs" -force -recurse
Remove-Item -Path "$env:windir\Logs\CBS\*" -force -recurse
Start-Service wuauserv -Verbose
Start-Service TrustedInstaller -Verbose
}

Function Delete-Volumeshadow{

Add-OutputBoxLine -Message "==> Removing Volume Shadow..." -ForegroundColor 'Yellow'
Start-Process -FilePath 'vssadmin.exe' -ArgumentList 'Delete Shadows /All /force' -Wait
}

Function Clear-Cache{

Add-OutputBoxLine -Message "==> Clearing Cache..." 
## Initialize the CCM resource manager com object
[__comobject]$CCMComObject = New-Object -ComObject 'UIResource.UIResourceMgr'

## Get the CacheElementIDs to delete
$CacheInfo = $CCMComObject.GetCacheInfo().GetCacheElements()

## Remove cache items
ForEach ($CacheItem in $CacheInfo) {
$null = $CCMComObject.GetCacheInfo().DeleteCacheElement([string]$($CacheItem.CacheElementID))
}

#Clear Caches (3rd Party)
#Mozilla Firefox
if ($firefox = Get-process | Where-Object {$_.Name -like 'Firefox'})
{
Add-OutputBoxLine-Red -Message "==> Please close Mozilla Firefox..." 
$firefox.WaitForExit()
else{
if (Test-Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles"){
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*.*" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.*" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\*" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite" -Recurse -Force
}
}
}
#Google Chrome
if ($chrome = Get-process | Where-Object {$_.Name -like 'Chrome'})
{
Add-OutputBoxLine-Red -Message "==> Please Close Google Chrome..." 
#Wait-Process -Name 'chrome'
$chrome.WaitForExit()
else{
if (Test-Path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default"){
Remove-Item -path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force 
Remove-Item -path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force 
Remove-Item -path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Recurse -Force 
Remove-Item -path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Media Cache" -Recurse -Force 
Remove-Item -path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal" -Recurse -Force 
}
}
}

Clear-DnsClientCache
Clear-BCCache -force
Clear-KdsCache
Start-Process -FilePath "$env:windir\System32\Rundll32.exe" -ArgumentList "advapi32.dll,ProcessIdleTasks"
}

Function CCleaner-Clean{
if (test-path "C:\Program Files\CCleaner") {
Add-OutputBoxLine -Message "==> Starting Silent CleanUp CCleaner..." 
Start-Process -FilePath "C:\Program Files\CCleaner\CCleaner64.exe" -ArgumentList "/AUTO" -Wait -WarningAction SilentlyContinue
}
}

Function Windows-Cleanmgr{
Add-OutputBoxLine -Message "==> Running Windows System Cleanup..." -ForegroundColor 'Yellow'
## Variables: Get Volume Caches registry paths
[String]$regVolumeCachesRootPath = 'HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches'
[Array]$regVolumeCachesPaths = Get-ChildItem -Path $regVolumeCachesRootPath | Select-Object -ExpandProperty 'Name'
## Variables: CleanMgr cleanup settings
[String]$regSageSet = '5432'
[String]$regName = 'StateFlags' + $regSageSet
[String]$regValue = '00000002'
[String]$regType = 'DWORD'

 #  If Volume Cache Paths exist add registry entries required by CleanMgr
            If ($regVolumeCachesPaths) {
                Add-OutputBoxLine -Message "==> Adding $regName to the following Registry Paths:" -ForegroundColor 'Yellow'
                $regVolumeCachesPaths | ForEach-Object {
                    Add-OutputBoxLine -Message "$_"
                    New-ItemProperty -Path Registry::$_ -Name $regName -Value $regValue -PropertyType $regType -Force | Out-Null
                }

                #  If machine is Windows Server 2008 R2, copy files required by CleanMgr and wait for action to complete
                If ($MachineOS -eq 'Windows Server 2008 R2') {
                    Copy-Item -Path 'C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe' -Destination 'C:\Windows\System32\' -Force | Out-Null
                    Copy-Item -Path 'C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui' -Destination 'C:\Windows\System32\en-US\' -Force | Out-Null
                }

                #  Start Volume Cache Cleanup
                Add-OutputBoxLine -Message '==> Performing CleanMgr Clean up...' -ForegroundColor 'Yellow'
                Start-Process -FilePath 'CleanMgr.exe' -ArgumentList "/sagerun:$regSageSet" -Wait
                Get-Process -Name cleanmgr,dismhost -ErrorAction SilentlyContinue | Wait-Process
            }
            Else {
                Add-OutputBoxLine -Message '==> Path Not Found! Skipping...' -ForegroundColor 'Red' -BackgroundColor 'Black'
            }
}

Function Clear-Eventlogs{
Add-OutputBoxLine -Message "==> Clearing All Event Logs" 
$Feed.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("")
wevtutil el | Foreach-Object {Add-OutputBoxLine -Message "Clearing $_"; wevtutil cl "$_"}
}

Function UpdatesAvailable()
{
	$updateavailable = $false
	$nextversion = $null
	try
	{
		$nextversion = (New-Object System.Net.WebClient).DownloadString($githubver).Trim([Environment]::NewLine)
	}
	catch [System.Exception] 
	{
		Write-Message $_ "debug"
	}
	
	Write-Message "CURRENT VERSION: $version" "debug"
	Write-Message "NEXT VERSION: $nextversion" "debug"
	if ($nextversion -ne $null -and $version -ne $nextversion)
	{
		#An update is most likely available, but make sure
		$updateavailable = $false
		$curr = $version.Split('.')
		$next = $nextversion.Split('.')
		for($i=0; $i -le ($curr.Count -1); $i++)
		{
			if ([int]$next[$i] -gt [int]$curr[$i])
			{
				$updateavailable = $true
				break
			}
		}
	}
	return $updateavailable
}

Function Process-Updates()
{
	if (Test-Connection 8.8.8.8 -Count 1 -Quiet)
	{
		$updatepath = "$($PWD.Path)\update.ps1"
		if (Test-Path -Path $updatepath)	
		{
			#Remove-Item $updatepath
		}
		if (UpdatesAvailable)
		{
			Write-Message "Update available. Do you want to update luckystrike? Your payloads/templates will be preserved." "success"
			$response = Read-Host "`nPlease select Y or N"
			while (($response -match "[YyNn]") -eq $false)
			{
				$response = Read-Host "This is a binary situation. Y or N please."
			}

			if ($response -match "[Yy]")
			{	
				(New-Object System.Net.Webclient).DownloadFile($updatefile, $updatepath)
				Start-Process PowerShell -Arg $updatepath
				exit
			}
		}
	}
	else
	{
		Write-Message "Unable to check for updates. Internet connection not available." "warning"
	}
}

$ScanWindows.Add_Click({QuickScan-Defender})
$RemoveOneDrive.Add_Click({Uninstall-OneDrive})
$RemoveRestore.Add_Click({Get-ComputerRestorePoint | Delete-ComputerRestorePoints
Add-OutputBoxLine-Green -Message "==> Succesfully removed Restore Points" })
$Reboot.Add_Click({Reboot-System})
$RemoveAppx.Add_Click({Add-OutputBoxLine-Red -Message "Coming Soon" }) #Appx-Remove
$RestoreAppx.Add_Click({Appx-Restore})
$MoveUpdateFolder.Add_Click({Add-OutputBoxLine-Red -Message "Coming Soon" }) #Junction-Updatefolder
$RestoreUpdate.Add_Click({Restore-Updatefolder})

$CleanBoost.Add_Click({

$progressBar1.Maximum = 17
$progressBar1.Step = 1
$progressBar1.Value = 1

Disable-Services
$progressBar1.PerformStep()
Disable-Features
$progressBar1.PerformStep()
Disable-Tasks 
$progressBar1.PerformStep()
Defrag-Schedule
$progressBar1.PerformStep()
DISM-Cleanup
$progressBar1.PerformStep()
Update-Registry
$progressBar1.PerformStep()
Delete-Registry
$progressBar1.PerformStep()
Delete-Rougefolders
$progressBar1.PerformStep()
Delete-WER
$progressBar1.PerformStep()
Delete-Temp
$progressBar1.PerformStep()
Delete-Updatedownloads
$progressBar1.PerformStep()
Delete-Volumeshadow
$progressBar1.PerformStep()
Clear-Cache
$progressBar1.PerformStep()
#Windows-Cleanmgr
$progressBar1.PerformStep()
CCleaner-Clean
$progressBar1.PerformStep()
Clear-Eventlogs
$progressBar1.PerformStep()

$FreespaceAfter = (Get-WmiObject win32_logicaldisk -filter "DeviceID='C:'" | select Freespace).FreeSpace/1GB
$FreeSpaced = ($FreespaceBefore- $FreespaceAfter)
$SpaceFreed.text = [math]::Round($FreeSpaced,3), 'GB' 
$progressBar1.PerformStep()
Add-OutputBoxLine-Green -Message "==> Clean-Up & Boost Finished" 

})


  
[void]$Form.ShowDialog()
  
