##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uO1
##Nc3NCtDXTlaDjofG5iZk2WbvUHwiZMunnbmk0Yy58f7/hxLQR54bXkdHmT75Fni1XP4eafkas94mXBMJI/cK7JDfFPS9EOwDkewf
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4dI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWI0g==
##OsfOAYaPHGbQvbyVvnQlqx6gEiZ7Dg==
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnRA7EXqTX84TcmeuLiS1KOz8Pn42w==
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnRA7EXqTX84LuaXvLephMr83eXjqDGZepkGQERj9g==
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+VzjVl8ULkTCgMIKU=
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2WbvUHwiZMunnbO0z5Wz79bbsivdRo0HalhylyfJFGmyVuEGG/ANsbE=
##Kc/BRM3KXxU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba

# Written By Martijn G.
#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'

#Script Version
$version = "2.6"

#----------------------------------------------------------[Declarations]----------------------------------------------------------
#Script Path Log/List
$scriptPath = "$env:HOMEDRIVE\Temp\WinCleanBoostAppList"

#Github info (Update)
$githubver = "https://raw.githubusercontent.com/MartijnGriekje/Windows-System-Clean-Boost/main/currentversion.txt"
$updatefile = "https://raw.githubusercontent.com/MartijnGriekje/Windows-System-Clean-Boost/main/update.ps1"

#Check Running as administrator:
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$testadmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
if ($testadmin -eq $false) {
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
exit $LASTEXITCODE
}

#Get system architecture if it's needed for further actions
$arch = (Get-Process -Id $PID).StartInfo.EnvironmentVariables["PROCESSOR_ARCHITECTURE"]
if ($arch -eq "AMD64")
{
	$arch = "x64"
}
else
{
	$arch = "x86"
}

$osInfo = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption
$PCType = Get-ComputerInfo | Select-Object -ExpandProperty CsPCSystemType

#Unnecessary Windows 10 AppX apps that will be removed by the blacklist.

$global:Bloatware = @(
   
  
)

#Valuable Windows 10 AppX apps that most people want to keep. Protected from DeBloat All.
<#$global:WhiteListedApps = @(
    "ActiproSoftwareLLC"
    "AdobeSystemsIncorporated.AdobePhotoshopExpress"
    "BubbleWitch3Saga"
    "CandyCrush"
    "CanonicalGroupLimited.UbuntuonWindows"     
    "Dolby"                                             
    "Duolingo-LearnLanguagesforFree"
    "EclipseManager"
    "Facebook"
    "Flipboard"
    "Microsoft.BingNews"
    "Microsoft.BingWeather" 
    "Microsoft.DesktopAppInstaller"             
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.HEIFImageExtension"              
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MixedReality.Portal"             
    "Microsoft.MSPaint"                         
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"                                    
    "Microsoft.Office.Lens"                             
    "Microsoft.Office.OneNote"
    "Microsoft.Office.Sway"
    "Microsoft.Office.Todo.List"                        
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.PPIProjection"
    "Microsoft.Print3D"
    "Microsoft.RemoteDesktop"                           
    "Microsoft.ScreenSketch"                    
    "Microsoft.SkypeApp"
    "Microsoft.StorePurchaseApp"
    "Microsoft.StorePurchaseApp"                
    "Microsoft.VP9VideoExtensions"              
    "Microsoft.WebMediaExtensions"              
    "Microsoft.WebpImageExtension"              
    "Microsoft.Whiteboard"                              
    "Microsoft.Windows.Cortana"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsCommunicationsApps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.Xbox.TCUI"
    "Microsoft.Xbox.TCUI"                       
    "Microsoft.XboxApp"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameCallableUI" 
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxGamingOverlay"               
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxIdentityProvider"            
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "MIDIBerry" 
    "Minecraft"
    "*Nvidia*"                                
    "PandoraMediaInc"
    "Royal Revolt"
    "Slack"                                     
    "Spotify"                                           
    "Sway"                                              
    "Twitter"
    "Windows.CBSPreview" 
    "WindSynthBerry"  
    "Wunderlist"

    #Optional: Typically not removed but you can if you need to for some reason
    #"Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe"
    #"Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe"                      

)#>

#NonRemovable Apps that where getting attempted and the system would reject the uninstall, speeds up debloat and prevents 'initalizing' overlay when removing apps
$NonRemovables = Get-AppxPackage -AllUsers | Where-Object { $_.NonRemovable -eq $true } | ForEach { $_.Name }
$NonRemovables += Get-AppxPackage | Where-Object { $_.NonRemovable -eq $true } | ForEach { $_.Name }
$NonRemovables += Get-AppxProvisionedPackage -Online | Where-Object { $_.NonRemovable -eq $true } | ForEach { $_.DisplayName }
$NonRemovables = $NonRemovables | Sort-Object -Unique

#Personal Non Removables 
#WARNING: only use exact names here - no short names or wildcards
    $PersonalNonRemovables = @(  
        '\.NET',
        '1527c705-839a-4832-9118-54d4Bd6a0c89',
        'c5e2524a-ea46-4f67-841f-6a9465d9d515',
        'E2A4F912-2574-4A75-9BB0-0D023378592B',
        'F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE',
        'InputApp',
        'Microsoft.AAD.BrokerPlugin',
        'Microsoft.AccountsControl',
        'Microsoft.AsyncTextService',
        'Microsoft.BioEnrollment',
        'Microsoft.CredDialogHost',
        'Microsoft.DesktopAppInstaller',
        'Microsoft.ECApp',
        'Microsoft.LockApp',
        'Microsoft.NET.Native.Framework.2.2',
        'Microsoft.NET.Native.Runtime.2.2',
        'Microsoft.PPIProjection',
        'Microsoft.Services.Store.Engagement',
        'Microsoft.Win32WebViewHost',
        'Microsoft.Windows.Apprep.ChxApp',
        'Microsoft.Windows.AssignedAccessLockApp',
        'Microsoft.Windows.CallingShellApp',
        'Microsoft.Windows.CapturePicker',
        'Microsoft.Windows.CloudExperienceHost',
        'Microsoft.Windows.ContentDeliveryManager',
        'Microsoft.Windows.HolographicFirstRun',         
        'Microsoft.Windows.NarratorQuickStart',
        'Microsoft.Windows.OOBENetworkCaptivePortal',    
        'Microsoft.Windows.OOBENetworkConnectionFlow',   
        'Microsoft.Windows.ParentalControls',
        'Microsoft.Windows.PeopleExperienceHost',
        'Microsoft.Windows.Photos', 
        'Microsoft.Windows.PinningConfirmationDialog',
        'Microsoft.Windows.SecHealthUI',                  
        'Microsoft.Windows.SecondaryTileExperience',     
        'Microsoft.Windows.SecureAssessmentBrowser',
        'Microsoft.Windows.ShellExperienceHost',
        'Microsoft.Windows.StartMenuExperienceHost',
        'Microsoft.Windows.XGpuEjectDialog',
        'Microsoft.WindowsCalculator',
        'Microsoft.WindowsStore',                
        'MicrosoftWindows.Client.CBS',
        'Windows.CBSPreview',
        'Windows.immersivecontrolpanel',
        'Windows.PrintDialog'
    
    )
# Override built-in blacklist/whitelist with user defined lists
dotInclude 'DeleteAppList.ps1'
dotInclude 'RestoreAppList.ps1'

#convert to regular expression to allow for the super-useful -match operator
$global:BloatwareRegex = $global:Bloatware -join '|'
$global:RestoreListedAppsRegex = $global:RestoreListedApps -join '|'

#Windows Form GUI:
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(1095,572)
$Form.text                       = "Windows System Clean-Up + Boost - Made by: Martijn G."
$Form.TopMost                    = $false
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#093a60")
$Form.add_FormClosing({Window-Close})

$CleanButton                     = New-Object system.Windows.Forms.Button
$CleanButton.text                = "      Clean-Up"
$CleanButton.width               = 245
$CleanButton.height              = 84
$CleanButton.location            = New-Object System.Drawing.Point(16,38)
$CleanButton.Font                = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$CleanButton.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$CleanButton.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")

$BoostButton                     = New-Object system.Windows.Forms.Button
$BoostButton.text                = "Boost"
$BoostButton.width               = 245
$BoostButton.height              = 84
$BoostButton.location            = New-Object System.Drawing.Point(16,130)
$BoostButton.Font                = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$BoostButton.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$BoostButton.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Automatic"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(16,11)
$Label1.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$RemoveAppx                      = New-Object system.Windows.Forms.Button
$RemoveAppx.text                 = "          Remove Appx"
$RemoveAppx.width                = 245
$RemoveAppx.height               = 84
$RemoveAppx.location             = New-Object System.Drawing.Point(271,249)
$RemoveAppx.Font                 = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$RemoveAppx.BackColor            = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$RemoveAppx.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$RemoveAppx.TextAlign            = [System.Drawing.ContentAlignment]::MiddleCenter

$RestoreAppx                     = New-Object system.Windows.Forms.Button
$RestoreAppx.text                = "          Restore Appx"
$RestoreAppx.width               = 245
$RestoreAppx.height              = 84
$RestoreAppx.location            = New-Object System.Drawing.Point(271,340)
$RestoreAppx.Font                = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$RestoreAppx.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$RestoreAppx.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$RestoreAppx.TextAlign           = [System.Drawing.ContentAlignment]::MiddleCenter

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Optional Fixes/Changes:"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(16,221)
$Label3.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))
$Label3.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Windows 10 Built-in Apps:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(271,221)
$Label2.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))
$Label2.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$ScanWindows                     = New-Object system.Windows.Forms.Button
$ScanWindows.text                = "      Scan Defender"
$ScanWindows.width               = 245
$ScanWindows.height              = 84
$ScanWindows.location            = New-Object System.Drawing.Point(16,340)
$ScanWindows.Font                = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$ScanWindows.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$ScanWindows.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$PrivacyButton                   = New-Object system.Windows.Forms.Button
$PrivacyButton.text              = "Set Privacy"
$PrivacyButton.width             = 245
$PrivacyButton.height            = 84
$PrivacyButton.location          = New-Object System.Drawing.Point(16,431)
$PrivacyButton.Font              = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$PrivacyButton.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$PrivacyButton.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$RestorePoint                    = New-Object system.Windows.Forms.Button
$RestorePoint.text               = "         Revert Changes"
$RestorePoint.width              = 245
$RestorePoint.height             = 84
$RestorePoint.location           = New-Object System.Drawing.Point(16,249)
$RestorePoint.Font               = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$RestorePoint.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$RestorePoint.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Reboot                          = New-Object system.Windows.Forms.Button
$Reboot.text                     = "Reboot System"
$Reboot.width                    = 160
$Reboot.height                   = 40
$Reboot.Anchor                   = 'right,bottom'
$Reboot.location                 = New-Object System.Drawing.Point(536,479)
$Reboot.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Reboot.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Reboot.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")

$ProgressBar1                    = New-Object system.Windows.Forms.ProgressBar
$ProgressBar1.width              = 1065
$ProgressBar1.height             = 25
$ProgressBar1.value              = 0
$ProgressBar1.Anchor             = 'right,bottom,left'
$ProgressBar1.location           = New-Object System.Drawing.Point(16,534)

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Windows Update Folder:"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(271,11)
$Label4.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))
$Label4.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$MoveUpdateFolder                = New-Object system.Windows.Forms.Button
$MoveUpdateFolder.text           = "      Move Folder"
$MoveUpdateFolder.width          = 245
$MoveUpdateFolder.height         = 84
$MoveUpdateFolder.location       = New-Object System.Drawing.Point(271,38)
$MoveUpdateFolder.Font           = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$MoveUpdateFolder.BackColor      = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$MoveUpdateFolder.ForeColor      = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$RestoreUpdate                   = New-Object system.Windows.Forms.Button
$RestoreUpdate.text              = "          Restore Folder"
$RestoreUpdate.width             = 245
$RestoreUpdate.height            = 84
$RestoreUpdate.location          = New-Object System.Drawing.Point(271,130)
$RestoreUpdate.Font              = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$RestoreUpdate.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$RestoreUpdate.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Label6                          = New-Object system.Windows.Forms.Label
$Label6.text                     = "Space Cleared:"
$Label6.AutoSize                 = $true
$Label6.width                    = 25
$Label6.height                   = 10
$Label6.Anchor                   = 'top,right'
$Label6.location                 = New-Object System.Drawing.Point(945,11)
$Label6.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))
$Label6.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$SpaceFreed                      = New-Object system.Windows.Forms.MaskedTextBox
$SpaceFreed.multiline            = $false
$SpaceFreed.width                = 135
$SpaceFreed.height               = 25
$SpaceFreed.Anchor               = 'top,right'
$SpaceFreed.location             = New-Object System.Drawing.Point(947,38)
$SpaceFreed.Font                 = New-Object System.Drawing.Font('Arial',14)
$SpaceFreed.ReadOnly             = $true 
$SpaceFreed.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$SpaceFreed.BackColor            = [System.Drawing.ColorTranslator]::FromHtml("#093a60")

$ExitButton                      = New-Object system.Windows.Forms.Button
$ExitButton.text                 = "Exit"
$ExitButton.width                = 160
$ExitButton.height               = 40
$ExitButton.Anchor               = 'right,bottom'
$ExitButton.location             = New-Object System.Drawing.Point(919,479)
$ExitButton.Font                 = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$ExitButton.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$ExitButton.BackColor            = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
$ExitButton.Add_Click({ 
$form.close()
})

$Feed                            = New-Object system.Windows.Forms.RichTextBox
$Feed.multiline                  = $true
$Feed.width                      = 543
$Feed.height                     = 338
$Feed.visible                    = $true
$Feed.Anchor                     = 'right,bottom'
$Feed.location                   = New-Object System.Drawing.Point(537,130)
$Feed.Font                       = New-Object System.Drawing.Font('Consolas',10)
$Feed.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#000000")
$Feed.ScrollBars                 = “Vertical”
$Feed.ReadOnly                   = $true 
$Feed.Text                       = ''

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Console:"
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.Anchor                   = 'right,bottom'
$Label5.location                 = New-Object System.Drawing.Point(535,103)
$Label5.Font                     = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Underline))
$Label5.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 65
$PictureBox1.height              = 65
$PictureBox1.location            = New-Object System.Drawing.Point(27,45)
$PictureBox1.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/WindowsClean1.png"
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox2                     = New-Object system.Windows.Forms.PictureBox
$PictureBox2.width               = 65
$PictureBox2.height              = 65
$PictureBox2.location            = New-Object System.Drawing.Point(21,350)
$PictureBox2.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/WindowsDefenderLogo2.png"
$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox3                     = New-Object system.Windows.Forms.PictureBox
$PictureBox3.width               = 59
$PictureBox3.height              = 59
$PictureBox3.location            = New-Object System.Drawing.Point(25,443)
$PictureBox3.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/PrivacyLock.png"
$PictureBox3.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox4                     = New-Object system.Windows.Forms.PictureBox
$PictureBox4.width               = 65
$PictureBox4.height              = 65
$PictureBox4.location            = New-Object System.Drawing.Point(21,258)
$PictureBox4.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/SystemRestoreLogoView.png"
$PictureBox4.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox5                     = New-Object system.Windows.Forms.PictureBox
$PictureBox5.width               = 65
$PictureBox5.height              = 65
$PictureBox5.location            = New-Object System.Drawing.Point(27,136)
$PictureBox5.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/WindowsBoost.png"
$PictureBox5.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox6                     = New-Object system.Windows.Forms.PictureBox
$PictureBox6.width               = 65
$PictureBox6.height              = 65
$PictureBox6.location            = New-Object System.Drawing.Point(277,258)
$PictureBox6.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/WindowStoreRemoveLogo.png"
$PictureBox6.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox7                     = New-Object system.Windows.Forms.PictureBox
$PictureBox7.width               = 65
$PictureBox7.height              = 65
$PictureBox7.location            = New-Object System.Drawing.Point(277,346)
$PictureBox7.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/WindowStoreLogo.png"
$PictureBox7.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox8                     = New-Object system.Windows.Forms.PictureBox
$PictureBox8.width               = 65
$PictureBox8.height              = 65
$PictureBox8.location            = New-Object System.Drawing.Point(275,45)
$PictureBox8.imageLocation       = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/WindowsMove.png"
$PictureBox8.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox9                    = New-Object system.Windows.Forms.PictureBox
$PictureBox9.width              = 55
$PictureBox9.height             = 55
$PictureBox9.location           = New-Object System.Drawing.Point(800,15)
$PictureBox9.imageLocation      = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/joystickwhite.png"
$PictureBox9.SizeMode           = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox10                    = New-Object system.Windows.Forms.PictureBox
$PictureBox10.width              = 65
$PictureBox10.height             = 65
$PictureBox10.location           = New-Object System.Drawing.Point(275,139)
$PictureBox10.imageLocation      = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/WindowsBack.png"
$PictureBox10.SizeMode           = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$PictureBox11                    = New-Object system.Windows.Forms.PictureBox
$PictureBox11.width              = 55
$PictureBox11.height             = 55
$PictureBox11.location           = New-Object System.Drawing.Point(870,15)
$PictureBox11.imageLocation      = "https://github.com/MartijnGriekje/Windows-System-Clean-Boost/raw/main/Logos/repairwhite.png"
$PictureBox11.SizeMode           = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$RestorePrivacy = New-Object system.Windows.Forms.ToolTip
$RestorePrivacy.SetToolTip($PrivacyButton, "Set Antispy and privacy settings")

$TooltipRevert = New-Object system.Windows.Forms.ToolTip
$TooltipRevert.SetToolTip($RestorePoint, "Open System Restore")

$TooltipScan = New-Object system.Windows.Forms.ToolTip
$TooltipScan.SetToolTip($ScanWindows, "QuickScan with Windows Defender")

$TooltipBoost = New-Object system.Windows.Forms.ToolTip
$TooltipBoost.SetToolTip($BoostButton, "Automatically boost your PC")

$TooltipClean = New-Object system.Windows.Forms.ToolTip
$TooltipClean.SetToolTip($CleanButton, "Automatically clean your PC")

$TooltipMove = New-Object system.Windows.Forms.ToolTip
$TooltipMove.SetToolTip($MoveUpdateFolder, "Move Windows Update folder")

$TooltipRestore = New-Object system.Windows.Forms.ToolTip
$TooltipRestore.SetToolTip($RestoreUpdate, "Restore Windows Update folder")

$TooltipRemoveAppx = New-Object system.Windows.Forms.ToolTip
$TooltipRemoveAppx.SetToolTip($RemoveAppx, "Remove Windows Built-in Apps")

$TooltipRestoreAppx = New-Object system.Windows.Forms.ToolTip
$TooltipRestoreAppx.SetToolTip($RestoreAppx, "Restore Windows Built-in Apps")

$TooltipExit = New-Object system.Windows.Forms.ToolTip
$TooltipExit.SetToolTip($ExitButton, "Close WindowsCleanBoost")

$TooltipReboot = New-Object system.Windows.Forms.ToolTip
$TooltipReboot.SetToolTip($Reboot, "Reboot your system")

$TooltipGame = New-Object system.Windows.Forms.ToolTip
$TooltipGame.SetToolTip($PictureBox9, "Set Game Settings")

$TooltipFix = New-Object system.Windows.Forms.ToolTip
$TooltipFix.SetToolTip($PictureBox11, "Repair your machine")

$Form.controls.AddRange(@($PictureBox1,$PictureBox2,$PictureBox3,$PictureBox4,$PictureBox5,$PictureBox6,$PictureBox7,$PictureBox8,$PictureBox9,$PictureBox10,$PictureBox11,$Label6
$CleanButton,$BoostButton,$Label1,$Label3,$Label2,$RestorePoint,$ScanWindows,$PrivacyButton,$Label4,$MoveUpdateFolder,$RestoreUpdate,$RemoveAppx,$RestoreAppx,$ProgressBar1,$Reboot,$Label5,$ExitButton,$SpaceFreed,$Feed))


#-----------------------------------------------------------[Functions]------------------------------------------------------------

#Update Check:
Function UpdatesAvailable(){
	$updateavailable = $false
	$nextversion = $null
	try
	{
		$nextversion = (New-Object System.Net.WebClient).DownloadString($githubver).Trim([Environment]::NewLine)
	}
	catch [System.Exception] 
	{
		Write-Host $_ "debug"
	}
	
	Add-OutputBoxLine -Message "==> Current version: $version" 
	Add-OutputBoxLine -Message "==> Final version: $nextversion"
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

Function Process-Updates(){
	if (Test-Connection 8.8.8.8 -Count 1 -Quiet)
	{
		$updatepath = "$env:HOMEDRIVE\update.ps1"
		if (Test-Path -Path $updatepath)	
		{
			Remove-Item $updatepath
		}
		if (UpdatesAvailable)
		{
			Add-OutputBoxLine-Red -Message "==> Update available. Please restart WindowsCleanUpBoost"
          
            $response = [System.Windows.Forms.MessageBox]::Show('Do you want to update WindowsCleanUpBoost?', 'Update available', 'YesNoCancel', 'Question')
            (New-Object -ComObject WScript.Shell).AppActivate(($response).MainWindowTitle)

            if ('Yes' -eq $response) {
            (New-Object System.Net.Webclient).DownloadFile($updatefile, $updatepath)
			Start-Process PowerShell -Arg $updatepath -wait
            Remove-Item $updatepath -Recurse -Force 
            exit          
            }

            if ('Cancel' -or 'No' -eq $response) {
            Add-OutputBoxLine -Message "==> Skipped Update"      
            }
		}
	}
	else
	{
		Write-Host "Unable to check for updates. Internet connection not available."
	}
}

#Logging:
Function Start-Log {
    Param (
        [int]$KeepLog = 2
    )

    $Script:VerbosePreference = "Continue"
    $LogPath = Join-Path –Path "$env:HOMEDRIVE\Temp" –ChildPath "Logs"
    If (-not (Test-Path $LogPath))
    {
        Try {
            New-Item –Path $LogPath –ItemType Directory –ErrorAction Stop | Out-Null
        }
        Catch {
            Write-Error "Unable to create log folder because ""$($Error[0])"", no logging will be available for this script"
            Return
        }
    }
    $LogPathName = Join-Path –Path $LogPath –ChildPath "$env:computername-$(Get-Date –Format 'MM-dd-yyyy').log"
    Try {
        Start-Transcript $LogPathName –Append –ErrorAction Stop
        Write-Verbose "$(Get-Date): Logging for $($Script:MyInvocation.MyCommand.Name) started"
    }
    Catch {
        Write-Error "Unable to create transcript log because ""$($Error[0])"""
        Return
    }
    If (@(Get-ChildItem "$LogPath\*.log" | Where LastWriteTime -LT (Get-Date).AddDays(–$KeepLog)).Count -gt 0)
    {
        Write-Verbose "$(Get-Date): Removing old log files"
        Get-ChildItem "$LogPath\*.log" | Where LastWriteTime -LT (Get-Date).AddDays(–$KeepLog) | Remove-Item –Confirm:$false -Force
    }
}

Function Stop-Log {
    Write-Verbose "$(Get-Date): Logging for $($Script:MyInvocation.MyCommand.Name) completed"
    Stop-Transcript
}

#Send Mail:
Function Send-Mail {
$email = "windowscleanboost@gmail.com"
$smtpServer = "smtp.gmail.com"
$SmtpServerPort = "587"
$user = "cleanwin10"

$file = Get-ChildItem -Path "$env:HOMEDRIVE\Temp\Logs\*.*" -Include *.txt,*.log -Force | Sort-Object LastAccessTime -Descending | Select-Object -First 1 
$totalSize = ($file | Measure-Object -Sum Length).Sum / 1KB

$msg = new-object Net.Mail.MailMessage
$smtp = new-object Net.Mail.SmtpClient($smtpServer,$SmtpServerPort)
$smtp.EnableSsl = $true
$msg.From = "$email" 
$msg.To.Add("$email")
$msg.BodyEncoding = [system.Text.Encoding]::Unicode
$msg.SubjectEncoding = [system.Text.Encoding]::Unicode
$msg.IsBodyHTML = $true 
$msg.Attachments.Add($file.FullName)
$msg.Subject = "Log File from $env:computername"

$msg.Body = "<h2> Log from $env:UserName </h2>
$(Get-Date)
<br>
<br>
LogName = $file
<br>
Computername = $env:computername
<br>
UserDomain   = $env:UserDomain
<br>
User         = $env:UserName
<br>
TimeClean    = $global:TimeClean
<br>
TimeBoost    = $global:TimeBoost
<br>
SpaceCleared = $global:SpaceFree
" 

$SMTP.Credentials = New-Object System.Net.NetworkCredential("$email", "$user");

If (!($totalSize -le 3)){
$smtp.Send($msg)
Write-Verbose "$(Get-Date): Send log to mail"
}
}

#Hide Console:
Function HideConsole{
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)
}

#Winodow Closing button:
Function Window-Close {
 
    $_.Cancel = $true
 
    $question = [System.Windows.Forms.MessageBox]::Show('Are you sure you want to exit?', 'Are You Sure?', 'YesNoCancel', 'Question')
    (New-Object -ComObject WScript.Shell).AppActivate(($question).MainWindowTitle)
 
    if ('Yes' -eq $question) {
        Stop-Log
        Send-Mail 
        Clear-History 
        Clean-Memory    
        $_.Cancel = $false
    }
    if ('Cancel' -eq $question) {
        Stop-Log
        Clear-History 
        Clean-Memory        
        $_.Cancel = $false
    }
 
}

#Message RichTextBox (Feed):
Function Add-OutputBoxLine {
    Param ($Message)
    $Feed.SelectionColor = 'white'
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
    Write-Host "$Message"
}

Function Add-OutputBoxLine-Red {
    Param ($Message)
    $Feed.SelectionColor = 'red'
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
    Write-Host "$Message"
}

Function Add-OutputBoxLine-Yellow {
    Param ($Message)
    $Feed.SelectionColor = 'Yellow'
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
    Write-Host "$Message"
}

Function Add-OutputBoxLine-Green {
    Param ($Message)
    $Feed.SelectionColor = [System.Drawing.ColorTranslator]::FromHtml("#68ff00")
    $Feed.AppendText("`r`n$Message")
    $Feed.Refresh()
    $Feed.ScrollToCaret()
    Write-Host "$Message"
}

#import library code - located relative to this script
Function dotInclude() {
    Param(
        [Parameter(Mandatory)]
        [string]$includeFile
    )
    # Look for the file in the same directory as this script
    $scriptPath = "$env:HOMEDRIVE\Temp\WinCleanBoostAppList"
    
    New-Item –Path $scriptPath –ItemType Directory | Out-Null
 
    if ( test-path $scriptPath\$includeFile ) {
        # import and immediately execute the requested file
        . $scriptPath\$includeFile
    }
}

#Download Windows AppPackage

Function Download-AppxPackage {
[CmdletBinding()]
param (
  [string]$PackageFamilyName,
  [string]$PackageFamilyNametrim,
  [string]$PackageFamilyNametrimRegex,
  [Parameter(Mandatory=$False)]
   $SavePathRoot="%tmp%"
 )

$PackageFamilyNameTrim = $PackageFamilyName -replace "^_|_.*" -replace "[`r`n]+", "`n"
$PackageFamilyNametrimRegex = $PackageFamilyNametrim -join '|'

$NoLink = $false
if ($PackageFamilyName.EndsWith("/"))
{
    #Add-OutputBoxLine -Message "==> Ends with '/'"
    $PackageFamilyName=$PackageFamilyName.Remove($PackageFamilyName.Length-1,1)
}

$wchttp=[System.Net.WebClient]::new()
$URI = "https://store.rg-adguard.net/api/GetFiles"
$myParameters = "type=PackageFamilyName&url=$PackageFamilyName" 
#&ring=Retail&lang=sv-SE"

$wchttp.Headers[[System.Net.HttpRequestHeader]::ContentType]="application/x-www-form-urlencoded"
$HtmlResult = $wchttp.UploadString($URI, $myParameters) 

$Start=$HtmlResult.IndexOf("<p>The links were successfully received from the Microsoft Store server.</p>")


if ($Start -eq -1)
{
    Add-OutputBoxLine-Red -Message "==> Could not get the links $PackageFamilyName"
    Add-OutputBoxLine-Red -Message "==> Please check the PackageFamilyName or Install from Windows Store."
    $NoLink = $true
   
    If (!(Get-Process -Name WinStore.App -ErrorAction SilentlyContinue)){start ms-windows-store://Home}
    #start ms-windows-store://pdp/?productid=9PRDV7DBD3V9
   
    (Get-Content -Path $scriptPath\DeleteAppList.ps1) | Foreach {$_ -replace """$PackageFamilyName""", ""} | Where-Object {$_.trim() -ne "" } | Set-Content -Path $scriptPath\DeleteAppList.ps1 -Force   
    $set = @{}
    (Get-Content $scriptPath\RestoreAppList.ps1) | %{
    if (!$set.Contains($_)) {
        $set.Add($_, $null)
        $_
    }
    } | Set-Content $scriptPath\RestoreAppList.ps1
    dotInclude 'DeleteAppList.ps1'
    dotInclude 'RestoreAppList.ps1'
}
else{
$TableEnd=($HtmlResult.LastIndexOf("</table>")+8)

$SemiCleaned=$HtmlResult.Substring($start,$TableEnd-$start)

#https://stackoverflow.com/questions/46307976/unable-to-use-ihtmldocument2
$newHtml=New-Object -ComObject "HTMLFile"
try {
    # This works in PowerShell with Office installed
    $newHtml.IHTMLDocument2_write($SemiCleaned)
}
catch {
    # This works when Office is not installed    
    $src = [System.Text.Encoding]::Unicode.GetBytes($SemiCleaned)
    $newHtml.write($src)
}

$PackageFamilyNameTrim = $PackageFamilyName -replace "^_|_.*" -replace "[`r`n]+", "`n"

#Write-host {'$PackageFamilyNameTrim'}

$ToDownload=$newHtml.getElementsByTagName("a") | Select-Object textContent, href | where {$_ -match "$PackageFamilyNametrimRegex.*$arch.*\.appx|$PackageFamilyNametrimRegex.*\.appx|$PackageFamilyNametrimRegex.*$arch.*\.msix|$PackageFamilyNametrimRegex.*\.msix|$PackageFamilyNametrimRegex.*\.appxbundle|$PackageFamilyNametrimRegex.*\.msixbundle"}  

$SavePathRoot=$([System.Environment]::ExpandEnvironmentVariables("$SavePathRoot"))

$LastFrontSlash=$PackageFamilyName.LastIndexOf("/")
$ProductID=$PackageFamilyName.Substring($LastFrontSlash+1,$PackageFamilyName.Length-$LastFrontSlash-1)

# OldRegEx   Failed when the %tmp% started with a lowercase char
#if ([regex]::IsMatch("$SavePathRoot\$ProductID","([,!@?#$%^&*()\[\]]+|\\\.\.|\\\\\.|\.\.\\\|\.\\\|\.\.\/|\.\/|\/\.\.|\/\.|;|(?<![A-Z]):)|^\w+:(\w|.*:)"))

if ([regex]::IsMatch("$SavePathRoot\$ProductID","([,!@?#$%^&*()\[\]]+|\\\.\.|\\\\\.|\.\.\\\|\.\\\|\.\.\/|\.\/|\/\.\.|\/\.|;|(?<![A-Za-z]):)|^\w+:(\w|.*:)"))
{
    Add-OutputBoxLine-Red -Message "==> Invalid characters in path"$SavePathRoot\$ProductID""
    $NoLink = $true
    #exit
}


if (!(test-path "$SavePathRoot\$ProductID"))
{
    Add-OutputBoxLine -Message "==> Creating Temp Directorty"

    try
    {
        New-Item -ItemType Directory "$SavePathRoot\$ProductID" -ErrorAction Stop | Out-Null
    }
    catch
    {
        Add-OutputBoxLine-Red -Message "==> Failed to create directory.$([System.environment]::NewLine)$_"
        #Add-OutputBoxLine-Red -Message "==> Exiting..."
        $NoLink = $true
    }
}

Foreach ($Download in $ToDownload)
{
    Add-OutputBoxLine -Message "Downloading $($Download.textContent)..."
	$wchttp.DownloadFile($Download.href, "$SavePathRoot\$ProductID\$($Download.textContent)") 
    
}
}
#Add-OutputBoxLine -Message "---------------------------------------"
#Add-OutputBoxLine -Message ""
#Add-OutputBoxLine-Green -Message "==> Download is complete..."

$LastPackage = Get-ChildItem -Path $SavePathRoot\$ProductID\  | Where-Object Name -cmatch $PackageFamilyNametrimRegex |Sort-Object -Descending -Property LastWriteTime |Select-Object -Unique -First 1 
$LastPackage1 = Get-ChildItem -Path $SavePathRoot\$ProductID\ | Where-Object Name -cmatch $PackageFamilyNametrimRegex |Sort-Object -Descending -Property LastWriteTime |Select-Object -Skip 1 |Select-Object -Unique -First 1



If ($NoLink -eq $false){
  $error.clear()
  Try {
  Add-OutputBoxLine -Message "==> Trying to install $LastPackage ..."
  Add-AppxPackage -Path $SavePathRoot\$ProductID\$LastPackage -EA Stop
  if (!$error){  Add-OutputBoxLine-Green -Message "==> Succesfull restored $PackageFamilyNametrimRegex" 
  $error.clear()
  (Get-Content -Path $scriptPath\RestoreAppList.ps1) | Where-Object {$_ -notmatch "$PackageFamilyName"} | Set-Content -Path $scriptPath\RestoreAppList.ps1 -Force 
  If (test-path "$SavePathRoot\$ProductID"){Remove-Item -Path "$SavePathRoot\$ProductID" -force -recurse}
  dotInclude 'RestoreAppList.ps1'
  $error.clear()
  }
  }
  Catch{
  if ($error){  Add-OutputBoxLine-Red -Message "==> Unable to install first file $LastPackage"
  $error.clear()}
  Add-OutputBoxLine -Message "==> Trying to install second file $LastPackage1 ..."               
  Add-AppxPackage -Path $SavePathRoot\$ProductID\$LastPackage1 -EA Stop
  if (!$error){Add-OutputBoxLine-Green -Message "==> Succesfull restored $PackageFamilyNametrimRegex"
  $error.clear()
  (Get-Content -Path $scriptPath\RestoreAppList.ps1) | Where-Object {$_ -notmatch "$PackageFamilyName"} | Set-Content -Path $scriptPath\RestoreAppList.ps1 -Force 
  If (test-path "$SavePathRoot\$ProductID"){Remove-Item -Path "$SavePathRoot\$ProductID" -force -recurse}
  dotInclude 'RestoreAppList.ps1'
  $error.clear()
  }
  }
  Finally 
  {
  if ($error){  Add-OutputBoxLine-Red -Message "==> Unable to install last file $PackageFamilyNametrimRegex"
  $error.clear()
  Add-OutputBoxLine-Red -Message "==> Error installing App, Exiting.."
  }
  (Get-Content -Path $scriptPath\DeleteAppList.ps1) | Where-Object {$_ -notmatch "$PackageFamilyName"} | Set-Content -Path $scriptPath\DeleteAppList.ps1 -Force 
  If (test-path "$SavePathRoot\$ProductID"){Remove-Item -Path "$SavePathRoot\$ProductID" -force -recurse}
  dotInclude 'DeleteAppList.ps1'
  $error.clear()
  }
}

}

#Create Restore Point
Function Create-ComputerRestorePoint{
# enable system restore
Enable-ComputerRestore -Drive "$Env:SystemDrive\" -Verbose
# create a checkpoint with current date as description
Add-OutputBoxLine -Message "==> Creating RestorePoint WindowsBoost..."
Checkpoint-Computer -Description "WindowsBoostRegistry" -RestorePointType MODIFY_SETTINGS
# view checkpoints
Get-ComputerRestorePoint | Format-Table
}

Function Clean-Memory { 
if ($Global:startupvariables) {    # if the startup variable exists we assume the call is to clean up after a script run     
Get-Variable | Where-Object { $Global:startupVariables -notcontains $_.Name } |       
ForEach-Object {        
try { Remove-Variable -Name "$($_.Name)" -Force -Scope "global" -ErrorAction SilentlyContinue -WarningAction SilentlyContinue}        
catch { }       } 
try {Remove-Variable -Name startupvariables  -Scope "Global" -Force -ErrorAction SilentlyContinue }     
catch { }         
New-Variable -name startupVariables -Force -Scope "Global" -value ( Get-Variable | ForEach-Object { $_.Name } )   }  
else {     
New-Variable -name startupVariables -Force -Scope "Global" -value ( Get-Variable | ForEach-Object { $_.Name } )   }                           
}

#Optional fixes/cleans:
Function Uninstall-OneDrive {

    Add-OutputBoxLine -Message "==> Checking for pre-existing files/folders located in the OneDrive folders..." 
    Start-sleep 2
    $progressBar1.Maximum = 8
    $progressBar1.Step = 1
    $progressBar1.Value = 1
    Start-Sleep 1
    If (Test-Path "$env:USERPROFILE\OneDrive\*") {
        Add-OutputBoxLine -Message "==> Files found within the OneDrive folder!" 
        Add-OutputBoxLine -Message "==> Checking to see if a folder named OneDriveBackupFiles exists." 
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
        Add-OutputBoxLine -Message "==> Proceeding with the removal of OneDrive..." 
        Start-Sleep 1
    }
    Else {
        Add-OutputBoxLine -Message "==> Either the OneDrive folder does not exist or there are no files to be found in the folder. Proceeding..." 
        Start-Sleep 1
        Add-OutputBoxLine -Message "==> Enabling the Group Policy 'Prevent the usage of OneDrive for File Storage'." 
        $OneDriveKey = 'HKLM:Software\Policies\Microsoft\Windows\OneDrive'
        If (!(Test-Path $OneDriveKey)) {
            Mkdir $OneDriveKey
            New-ItemProperty $OneDriveKey -Name DisableFileSyncNGSC -PropertyType DWord -Value '1' -Force
            New-ItemProperty $OneDriveKey -Name DisableFileSync -PropertyType DWord -Value '1' -Force
            New-ItemProperty $OneDriveKey -Name DisableLibrariesDefaultSaveToOneDrive -PropertyType DWord -Value '1' -Force
            New-ItemProperty $OneDriveKey -Name DisableMeteredNetworkFileSync -PropertyType DWord -Value '1' -Force
            
        }
        New-ItemProperty $OneDriveKey -Name DisableFileSyncNGSC -Value '1' -Force
        New-ItemProperty $OneDriveKey -Name DisableFileSyncNGSC -PropertyType DWord -Value '1' -Force
        New-ItemProperty $OneDriveKey -Name DisableFileSync -PropertyType DWord -Value '1' -Force
        New-ItemProperty $OneDriveKey -Name DisableLibrariesDefaultSaveToOneDrive -PropertyType DWord -Value '1' -Force
        New-ItemProperty $OneDriveKey -Name DisableMeteredNetworkFileSync -PropertyType DWord -Value '1' -Force
    }
$progressBar1.PerformStep()
Add-OutputBoxLine -Message "==> Uninstalling OneDrive. Please wait..." 
    
    New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
    $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
    $ExplorerReg1 = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
    $ExplorerReg2 = "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
	Stop-Process -Name "OneDrive*" -Force
	Start-Sleep 2
$progressBar1.PerformStep()
	If (!(Test-Path $onedrive)) {
		$onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
	}
	Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
	Start-Sleep 2
$progressBar1.PerformStep()
    Add-OutputBoxLine -Message "==> Stopping explorer..." 
    Start-Sleep 1
    $progressBar1.PerformStep()
	.\taskkill.exe /F /IM explorer.exe
	Start-Sleep 3
$progressBar1.PerformStep()
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
        $progressBar1.PerformStep()
        Add-OutputBoxLine -Message "==> Removing OneDrive from windows explorer"
        If (!(Test-Path $ExplorerReg1)) {
            New-Item $ExplorerReg1
        }
        Set-ItemProperty $ExplorerReg1 System.IsPinnedToNameSpaceTree -Value 0
        New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name DisableFileSyncNGSC -PropertyType DWord -Value '1' -Force 
        If (!(Test-Path $ExplorerReg2)) {
            New-Item $ExplorerReg2
        }
        Set-ItemProperty $ExplorerReg2 System.IsPinnedToNameSpaceTree -Value 0
        New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name DisableFileSyncNGSC -PropertyType DWord -Value '1' -Force
        $progressBar1.PerformStep()
        Add-OutputBoxLine -Message "==> Restarting Explorer that was shut down before."
        Start-Process explorer.exe -NoNewWindow
        $progressBar1.PerformStep()      
        Remove-item env:OneDrive
        Remove-PSDrive HKCR  
}

Function Delete-ComputerRestorePoint{

	[CmdletBinding(SupportsShouldProcess=$True)]param(  
	    [Parameter(
	        Position=0, 
	        Mandatory=$true, 
	        ValueFromPipeline=$true
		)]
	    $restorePoints
	)
Add-OutputBoxLine -Message "==> Removing Restore Points older than 14 days..."
	begin{
		$fullName="SystemRestore.DeleteRestorePoint"
		#check if the type is already loaded
		$isLoaded=([AppDomain]::CurrentDomain.GetAssemblies() | foreach {$_.GetTypes()} | where {$_.FullName -eq $fullName}) -ne $null
		if (!$isLoaded){
			$SRClient= Add-Type   -memberDefinition  @"
		    	[DllImport ("Srclient.dll")]
		        public static extern int SRRemoveRestorePoint (int index);
"@  -Name DeleteRestorePoint -NameSpace SystemRestore -PassThru
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
Add-OutputBoxLine -Message "==> Uninstall Windows 10 built-in apps..." 

        $CustomizeForm = New-Object System.Windows.Forms.Form
        $CustomizeForm.ClientSize = '520,600'
        $CustomizeForm.Text = "Windows 10 Built-in App Remove list"
        $CustomizeForm.TopMost = $false
        $CustomizeForm.AutoScroll = $true

        $SelectAll = New-Object System.Windows.Forms.Button
        $SelectAll.Text = "Select-All"
        $SelectAll.AutoSize = $true
        $SelectAll.Location = New-Object System.Drawing.Point(280, 5)
        $CustomizeForm.controls.Add($SelectAll)
        
        $SelectNone = New-Object System.Windows.Forms.Button
        $SelectNone.Text = "Select-None"
        $SelectNone.AutoSize = $true
        $SelectNone.Location = New-Object System.Drawing.Point(360, 5)
        $CustomizeForm.controls.Add($SelectNone)

        $DeleteList = New-Object System.Windows.Forms.Button
        $DeleteList.Text = "Delete Windows 10 Built-in Apps"
        $DeleteList.AutoSize = $true
        $DeleteList.Location = New-Object System.Drawing.Point(17, 5)
        $CustomizeForm.controls.Add($DeleteList)
   
        $InstalledInList = Get-AppxPackage | Where-Object PackageFamilyName -cmatch $global:BloatwareRegex| Where Status -cmatch 'Ok' | Select-Object -ExpandProperty PackageFamilyName -Unique
        $InstalledInListRegex = $InstalledInList -join '|'
        If ($InstalledInList){
        (Get-Content -Path $scriptPath\DeleteAppList.ps1) | Where-Object {$_ -notmatch "$InstalledInListRegex"} | Set-Content -Path $scriptPath\DeleteAppList.ps1
         dotInclude 'DeleteAppList.ps1'
        }
        
        $SelectAll.Add_Click({
        @($CustomizeForm.controls) | ForEach {
        if ($_ -is [System.Windows.Forms.CheckBox] -and $_.Checked -ne $true) {
           $_.Checked = $true
           }
        }       
        })

        $SelectNone.Add_Click({
        @($CustomizeForm.controls) | ForEach {
        if ($_ -is [System.Windows.Forms.CheckBox] -and $_.Checked -ne $false) {
           $_.Checked = $false
           }
        }       
        })
      
        $DeleteList.Add_Click( {
                #$ErrorActionPreference = 'SilentlyContinue'  
               
               If((Test-Path -Path $scriptPath\DeleteAppList.ps1) -and (Select-String -Path $scriptPath\DeleteAppList.ps1 -Pattern "global:Bloatware" -SimpleMatch -Quiet)) {
               (Get-Content -Path $scriptPath\DeleteAppList.ps1) | Where-Object {$_ -notmatch "\)"} | Set-Content -Path $scriptPath\DeleteAppList.ps1 -Force 
                 @($CustomizeForm.controls) | ForEach {
                    if ($_ -is [System.Windows.Forms.CheckBox] -and $_.Enabled -and $_.Checked) {
                "    ""$(Get-AppxPackage $($_.Text)| Select-Object -ExpandProperty PackageFamilyName -Unique)""" | Out-File -FilePath $scriptPath\DeleteAppList.ps1 -Append -Encoding utf8
                    }
                }
                ')' | Out-File -FilePath $scriptPath\DeleteAppList.ps1 -Append -Encoding utf8
                }
                else{
                '$global:Bloatware = @(' | Out-File -FilePath $scriptPath\DeleteAppList.ps1 -Append -Encoding utf8
                @($CustomizeForm.controls) | ForEach {
                    if ($_ -is [System.Windows.Forms.CheckBox] -and $_.Enabled -and $_.Checked) {
                "    ""$(Get-AppxPackage $($_.Text)| Select-Object -ExpandProperty PackageFamilyName -Unique)""" | Out-File -FilePath $scriptPath\DeleteAppList.ps1 -Append -Encoding utf8
                    }
                }
                ')' | Out-File -FilePath $scriptPath\DeleteAppList.ps1 -Append -Encoding utf8
                }

                #Over-ride the white/blacklist with the newly saved custom list
                dotInclude 'DeleteAppList.ps1'

                #convert to regular expression to allow for the super-useful -match operator
                $global:BloatwareRegex = $global:Bloatware -join '|'
                $global:RestoreListedAppsRegex = $global:RestoreListedApps -join '|'
               
                $Deletetext = Get-AppxPackage | Where-Object PackageFamilyName -cmatch $global:BloatwareRegex| Where Status -cmatch 'Ok' | Select-Object -ExpandProperty PackageFamilyName -Unique
                                 
                Function DebloatBlacklist {
                $error.clear() 

                #Disable People Icon on Taskbar
                If ($global:BloatwareRegex -cmatch 'Microsoft\.*People.*' -and $Deletetext -match 'Microsoft\.*People.*'){
                Add-OutputBoxLine -Message "==> Enabling People Icon on Taskbar..."
                $People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
                If (Test-Path $People) {
                Set-ItemProperty $People -Name PeopleBand -Value 0 -Verbose
                }
                }

                #Disables scheduled tasks XboX
                If ($global:BloatwareRegex -cmatch 'Microsoft\.*Xbox.*|Microsoft\.*Gaming.*' -and $Deletetext -match 'Microsoft\.*Xbox.*|Microsoft\.*Gaming.*'){ 
                Add-OutputBoxLine -Message "==> Disable scheduled tasks..."
                Get-ScheduledTask XblGameSaveTaskLogon | Disable-ScheduledTask
                Get-ScheduledTask XblGameSaveTask | Disable-ScheduledTask
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0
	            If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) {
		        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" | Out-Null
	            }
	            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type DWord -Value 0
                }
                
                #Disables Phone         
                If ($global:BloatwareRegex -cmatch 'Microsoft\.*Phone.*' -and $Deletetext -match 'Microsoft\.*Phone.*' ){ 
                Get-ScheduledTask  UsbCeip | Disable-ScheduledTask 
                Get-ScheduledTask  DmClient | Disable-ScheduledTask
                Get-ScheduledTask  DmClientOnScenarioDownload | Disable-ScheduledTask 
                Add-OutputBoxLine -Message "==> Disable WAP Push Service..."
                 #Enable and start WAP Push Service
                Stop-Service "dmwappushservice" -force
                Set-Service "dmwappushservice" -StartupType Disabled
                }
                #Disables Cortana 
                If ($global:BloatwareRegex -cmatch 'Microsoft\.*Cortana.*|Microsoft\.549981C3F5F10.*' -and $Deletetext -match 'Microsoft\.*Cortana.*|Microsoft\.549981C3F5F10.*'){ 
                Add-OutputBoxLine -Message "==> Disable Cortana..."
                $Search = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
                If (Test-Path $Search) {
                Set-ItemProperty $Search  AllowCortana -Value 0 
                Set-ItemProperty $Search  DisableWebSearch -Value 1
                Set-ItemProperty $Search  AllowSearchToUseLocation -Value 0
                Set-ItemProperty $Search  ConnectedSearchUseWeb -Value 0
                }
                $Cortana1 = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
                $Cortana2 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
                $Cortana3 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
	            If (!(Test-Path $Cortana1)) {
		        New-Item $Cortana1
	            }
	            Set-ItemProperty $Cortana1 AcceptedPrivacyPolicy -Value 0 
	            If (!(Test-Path $Cortana2)) {
		        New-Item $Cortana2
	            }
	            Set-ItemProperty $Cortana2 RestrictImplicitTextCollection -Value 1 
	            Set-ItemProperty $Cortana2 RestrictImplicitInkCollection -Value 1 
	            If (!(Test-Path $Cortana3)) {
		        New-Item $Cortana3
	            }
	            Set-ItemProperty $Cortana3 HarvestContacts -Value 0
                
                $CortanaTaskBar = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
                If (Test-Path $CortanaTaskBar) {
                Set-ItemProperty $CortanaTaskBar -Name ShowCortanaButton -Value 0 -Verbose
                }
                }

                #Disables OneDrive 
                If ($global:BloatwareRegex -match 'Microsoft\.*skydrive.*' -and $Deletetext -match 'Microsoft\.*skydrive.*'){
                Uninstall-OneDrive}

                #Changes Mixed Reality Portal Key 'FirstRunSucceeded' to 1
                If ($global:BloatwareRegex -cmatch 'Microsoft\.*MixedReality.*' -and $Deletetext -match 'Microsoft\.*MixedReality.*'){ 
                Add-OutputBoxLine -Message "==> Setting Mixed Reality Portal value to 0..."
                $Holo = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic"
                If (Test-Path $Holo) {
                Set-ItemProperty $Holo  FirstRunSucceeded -Value 0
                }
                }

                If ($global:BloatwareRegex -cmatch 'Microsoft\.*3D*' -and $Deletetext -match 'Microsoft\.*3D*'){ 
                Add-OutputBoxLine -Message "==> Delete 3D Objects from Explorer 'My Computer' submenu..."
                $Objects32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
                $Objects64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
                If (!(Test-Path $Objects32)) {
                New-Item $Objects32
                }
                If (!(Test-Path $Objects64)) {
                New-Item $Objects64
                }
                }

                If ($global:BloatwareRegex -match 'Microsoft\.*skype.*' -and $Deletetext -match 'Microsoft\.*skype.*'){
                Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name HideSCAMeetNow -Value 1 -Verbose
                Set-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name HideSCAMeetNow -Value 1 -Verbose
                }  
    
                Add-OutputBoxLine -Message "==> Requesting removal of $Deletetext"
                Add-OutputBoxLine -Message "--- This may take a while - please be patient ---"
                Get-AppxPackage | Where-Object PackageFamilyName -cmatch $global:BloatwareRegex | Where Status -cmatch 'Ok' | Remove-AppxPackage -verbose
                Get-AppxProvisionedPackage -Online | Where-Object PackageName -cmatch $global:BloatwareRegex | Where Status -cmatch 'Ok' | Remove-AppxProvisionedPackage -Online -verbose               
                if (!$error){ Add-OutputBoxLine-Green -Message "==> Successfully removed Windows 10 Built-in Apps"}
                $error.clear()      
                }


                If ($null -notmatch $global:BloatwareRegex) {DebloatBlacklist
                #Add-OutputBoxLine-Green -Message "==> Apps removed!"
                }
                else{Add-OutputBoxLine-Red -Message "==> List is Empty"}
               
    
                $CustomizeForm.close()
         })
         
        Function AddAppToCustomizeForm() {
            Param(
                [Parameter(Mandatory)]
                [int] $position,
                [Parameter(Mandatory)]
                [string] $appName,
                [Parameter(Mandatory)]
                [bool] $enabled,
                [Parameter(Mandatory)]
                [bool] $checked,
                [string] $Rednotes,
                [string] $notes
               
            )

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(115, (40 + $position * 16))
            $label.Text = $notes
            $label.Width = 160
            $label.Height = 16
            $label.TextAlign = [System.Drawing.ContentAlignment]::TopLeft
            $CustomizeForm.controls.Add($label)

            $label2 = New-Object System.Windows.Forms.Label
            $label2.Location = New-Object System.Drawing.Point(17, (40 + $position * 16))
            $label2.Text = $Rednotes
            $label2.Width = 160
            $label2.Height = 16
            $label2.TextAlign = [System.Drawing.ContentAlignment]::TopLeft
            $label2.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#FF0000")
            $CustomizeForm.controls.Add($label2)

            $Checkbox = New-Object System.Windows.Forms.CheckBox
            $Checkbox.Text = $appName
            $Checkbox.Location = New-Object System.Drawing.Point(280, (40 + $position * 16))
            $Checkbox.Autosize = 1;
            $Checkbox.Checked = $checked
            $Checkbox.Enabled = $enabled
            #$Checkbox.TextContentAlignment = [System.Drawing.ContentAlignment]::TopLeft
            $Checkbox.CheckAlign = [System.Drawing.ContentAlignment]::TopLeft
            $CustomizeForm.controls.Add($CheckBox)
        }
        
        $Installed = @( (Get-AppxPackage).Name )
        #$AllUsers = @( (Get-AppxPackage -AllUsers).PackageFamilyName )
        $InstalledCortana = (@( (Get-AppxPackage).Name ) -cmatch 'Microsoft.549981C3F5F10')

        [int]$checkboxCounter = 0

        ForEach ( $item in $Installed) {
            $string = $NUll
            $string2 = $NUll
            if ( $null -notmatch $NonRemovables -and $NonRemovables -cmatch $item ) {continue}
            #if ( $null -notmatch $global:WhiteListedAppsRegex -and $item -cmatch $global:WhiteListedAppsRegex ) { continue }
            #if ( $null -notmatch $global:BloatwareRegex -and $item -cmatch $global:BloatwareRegex ) { continue }
            #if ( $null -notmatch $AllUsers -and $AllUsers -cmatch $item) { continue }
            if ( $null -notmatch $Installed -and $Installed -cmatch $item) { $string += " Installed" }
            if ( $null -notmatch $InstalledCortana -and $InstalledCortana -cmatch $item) { $string += " (Cortana)" }
            if ( $null -notmatch $PersonalNonRemovables -and $PersonalNonRemovables -cmatch $item) {$string2 += "Not Recommended "}
            #if ( $null -notmatch $Online -and $Online -cmatch $item) { $string += " Online" }
            AddAppToCustomizeForm $checkboxCounter $item $true $false $string2 $string
            ++$checkboxCounter
        }
        
        [void]$CustomizeForm.ShowDialog()

<# Disable Windows Store Automatic Updates
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
#>


}

Function Appx-Restore{
Add-OutputBoxLine -Message "==> Restoring Windows 10 built-in apps..." 
        
        $CustomizeForm1 = New-Object System.Windows.Forms.Form
        $CustomizeForm1.ClientSize = '420,600'
        $CustomizeForm1.Text = "Windows 10 Built-in App Restore list"
        $CustomizeForm1.TopMost = $false
        $CustomizeForm1.AutoScroll = $true

        $SelectAll1 = New-Object System.Windows.Forms.Button
        $SelectAll1.Text = "Select-All"
        $SelectAll1.AutoSize = $true
        $SelectAll1.Location = New-Object System.Drawing.Point(250, 5)
        $CustomizeForm1.controls.Add($SelectAll1)
        
        $SelectNone1 = New-Object System.Windows.Forms.Button
        $SelectNone1.Text = "Select-None"
        $SelectNone1.AutoSize = $true
        $SelectNone1.Location = New-Object System.Drawing.Point(330, 5)
        $CustomizeForm1.controls.Add($SelectNone1)

        $RestoreList = New-Object System.Windows.Forms.Button
        $RestoreList.Text = "Restore Windows 10 Built-in Apps"
        $RestoreList.AutoSize = $true
        $RestoreList.Location = New-Object System.Drawing.Point(17, 5)
        $CustomizeForm1.controls.Add($RestoreList)

        #$NotInstalledInList = Get-AppxPackage | Where-Object PackageFamilyName -cmatch $global:RestoreListedAppsRegex| Where Status -notmatch 'Ok' | Select-Object -ExpandProperty PackageFamilyName -Unique
        $InstalledInList = Get-AppxPackage | Where-Object PackageFamilyName -cmatch $global:RestoreListedAppsRegex| Where Status -cmatch 'Ok' | Select-Object -ExpandProperty PackageFamilyName -Unique
        $InstalledInListRegex = $InstalledInList -join '|'
        If ($InstalledInList){
        (Get-Content -Path $scriptPath\RestoreAppList.ps1) | Where-Object {$_ -notmatch "$InstalledInListRegex"} | Set-Content -Path $scriptPath\RestoreAppList.ps1
         dotInclude 'RestoreAppList.ps1'
        }

        $SelectAll1.Add_Click({
        @($CustomizeForm1.controls) | ForEach {
        if ($_ -is [System.Windows.Forms.CheckBox] -and !$_.Checked) {
           $_.Checked = $true
           }
        }       
        })

        $SelectNone1.Add_Click({
        @($CustomizeForm1.controls) | ForEach {
        if ($_ -is [System.Windows.Forms.CheckBox] -and $_.Checked) {
           $_.Checked = $false
           }
        }       
        })

       $RestoreList.Add_Click( {
                #$ErrorActionPreference = 'SilentlyContinue'
               If((Test-Path -Path $scriptPath\RestoreAppList.ps1) -and (Select-String -Path $scriptPath\RestoreAppList.ps1 -Pattern "global:RestoreListedApps" -SimpleMatch -Quiet)){ 
               (Get-Content -Path $scriptPath\RestoreAppList.ps1) | Where-Object {$_ -notmatch "\)"} | Set-Content -Path $scriptPath\RestoreAppList.ps1 -Force 
                 @($CustomizeForm1.controls) | ForEach {
                    if ($_ -is [System.Windows.Forms.CheckBox] -and $_.Enabled -and $_.Checked) {
                       "    ""$($_.Text)""" | Select -Unique | Out-File -FilePath $scriptPath\RestoreAppList.ps1 -Append -Encoding utf8
                    }
                }
                ')' | Out-File -FilePath $scriptPath\RestoreAppList.ps1 -Append -Encoding utf8
                }
                else{
                '$global:RestoreListedApps = @(' | Out-File -FilePath $scriptPath\RestoreAppList.ps1 -Encoding utf8
                @($CustomizeForm1.controls) | ForEach {
                    if ($_ -is [System.Windows.Forms.CheckBox] -and $_.Enabled -and $_.Checked) {
                       "    ""$($_.Text)""" | Select -Unique | Out-File -FilePath $scriptPath\RestoreAppList.ps1 -Append -Encoding utf8
                    }
                }
                ')' | Out-File -FilePath $scriptPath\RestoreAppList.ps1 -Append -Encoding utf8
                }    
                #Over-ride the white/blacklist with the newly saved custom list
                dotInclude 'RestoreAppList.ps1'

                #convert to regular expression to allow for the super-useful -match operator
                $global:BloatwareRegex = $global:Bloatware -join '|'
                $global:RestoreListedAppsRegex = $global:RestoreListedApps -join '|'

                #Stop-Service 'WSearch' -Force
                #Set-Service 'WSearch' -StartupType AutomaticDelayedStart 
                   
                #$RestoreListFamily = Get-AppxPackage -AllUsers | Where-Object $global:BloatwareRegex -cmatch $global:RestoreListedAppsRegex | Select-Object -ExpandProperty PackageFamilyName -Verbose 
                #$RestoreListName = Get-AppxPackage -AllUsers | Where-Object Name -cmatch $global:RestoreListedAppsRegex | Select-Object -ExpandProperty Name -Verbose  
                $RestoreText = ($global:RestoreListedApps | Select -Unique )
                If ($null -notmatch $global:RestoreListedAppsRegex) {  
                Add-OutputBoxLine -Message "==> Requesting restore of $RestoreText ..."
                $global:RestoreListedApps| Select -Unique | foreach {Download-AppxPackage $_ | Select -unique}
                }
                else{Add-OutputBoxLine-Red -Message "==> RestoreList is Empty"}

                #Enables bloatware applications               
                Add-OutputBoxLine -Message "==> Adding Registry key to allow apps to return..."
                $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
                If (!(Test-Path $registryPath)) {
                New-Item $registryPath 
                }
                Set-ItemProperty $registryPath  DisableWindowsConsumerFeatures -Value 0 
                 
                #Re-enables Apps Regedit:
                If ($global:RestoreListedAppsRegex -cmatch 'Microsoft\.*People.*' -and $InstalledInList -cmatch 'Microsoft\.*People.*' ){
                Add-OutputBoxLine -Message "==> Enabling People Icon on Taskbar..."
                $People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
                If (Test-Path $People) {
                Set-ItemProperty $People -Name PeopleBand -Value 1 -Verbose
                }
                }

                If ($global:RestoreListedAppsRegex -cmatch 'Microsoft\.*Xbox.*' -and $InstalledInList -cmatch 'Microsoft\.*Xbox.*'){ 
                #Re-enables scheduled tasks that were disabled when running the Debloat switch
                Add-OutputBoxLine -Message "==> Enabling scheduled tasks that were disabled..."
                Get-ScheduledTask XblGameSaveTaskLogon | Enable-ScheduledTask 
                Get-ScheduledTask  XblGameSaveTask | Enable-ScheduledTask 
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 1
	            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR"
                }
                          
                If ($global:RestoreListedAppsRegex -cmatch 'Microsoft\.*Phone.*' -and $InstalledInList -cmatch 'Microsoft\.*Phone.*'){ 
                Get-ScheduledTask  UsbCeip | Enable-ScheduledTask 
                Get-ScheduledTask  DmClient | Enable-ScheduledTask 
                Get-ScheduledTask  DmClientOnScenarioDownload | Enable-ScheduledTask 
                Add-OutputBoxLine -Message "==> Re-enabling and starting WAP Push Service..."
                 #Enable and start WAP Push Service
                Set-Service "dmwappushservice" -StartupType Automatic
                Start-Service "dmwappushservice"
                }

                If ($global:RestoreListedAppsRegex -cmatch 'Microsoft\.*Cortana.*|Microsoft\.549981C3F5F10.*' -and $InstalledInList -cmatch 'Microsoft\.*Cortana.*|Microsoft\.549981C3F5F10.*'){ 
                Add-OutputBoxLine -Message "==> Re-enabling Cortana to be used in your Windows Search..."
                $Search = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
                If (Test-Path $Search) {
                Set-ItemProperty $Search  AllowCortana -Value 1 
                Set-ItemProperty $Search  DisableWebSearch -Value 0
                Set-ItemProperty $Search  AllowSearchToUseLocation -Value 1
                Set-ItemProperty $Search  ConnectedSearchUseWeb -Value 1
                }
                 $Cortana1 = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
                 $Cortana2 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
                 $Cortana3 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
	                If (!(Test-Path $Cortana1)) {
		            New-Item $Cortana1
	                }
	                Set-ItemProperty $Cortana1 AcceptedPrivacyPolicy -Value 1 
	                If (!(Test-Path $Cortana2)) {
		            New-Item $Cortana2
	                }
	                Set-ItemProperty $Cortana2 RestrictImplicitTextCollection -Value 0 
	                Set-ItemProperty $Cortana2 RestrictImplicitInkCollection -Value 0 
	                If (!(Test-Path $Cortana3)) {
		            New-Item $Cortana3
	                }
	                Set-ItemProperty $Cortana3 HarvestContacts -Value 1 

                $CortanaTaskBar = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
                If (Test-Path $CortanaTaskBar) {
                Set-ItemProperty $CortanaTaskBar -Name ShowCortanaButton -Value 1 -Verbose
                }
                }

                If ($global:RestoreListedAppsRegex -match 'Microsoft\.*skydrive.*' -and $InstalledInList -cmatch 'Microsoft\.*skydrive.*'){
                Add-OutputBoxLine -Message "==> Restore OneDrive in windows explorer..."
                If (!(Test-Path $ExplorerReg1)) {
                New-Item $ExplorerReg1
                }
                Set-ItemProperty $ExplorerReg1 System.IsPinnedToNameSpaceTree -Value 1
                New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name DisableFileSyncNGSC -PropertyType DWord -Value '0' -Force
                If (!(Test-Path $ExplorerReg2)) {
                New-Item $ExplorerReg2
                }
                Set-ItemProperty $ExplorerReg2 System.IsPinnedToNameSpaceTree -Value 1
                New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name DisableFileSyncNGSC -PropertyType DWord -Value '0' -Force
                }

                If ($global:RestoreListedAppsRegex -cmatch 'Microsoft\.*MixedReality.*' -and $InstalledInList -cmatch 'Microsoft\.*MixedReality.*'){ 
                Add-OutputBoxLine -Message "==> Setting Mixed Reality Portal value to 1..."
                $Holo = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic"
                If (Test-Path $Holo) {
                Set-ItemProperty $Holo  FirstRunSucceeded -Value 1 
                }
                }

                If ($global:RestoreListedAppsRegex -cmatch 'Microsoft\.*3D*' -and $InstalledInList -cmatch 'Microsoft\.*3D*'){ 
                Add-OutputBoxLine -Message "==> Restoring 3D Objects from Explorer 'My Computer' submenu..."
                $Objects32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
                $Objects64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
                If (!(Test-Path $Objects32)) {
                New-Item $Objects32
                }
                If (!(Test-Path $Objects64)) {
                New-Item $Objects64
                }
                }

                If ($global:RestoreListedAppsRegex -match 'Microsoft\.*skype.*' -and $InstalledInList -cmatch 'Microsoft\.*skype.*'){
                Remove-ItemProperty -Name HideSCAMeetNow -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force
                Remove-ItemProperty -Name HideSCAMeetNow -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force
                }

                #Register All
                        
                #Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}
                $CustomizeForm1.close()
                
            })

        Function AddAppToCustomizeForm1() {
            Param(
                [Parameter(Mandatory)]
                [int] $position,
                [Parameter(Mandatory)]
                [string] $appName,
                [Parameter(Mandatory)]
                [bool] $enabled,
                [Parameter(Mandatory)]
                [bool] $checked,

                [string] $notes
            )

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(2, (30 + $position * 16))
            $label.Text = $notes
            $label.Width = 60
            $label.Height = 16
            $Label.TextAlign = [System.Drawing.ContentAlignment]::TopRight
            $CustomizeForm1.controls.Add($label)

            $Checkbox = New-Object System.Windows.Forms.CheckBox
            $Checkbox.Text = $appName
            $Checkbox.Location = New-Object System.Drawing.Point(80, (30 + $position * 16))
            $Checkbox.Autosize = 1;
            $Checkbox.Checked = $checked
            $Checkbox.Enabled = $enabled
            $CustomizeForm1.controls.Add($CheckBox)
        }
        

        $Installed = @( (Get-AppxPackage).PackageFamilyName)
        [int]$checkboxCounter1 = 0
     
        ForEach ( $item in $global:Bloatware ) {
            $string = "Deleted "
            if ( $null -notmatch $NonRemovables -and $NonRemovables -cmatch $item ) { $string += " Suggest" }
            if ( $null -notmatch $Installed  -and $Installed  -cmatch $item) {continue}
            #if ( $null -notmatch $global:RestoreListedApps -and $item -cmatch $global:RestoreListedApps) {$string += "Fail Restore" }
            if ( $null -notmatch $PersonalNonRemovables -and $PersonalNonRemovables -cmatch $item ) {$string += "Suggest"}
            AddAppToCustomizeForm1 $checkboxCounter $item $true $true $string
            ++$checkboxCounter
        }
         ForEach ( $item in $global:RestoreListedApps) {
            $string = "Failed"
            #if ( $null -notmatch $NonRemovables -and $NonRemovables -cmatch $item ) { $string += " Conflict" }
            if ( $null -notmatch $Installed  -and $Installed  -cmatch $item) {continue}
            #if ( $null -notmatch $PersonalNonRemovables -and $PersonalNonRemovables -cmatch $item ) {$string += "Suggest"}
            AddAppToCustomizeForm1 $checkboxCounter $item $true $true $string
            ++$checkboxCounter
        }
     
       [void]$CustomizeForm1.ShowDialog()


#Add-OutputBoxLine-Green -Message "==> Successfully restored Windows 10 Built-in Apps" 
}

Function Junction-Updatefolder{
Add-OutputBoxLine -Message "==> Checking if already moved..." 

if ((Get-Item -Path "$env:windir\SoftwareDistribution\" -Force).LinkType -ne "Junction") {
Start-Service wuauserv 

$Getvolume = Get-Volume | Where-Object FileSystemType -ne Unknown | Where-Object DriveLetter -ne $Null| Select-Object -Property @{L='Diskletter';E={"{0:N2}" -f ($_.Driveletter)}}, FileSystemLabel, FileSystemType, @{L='Size Remaining';E={"{0:N2} GB" -f ($_.SizeRemaining /1GB)}}| Sort-Object -Property Driveletter | Format-Table -AutoSize | Out-String 
Add-OutputBoxLine-Yellow($Getvolume)

$diskletter = "."
$lettercheck = $false
$NTFScheck = $false

Add-OutputBoxLine -Message "==> Set DiskLetter for new location Windows update folder"


Do {
    Add-Type -AssemblyName Microsoft.VisualBasic
    $diskletter =[Microsoft.VisualBasic.Interaction]::InputBox("Enter Diskletter`n`nSelect a NTFS Disk", "Diskletter" )
    (New-Object -ComObject WScript.Shell).AppActivate(($diskletter).MainWindowTitle)
    if (Get-Volume | Where-Object Driveletter -EQ $diskletter | Where-Object FileSystemType -NE Unknown) 
    {$lettercheck = $true} else {$lettercheck = $false 
    Add-OutputBoxLine-Red -Message "No Drive found"}
    if (Get-Volume -DriveLetter ${diskletter}  | Where-Object FileSystemType -eq NTFS) 
    {$NTFScheck = $true} elseif ($lettercheck -eq $true) {$NTFScheck = $false
    Add-OutputBoxLine-Red -Message "No NTFS FileType, Please Format to NTFS or choose other Drive"}
    Start-Sleep -milliseconds 100
  }until (($lettercheck -eq $true) -and ($NTFScheck -eq $true) -or ($diskletter -eq ""))

if ($lettercheck -eq $true -and $NTFScheck -eq $true){
Add-OutputBoxLine -Message "==> DriveLetter is set to: $diskletter" 
Start-Sleep 2
$progressBar1.Maximum = 13
$progressBar1.Step = 1
$progressBar1.Value = 1

Stop-Service wuauserv -Force 
$progressBar1.PerformStep()
Stop-Service UsoSvc -Force 
$progressBar1.PerformStep()
Stop-Service cryptSvc -Force 
$progressBar1.PerformStep()
Stop-Service BITS -Force 
$progressBar1.PerformStep()
Stop-Service msiserver -Force 
$progressBar1.PerformStep()
robocopy $env:HOMEDRIVE\Windows\SoftwareDistribution "${diskletter}:\NewWindowsUpdateFolder\" /copyall /e
$progressBar1.PerformStep()
Remove-Item -Path "$env:windir\SoftwareDistribution\" -Force -Recurse
$progressBar1.PerformStep()
New-Item -ItemType Junction -Path "$env:windir\SoftwareDistribution" -Target "${diskletter}:\NewWindowsUpdateFolder\"
$progressBar1.PerformStep()
Start-Service wuauserv 
$progressBar1.PerformStep()
Start-Service UsoSvc 
$progressBar1.PerformStep()
Start-Service cryptSvc 
$progressBar1.PerformStep()
Start-Service BITS 
$progressBar1.PerformStep()
Start-Service msiserver 
$progressBar1.PerformStep()
Add-OutputBoxLine-Green -Message "==> Successfully moved Windows Update Folder" 
}
if ($diskletter -eq "") {Add-OutputBoxLine -Message "==> User Cancelled the operation"}
}
else {
$progressBar1.Value = 100
Add-OutputBoxLine-Green -Message "==> Already moved Windows Update Folder" 
}
}

Function Restore-Updatefolder {
Add-OutputBoxLine -Message "==> Restoring Windows update folder..." 
Start-sleep 2
$progressBar1.Maximum = 6
$progressBar1.Step = 1
$progressBar1.Value = 1
Stop-Service wuauserv -Force 
$progressBar1.PerformStep()
Stop-Service TrustedInstaller -Force 
$progressBar1.PerformStep()
(Get-Item "$env:windir\SoftwareDistribution\").Target | Remove-Item -Recurse -Force
$progressBar1.PerformStep()
Remove-Item -Path "$env:windir\SoftwareDistribution\" -Recurse -Force
$progressBar1.PerformStep()
Start-Service wuauserv 
$progressBar1.PerformStep()
Start-Service TrustedInstaller 
$progressBar1.PerformStep()
Add-OutputBoxLine-Green -Message "==> Successfully restored Windows Update folder" 
}

Function QuickScan-Defender {
Add-OutputBoxLine -Message "==> Running Windows Defender QuickScan..."
Add-OutputBoxLine -Message "--- This may take a while - please be patient ---"
$PUA = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine'
        If (!(Test-Path $PUA)) {
            Mkdir $PUA
            New-ItemProperty -Path $PUA -Name 'MpEnablePus' -PropertyType DWord -Value '1' -Force
        }
Else {New-ItemProperty -Path $PUA -Name 'MpEnablePus' -PropertyType DWord -Value '1' -Force}

Update-MpSignature
Start-MpScan -ScanType QuickScan
$progressBar1.Value = 100
Add-OutputBoxLine-Green -Message "==> QuickScan finished"  }

Function Reboot-System {
Remove-PSDrive HKCR 
Start-Sleep 1
Stop-Log
if ($ButtonClick -eq $true){Send-Mail}
Start-Sleep 1
Add-OutputBoxLine -Message "==> Initiating reboot."
Start-Sleep 2
Clear-History 
Clean-Memory
Restart-Computer
}

#Boost:
Function Disable-Services{


$services = @(
     # See https://virtualfeller.com/2017/04/25/optimize-vdi-windows-10-services-original-anniversary-and-creator-updates/

    # Connected User Experiences and Telemetry
    'DiagTrack',

    # Data Usage service
    'DusmSvc',

    # SSDP Discovery (UPnP)
    'SSDPSRV',
    'upnphost',

    # Superfetch
    'SysMain',

    # Adobe:
    'AdobeARMservice',
    
    # Black Viper 'Safe for DESKTOP' services.
    # See http://www.blackviper.com/service-configurations/black-vipers-windows-10-service-configurations/

    #SAFE Desktop/Laptop
    'ALG',
    #'CscService',
    'dmwappushsvc',
    'Fax',
    'FrameServer',
    'HvHost',
    'icssvc',
    'irmon',
    'lfsvc',
    'MapsBroker',
    'MSiSCSI',
    'NetTcpPortSharing',
    'PeerDistSvc',
    'PhoneSvc',
    'RetailDemo',
    'RpcLocator',
    'ScDeviceEnum',
    'SCPolicySvc',
    'SEMgrSvc',
    'SharedAccess',
    'SmsRouter',
    'SNMPTRAP',
    'vmicguestinterface',
    'vmicheartbeat',
    'vmickvpexchange',
    'vmicrdv',
    'vmicshutdown',
    'vmictimesync',
    'vmicvmsession',
    'vmicvss',
    'WinRM',
    'wisvc',
    'WMPNetworkSvc',
    'workfolderssvc',
    'WpcMonSvc',
    'WwanSvc',
    'XblAuthManager',
    'XblGameSave',
    'XboxNetApiSvc'
)

Add-OutputBoxLine -Message "==> Disabling services..." 
foreach ($service in $services) {
    if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Disabled"})){ 
    Stop-Service $service -Force 
    Set-Service $service -StartupType Disabled }
}

$tweakservices = @(
   #Tweaked Desktop
    'AJRouter',
    'AppMgmt',
    #'BTAGService',
    #'BthAvctpSvc',
    #'BthHFSrv',
    #'bthserv',
    'CertPropSvc',
    'iphlpsvc',
    'IpxlatCfgSvc',
    'NaturalAuthentication',
    'NcdAutoSetup',
    'Netlogon',
    'SensorDataService',
    'SensorService',
    'SensrSvc',
    'SessionEnv',
    'TabletInputService',
    'TermService',
    'UmRdpService',
    'wcncsvc',
    'WebClient',
    'WFDSConSvc'
)


If ($PCType -like "*Desktop*") {
Add-OutputBoxLine -Message "==> Disabling desktop services..." 
foreach ($service in $tweakservices) {
    if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Disabled"})){ 
    Stop-Service $service -Force 
    Set-Service $service -StartupType Disabled }
}
}


}

Function Default-ServicesWIN10{

$ServiceWin10Manual= @(
'AJRouter',
'ALG',
'AppIDSvc',
'Appinfo',
'AppMgmt',
'AppReadiness',
'AppXSvc',
'aspnet_state',
'AxInstSV',
'BDESVC',
'Browser',
'BthHFSrv',
'bthserv',
'c2wts',
'CDPSvc',
'CertPropSvc',
'ClipSVC',
'COMSysApp',
'CscService',
'DcpSvc',
'defragsvc',
'DeviceInstall',
'DevQueryBroker',
'diagnosticshub.standardcollector.service',
'DmEnrollmentSvc',
'dot3svc',
'DsmSvc',
'DsRoleSvc',
'DsSvc',
'Eaphost',
'EFS',
'embeddedmode',
'EntAppSvc',
'Fax',
'fdPHost',
'FDResPub',
'fhsvc',
'FontCache3.0.0.0',
'hidserv',
'icssvc',
'IEEtwCollectorService',
'IKEEXT',
'KeyIso',
'KtmRm',
'lfsvc',
'LicenseManager',
'lltdsvc',
'lmhosts',
'MSDTC',
'MSiSCSI',
'msiserver',
'NcaSvc',
'NcbService',
'Setup',
'Netman',
'netprofm',
'NetSetupSvc',
'NetTcpPortSharing',
'NgcCtnrSvc',
'NgcSvc',
'p2pimsvc',
'p2psvc',
'PeerDistSvc',
'PerfHost',
'pla',
'PlugPlay',
'Reg',
'PNRPsvc',
'PolicyAgent',
'PrintNotify',
'QWAVE',
'RasAuto',
'RasMan',
'RetailDemo',
'RpcLocator',
'ScDeviceEnum',
'SCPolicySvc',
'SDRSVC',
'seclogon',
'SensorDataService',
'SensorService',
'SensrSvc',
'SessionEnv',
'SharedAccess',
'smphost',
'SmsRouter',
'SNMPTRAP',
'SSDPSRV',
'SstpSvc',
'StateRepository',
'stisvc',
'StorSvc',
'svsvc',
'swprv',
'TapiSrv',
'TimeBroker',
'TrustedInstaller',
'UI0Detect',
'UmRdpService',
'upnphost',
'UsoSvc',
'VaultSvc',
'vds',
'vmicguestinterface',
'vmicheartbeat',
'vmickvpexchange',
'vmicrdv',
'vmicshutdown',
'vmictimesync',
'vmicvmsession',
'vmicvss',
'vmvss',
'VSS',
'w3logsvc',
'WalletService',
'WAS',
'wbengine',
'WbioSrvc',
'wcncsvc',
'WcsPlugInService',
'WdiServiceHost',
'WdiSystemHost',
'WdNisSvc',
'WebClient',
'Wecsvc',
'WEPHOSTSVC',
'wercplsupport',
'WerSvc',
'WiaRpc',
'ProxySvc',
'WinRM',
'wlidsvc',
'wmiApSrv',
'WMSVC',
'workfolderssvc',
'WPDBusEnum',
'WpnService',
'WSService',
'wuauserv',
'wudfsvc',
'XblAuthManager',
'XblGameSave',
'XboxNetApiSvc'
)

$ServiceWin10Auto= @(
'AppHostSvc',
'AudioEndpointBuilder',
'Audiosrv',
'BFE',
'BITS',
'BrokerInfrastructure',
'CoreMessagingRegistrar',
'CryptSvc',
'DcomLaunch',
'DeviceAssociationService',
'Dhcp',
'DiagTrack',
'dmwappushservice',
'Dnscache',
'DoSvc',
'DPS',
'EventLog',
'EventSystem',
'FontCache',
'ftpsvc',
'gpsvc',
'HomeGroupListener',
'HomeGroupProvider',
'HvHost',
'IISADMIN',
'iphlpsvc',
'iprip',
'LanmanServer',
'LanmanWorkstation',
'LPDSVC',
'LSM',
'MapsBroker',
'MpsSvc',
'MSMQ',
'MSMQTriggers',
'Netlogon',
'NetMsmqActivator',
'NetPipeActivator',
'NetTcpActivator',
'NlaSvc',
'nsi',
'PcaSvc',
'Power',
'ProfSvc',
'RpcEptMapper',
'RpcSs',
'SamSs',
'Schedule',
'SENS',
'ShellHWDetection',
'simptcp',
'SNMP',
'Spooler',
'sppsvc',
'SysMain',
'SystemEventsBroker',
'TabletInputService',
'TermService',
'Themes',
'tiledatamodelsvc',
'TrkWks',
'UserManager',
'vmms',
'W32Time',
'W3SVC',
'Wcmsvc',
'WinDefend',
'Winmgmt',
'WlanSvc',
'WMPNetworkSvc',
'Wms',
'WmsRepair',
'wscsvc',
'WSearch',
'WwanSvc'
)

$ServiceWin10Disabled= @(
'RemoteAccess',
'RemoteRegistry',
'SCardSvr'
)

Add-OutputBoxLine -Message "==> Restore services to default..."
   
    foreach($service in $ServiceWin10Manual)
    {
        try
        {  
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Manual"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Manual 
            }
            
        }
        catch 
        {
            Write-Error $_
        }
    }

    
    foreach($service in $ServiceWin10Auto)
    {
        try
        {
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Automatic"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Automatic 
            Restart-Service $service 
            }
            
        }
        catch 
        {
            Write-Error $_
        }
    }

    
    foreach($service in $ServiceWin10Disabled)
    {
        try
        {
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Disabled"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Disabled 
            }
           
        }
        catch 
        {
            Write-Error $_
        }
    }


}

Function Default-ServicesWIN8{

$ServiceWin8Manual= @(
'AeLookupSvc',
'ALG',
'AppIDSvc',
'Appinfo',
'AppMgmt',
'AppReadiness',
'AppXSvc',
'aspnet_state',
'AxInstSV',
'BDESVC',
'Browser',
'BthHFSrv',
'bthserv',
'c2wts',
'CertPropSvc',
'COMSysApp',
'CscService',
'defragsvc',
'DeviceInstall',
'dot3svc',
'DsmSvc',
'DsRoleSvc',
'Eaphost',
'EFS',
'ehRecvr',
'ehSched',
'Fax',
'fdPHost',
'FDResPub',
'fhsvc',
'FontCache3.0.0.0',
'hidserv',
'hkmsvc',
'IEEtwCollectorService',
'IKEEXT',
'KeyIso',
'KtmRm',
'lfsvc',
'lltdsvc',
'MSDTC',
'MSiSCSI',
'msiserver',
'napagent',
'NcaSvc',
'NcbService',
'NcdAutoSetup',
'Netman',
'netprofm',
'NetTcpPortSharing',
'p2pimsvc',
'p2psvc',
'PeerDistSvc',
'PerfHost',
'pla',
'PlugPlay',
'PNRPAutoReg',
'PNRPsvc',
'PolicyAgent',
'PrintNotify',
'QWAVE',
'RasAuto',
'RasMan',
'RpcLocator',
'ScDeviceEnum',
'SCPolicySvc',
'seclogon',
'SensrSvc',
'SessionEnv',
'smphost',
'SNMPTRAP',
'SSDPSRV',
'SstpSvc',
'stisvc',
'StorSvc',
'svsvc',
'swprv',
'TapiSrv',
'TermService',
'THREADORDER',
'TimeBroker',
'TrustedInstaller',
'UI0Detect',
'UmRdpService',
'upnphost',
'VaultSvc',
'vds',
'vmicguestinterface',
'vmicheartbeat',
'vmickvpexchange',
'vmicrdv',
'vmicshutdown',
'vmictimesync',
'vmicvss',
'vmvss',
'VSS',
'w3logsvc',
'WAS',
'wbengine',
'WbioSrvc',
'wcncsvc',
'WcsPlugInService',
'WdiServiceHost',
'WdiSystemHost',
'WdNisSvc',
'WebClient',
'Wecsvc',
'WEPHOSTSVC',
'wercplsupport',
'WerSvc',
'WiaRpc',
'WinHttpAutoProxySvc',
'WinRM',
'wlidsvc',
'wmiApSrv',
'WMSVC',
'workfolderssvc',
'WPCSvc',
'WPDBusEnum',
'WSService',
'wuauserv',
'wudfsvc'
)

$ServiceWin8Auto= @(
'AppHostSvc',
'AudioEndpointBuilder',
'Audiosrv',
'BFE',
'BITS',
'BrokerInfrastructure',
'CryptSvc',
'DcomLaunch',
'DeviceAssociationService',
'Dhcp',
'diagtrack',
'Dnscache',
'DPS',
'EventLog',
'EventSystem',
'FontCache',
'ftpsvc',
'gpsvc',
'HomeGroupListener',
'HomeGroupProvider',
'IISADMIN',
'iphlpsvc',
'iprip',
'LanmanServer',
'LanmanWorkstation',
'lmhosts',
'LPDSVC',
'LSM',
'MMCSS',
'MpsSvc',
'MSMQ',
'MSMQTriggers',
'Netlogon',
'NetMsmqActivator',
'NetPipeActivator',
'NetTcpActivator',
'NlaSvc',
'nsi',
'PcaSvc',
'Power',
'ProfSvc',
'RpcEptMapper',
'RpcSs',
'SamSs',
'Schedule',
'SENS',
'ShellHWDetection',
'simptcp',
'SNMP',
'Spooler',
'sppsvc',
'SysMain',
'SystemEventsBroker',
'TabletInputService',
'Themes',
'TrkWks',
'W32Time',
'W3SVC',
'Wcmsvc',
'WinDefend',
'Winmgmt',
'WlanSvc',
'WMPNetworkSvc',
'wscsvc',
'WSearch',
'WwanSvc'
)

$ServiceWin8Disabled= @(
'Mcx2Svc',
'MsKeyboardFilter',
'RemoteAccess',
'RemoteRegistry',
'SCardSvr',
'SharedAccess',
'TlntSvr'
)

Add-OutputBoxLine -Message "==> Restore services to default..."   

    foreach($service in $ServiceWin8Manual)
    {
        try
        {
            
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Manual"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Manual 
            }
            
        }
        catch 
        {
            Write-Error $_
        }
    }

   
    foreach($service in $ServiceWin8Auto)
    {
        try
        {
            
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Automatic"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Automatic 
            Restart-Service $service 
            }
            
        }
        catch 
        {
            Write-Error $_
        }
    }

    
    foreach($service in $ServiceWin8Disabled)
    {
        try
        {
            
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Disabled"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Disabled 
            }
            
        }
        catch 
        {
            Write-Error $_
        }
    }

}

Function Default-ServicesWIN7{

$ServiceWin7Manual= @(
'AeLookupSvc',
'ALG',
'AppIDSvc',
'Appinfo',
'AppMgmt',
'AxInstSV',
'BDESVC',
'Browser',
'bthserv',
'CertPropSvc',
'COMSysApp',
'defragsvc',
'dot3svc',
'EapHost',
'EFS',
'Fax',
'fdPHost',
'FontCache3.0.0.0',
'hidserv',
'hkmsvc',
'idsvc',
'IPBusEnum',
'KeyIso',
'KtmRm',
'lltdsvc',
'MSDTC',
'MSiSCSI',
'msiserver',
'napagent',
'Netman',
'netprofm',
'p2pimsvc',
'p2psvc',
'PeerDistSvc',
'PerfHost',
'pla',
'PNRPAutoReg',
'PNRPsvc',
'PolicyAgent',
'ProtectedStorage',
'QWAVE',
'RasAuto',
'RasMan',
'RemoteRegistry',
'RpcLocator',
'SCardSvr',
'SCPolicySvc',
'SDRSVC',
'seclogon',
'SensrSvc',
'SessionEnv',
'SNMPTRAP',
'sppuinotify',
'SSDPSRV',
'SstpSvc',
'swprv',
'TabletInputService',
'TapiSrv',
'TBS',
'THREADORDER',
'TrustedInstaller',
'UI0Detect',
'UmRdpService',
'upnphost',
'VaultSvc',
'vds',
'VSS',
'wbengine',
'WbioSrvc',
'wcncsvc',
'WcsPlugInService',
'WdiServiceHost',
'WdiSystemHost',
'WebClient',
'Wecsvc',
'wercplsupport',
'WerSvc',
'WinHttpAutoProxySvc',
'WinRM',
'wmiApSrv',
'WPCSvc',
'WPDBusEnum',
'wudfsvc'
)

$ServiceWin7Auto= @(
'AudioEndpointBuilder',
'AudioSrv',
'BFE',
'BITS',
'clr_optimization_v2.0.50727_32',
'clr_optimization_v2.0.50727_64',
'CryptSvc',
'CscService',
'DcomLaunch',
'Dhcp',
'Dnscache',
'DPS',
'ehRecvr',
'ehSched',
'eventlog',
'EventSystem',
'FDResPub',
'FontCache',
'gpsvc',
'HomeGroupListener',
'HomeGroupProvider',
'IKEEXT',
'iphlpsvc',
'LanmanServer',
'LanmanWorkstation',
'lmhosts',
'MMCSS',
'MpsSvc',
'Netlogon',
'NlaSvc',
'nsi',
'PcaSvc',
'PlugPlay',
'Power',
'ProfSvc',
'RpcEptMapper',
'RpcSs',
'SamSs',
'Schedule',
'SENS',
'ShellHWDetection',
'Spooler',
'sppsvc',
'stisvc',
'SysMain',
'TermService',
'Themes',
'TrkWks',
'UxSms',
'W32Time',
'WinDefend',
'Winmgmt',
'Wlansvc',
'WMPNetworkSvc',
'wscsvc',
'WSearch',
'wuauserv',
'WwanSvc'
)

Add-OutputBoxLine -Message "==> Restore services to default..."   

    foreach($service in $ServiceWin7Manual)
    {
        try
        {
            
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Manual"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Manual 
            }
            
        }
        catch 
        {
            Write-Error $_
        }
    }

   
    foreach($service in $ServiceWin7Auto)
    {
        try
        {
            
            if ((Get-Service | Where-Object {$_.Name -like $service}) -and (Get-Service $service | Select-Object -Property name,StartType | where-object {$_.StartType -ne "Automatic"})){ 
            Stop-Service $service -Force 
            Set-Service -Name $service -StartupType Automatic 
            Restart-Service $service 
            }
            
        }
        catch 
        {
            Write-Error $_
        }
    }

}

Function Disable-Features{
$features = @(
    #'MediaPlayback',
    'SMB1Protocol',
    'Xps-Foundation-Xps-Viewer',
    'WorkFolders-Client',
    #'WCF-Services45',
    #'NetFx4-AdvSrvs',
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

Add-OutputBoxLine -Message '==> Disabling optional features...' 
foreach ($feature in $features) {
    if((Get-WindowsOptionalFeature -FeatureName $feature -Online).State -eq "Enabled"){
    Disable-WindowsOptionalFeature -Online -FeatureName $feature -NoRestart
    }            
}
#WindowsPackage:
Get-WindowsPackage -Online | Where PackageName -like *Hello-Face* | Remove-WindowsPackage -Online -NoRestart
Get-WindowsPackage -Online | Where PackageName -like *StepsRecorder* | Remove-WindowsPackage -Online -NoRestart

#XPSVIEWER
DISM /Online /Remove-Capability /CapabilityName:XPS.Viewer~~~~0.0.1.0

}

Function Disable-Tasks {
Add-OutputBoxLine -Message "==> Disabling tasks..." 
$tasks = @(
    #'XblGameSaveTaskLogon',
    #'XblGameSaveTask',
    'Consolidator',
    #'UsbCeip',
    #'DmClient',
    #'DmClientOnScenarioDownload',
    'Windows Defender Scheduled Scan',
    'Adobe Acrobat Update Task',
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
Add-OutputBoxLine -Message "==> Enable defrag monthly schedule..." 
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

Function Clean-OldDevice{
Add-OutputBoxLine -Message "==> Remove unplugged device data..." 

Param(
  [array]$FilterByClass,
  [array]$FilterByFriendlyName,
  [switch]$listDevicesOnly,
  [switch]$listGhostDevicesOnly
)

#parameter futzing
$removeDevices = $true
if ($FilterByClass -ne $null) {
    write-host "FilterByClass: $FilterByClass"
}

if ($FilterByFriendlyName -ne $null) {
    write-host "FilterByFriendlyName: $FilterByFriendlyName"
}

if ($listDevicesOnly -eq $true) {
    write-host "List devices without removal: $listDevicesOnly"
    $removeDevices = $false
}

if ($listGhostDevicesOnly -eq $true) {
    write-host "List ghost devices without removal: $listGhostDevicesOnly"
    $removeDevices = $false
}

$setupapi = @"
using System;
using System.Diagnostics;
using System.Text;
using System.Runtime.InteropServices;
namespace Win32
{
    public static class SetupApi
    {
         // 1st form using a ClassGUID only, with Enumerator = IntPtr.Zero
        [DllImport("setupapi.dll", CharSet = CharSet.Auto)]
        public static extern IntPtr SetupDiGetClassDevs(
           ref Guid ClassGuid,
           IntPtr Enumerator,
           IntPtr hwndParent,
           int Flags
        );
    
        // 2nd form uses an Enumerator only, with ClassGUID = IntPtr.Zero
        [DllImport("setupapi.dll", CharSet = CharSet.Auto)]
        public static extern IntPtr SetupDiGetClassDevs(
           IntPtr ClassGuid,
           string Enumerator,
           IntPtr hwndParent,
           int Flags
        );
        
        [DllImport("setupapi.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern bool SetupDiEnumDeviceInfo(
            IntPtr DeviceInfoSet,
            uint MemberIndex,
            ref SP_DEVINFO_DATA DeviceInfoData
        );
    
        [DllImport("setupapi.dll", SetLastError = true)]
        public static extern bool SetupDiDestroyDeviceInfoList(
            IntPtr DeviceInfoSet
        );
        [DllImport("setupapi.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern bool SetupDiGetDeviceRegistryProperty(
            IntPtr deviceInfoSet,
            ref SP_DEVINFO_DATA deviceInfoData,
            uint property,
            out UInt32 propertyRegDataType,
            byte[] propertyBuffer,
            uint propertyBufferSize,
            out UInt32 requiredSize
        );
        [DllImport("setupapi.dll", SetLastError = true, CharSet = CharSet.Auto)]
        public static extern bool SetupDiGetDeviceInstanceId(
            IntPtr DeviceInfoSet,
            ref SP_DEVINFO_DATA DeviceInfoData,
            StringBuilder DeviceInstanceId,
            int DeviceInstanceIdSize,
            out int RequiredSize
        );

    
        [DllImport("setupapi.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern bool SetupDiRemoveDevice(IntPtr DeviceInfoSet,ref SP_DEVINFO_DATA DeviceInfoData);
    }
    [StructLayout(LayoutKind.Sequential)]
    public struct SP_DEVINFO_DATA
    {
       public uint cbSize;
       public Guid classGuid;
       public uint devInst;
       public IntPtr reserved;
    }
    [Flags]
    public enum DiGetClassFlags : uint
    {
        DIGCF_DEFAULT       = 0x00000001,  // only valid with DIGCF_DEVICEINTERFACE
        DIGCF_PRESENT       = 0x00000002,
        DIGCF_ALLCLASSES    = 0x00000004,
        DIGCF_PROFILE       = 0x00000008,
        DIGCF_DEVICEINTERFACE   = 0x00000010,
    }
    public enum SetupDiGetDeviceRegistryPropertyEnum : uint
    {
         SPDRP_DEVICEDESC          = 0x00000000, // DeviceDesc (R/W)
         SPDRP_HARDWAREID          = 0x00000001, // HardwareID (R/W)
         SPDRP_COMPATIBLEIDS           = 0x00000002, // CompatibleIDs (R/W)
         SPDRP_UNUSED0             = 0x00000003, // unused
         SPDRP_SERVICE             = 0x00000004, // Service (R/W)
         SPDRP_UNUSED1             = 0x00000005, // unused
         SPDRP_UNUSED2             = 0x00000006, // unused
         SPDRP_CLASS               = 0x00000007, // Class (R--tied to ClassGUID)
         SPDRP_CLASSGUID           = 0x00000008, // ClassGUID (R/W)
         SPDRP_DRIVER              = 0x00000009, // Driver (R/W)
         SPDRP_CONFIGFLAGS         = 0x0000000A, // ConfigFlags (R/W)
         SPDRP_MFG             = 0x0000000B, // Mfg (R/W)
         SPDRP_FRIENDLYNAME        = 0x0000000C, // FriendlyName (R/W)
         SPDRP_LOCATION_INFORMATION    = 0x0000000D, // LocationInformation (R/W)
         SPDRP_PHYSICAL_DEVICE_OBJECT_NAME = 0x0000000E, // PhysicalDeviceObjectName (R)
         SPDRP_CAPABILITIES        = 0x0000000F, // Capabilities (R)
         SPDRP_UI_NUMBER           = 0x00000010, // UiNumber (R)
         SPDRP_UPPERFILTERS        = 0x00000011, // UpperFilters (R/W)
         SPDRP_LOWERFILTERS        = 0x00000012, // LowerFilters (R/W)
         SPDRP_BUSTYPEGUID         = 0x00000013, // BusTypeGUID (R)
         SPDRP_LEGACYBUSTYPE           = 0x00000014, // LegacyBusType (R)
         SPDRP_BUSNUMBER           = 0x00000015, // BusNumber (R)
         SPDRP_ENUMERATOR_NAME         = 0x00000016, // Enumerator Name (R)
         SPDRP_SECURITY            = 0x00000017, // Security (R/W, binary form)
         SPDRP_SECURITY_SDS        = 0x00000018, // Security (W, SDS form)
         SPDRP_DEVTYPE             = 0x00000019, // Device Type (R/W)
         SPDRP_EXCLUSIVE           = 0x0000001A, // Device is exclusive-access (R/W)
         SPDRP_CHARACTERISTICS         = 0x0000001B, // Device Characteristics (R/W)
         SPDRP_ADDRESS             = 0x0000001C, // Device Address (R)
         SPDRP_UI_NUMBER_DESC_FORMAT       = 0X0000001D, // UiNumberDescFormat (R/W)
         SPDRP_DEVICE_POWER_DATA       = 0x0000001E, // Device Power Data (R)
         SPDRP_REMOVAL_POLICY          = 0x0000001F, // Removal Policy (R)
         SPDRP_REMOVAL_POLICY_HW_DEFAULT   = 0x00000020, // Hardware Removal Policy (R)
         SPDRP_REMOVAL_POLICY_OVERRIDE     = 0x00000021, // Removal Policy Override (RW)
         SPDRP_INSTALL_STATE           = 0x00000022, // Device Install State (R)
         SPDRP_LOCATION_PATHS          = 0x00000023, // Device Location Paths (R)
         SPDRP_BASE_CONTAINERID        = 0x00000024  // Base ContainerID (R)
    }
}
"@
Add-Type -TypeDefinition $setupapi
    
    #Array for all removed devices report
    $removeArray = @()
    #Array for all devices report
    $array = @()

    $setupClass = [Guid]::Empty
    #Get all devices
    $devs = [Win32.SetupApi]::SetupDiGetClassDevs([ref]$setupClass, [IntPtr]::Zero, [IntPtr]::Zero, [Win32.DiGetClassFlags]::DIGCF_ALLCLASSES)

    #Initialise Struct to hold device info Data
    $devInfo = new-object Win32.SP_DEVINFO_DATA
    $devInfo.cbSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devInfo)

    #Device Counter
    $devCount = 0
    #Enumerate Devices
    while([Win32.SetupApi]::SetupDiEnumDeviceInfo($devs, $devCount, [ref]$devInfo)){
    
        #Will contain an enum depending on the type of the registry Property, not used but required for call
        $propType = 0
        #Buffer is initially null and buffer size 0 so that we can get the required Buffer size first
        [byte[]]$propBuffer = $null
        $propBufferSize = 0
        #Get Buffer size
        [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo, [Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_FRIENDLYNAME, [ref]$propType, $propBuffer, 0, [ref]$propBufferSize) | Out-null
        #Initialize Buffer with right size
        [byte[]]$propBuffer = New-Object byte[] $propBufferSize

        #Get HardwareID
        $propTypeHWID = 0
        [byte[]]$propBufferHWID = $null
        $propBufferSizeHWID = 0
        [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo, [Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_HARDWAREID, [ref]$propTypeHWID, $propBufferHWID, 0, [ref]$propBufferSizeHWID) | Out-null
        [byte[]]$propBufferHWID = New-Object byte[] $propBufferSizeHWID

        #Get DeviceDesc (this name will be used if no friendly name is found)
        $propTypeDD = 0
        [byte[]]$propBufferDD = $null
        $propBufferSizeDD = 0
        [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo, [Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_DEVICEDESC, [ref]$propTypeDD, $propBufferDD, 0, [ref]$propBufferSizeDD) | Out-null
        [byte[]]$propBufferDD = New-Object byte[] $propBufferSizeDD

        #Get Install State
        $propTypeIS = 0
        [byte[]]$propBufferIS = $null
        $propBufferSizeIS = 0
        [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo, [Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_INSTALL_STATE, [ref]$propTypeIS, $propBufferIS, 0, [ref]$propBufferSizeIS) | Out-null
        [byte[]]$propBufferIS = New-Object byte[] $propBufferSizeIS

        #Get Class
        $propTypeCLSS = 0
        [byte[]]$propBufferCLSS = $null
        $propBufferSizeCLSS = 0
        [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo, [Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_CLASS, [ref]$propTypeCLSS, $propBufferCLSS, 0, [ref]$propBufferSizeCLSS) | Out-null
        [byte[]]$propBufferCLSS = New-Object byte[] $propBufferSizeCLSS
        [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo,[Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_CLASS, [ref]$propTypeCLSS, $propBufferCLSS, $propBufferSizeCLSS, [ref]$propBufferSizeCLSS)  | out-null
        $Class = [System.Text.Encoding]::Unicode.GetString($propBufferCLSS)

        #Read FriendlyName property into Buffer
        if(![Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo,[Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_FRIENDLYNAME, [ref]$propType, $propBuffer, $propBufferSize, [ref]$propBufferSize)){
            [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo,[Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_DEVICEDESC, [ref]$propTypeDD, $propBufferDD, $propBufferSizeDD, [ref]$propBufferSizeDD)  | out-null
            $FriendlyName = [System.Text.Encoding]::Unicode.GetString($propBufferDD)
            #The friendly Name ends with a weird character
            if ($FriendlyName.Length -ge 1) {
                $FriendlyName = $FriendlyName.Substring(0,$FriendlyName.Length-1)
            }
        } else {
            #Get Unicode String from Buffer
            $FriendlyName = [System.Text.Encoding]::Unicode.GetString($propBuffer)
            #The friendly Name ends with a weird character
            if ($FriendlyName.Length -ge 1) {
                $FriendlyName = $FriendlyName.Substring(0,$FriendlyName.Length-1)
            }
        }

        #InstallState returns true or false as an output, not text
        $InstallState = [Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo,[Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_INSTALL_STATE, [ref]$propTypeIS, $propBufferIS, $propBufferSizeIS, [ref]$propBufferSizeIS)

        # Read HWID property into Buffer
        if(![Win32.SetupApi]::SetupDiGetDeviceRegistryProperty($devs, [ref]$devInfo,[Win32.SetupDiGetDeviceRegistryPropertyEnum]::SPDRP_HARDWAREID, [ref]$propTypeHWID, $propBufferHWID, $propBufferSizeHWID, [ref]$propBufferSizeHWID)){
            #Ignore if Error
            $HWID = ""
        } else {
            #Get Unicode String from Buffer
            $HWID = [System.Text.Encoding]::Unicode.GetString($propBufferHWID)
            #trim out excess names and take first object
            $HWID = $HWID.split([char]0x0000)[0].ToUpper()
        }

        #all detected devices list
        $obj = New-Object System.Object
        $obj | Add-Member -type NoteProperty -name FriendlyName -value $FriendlyName
        $obj | Add-Member -type NoteProperty -name HWID -value $HWID
        $obj | Add-Member -type NoteProperty -name InstallState -value $InstallState
        $obj | Add-Member -type NoteProperty -name Class -value $Class
        if ($array.count -le 0) {
            #for some reason the script will blow by the first few entries without displaying the output
            #this brief pause seems to let the objects get created/displayed so that they are in order.
            sleep 1
        }
        $array += @($obj)

        <#
        We need to execute the filtering at this point because we are in the current device context
        where we can execute an action (eg, removal).
        InstallState : False == ghosted device
        #>
        $matchFilter = $false
        if ($removeDevices -eq $true) {
            #we want to remove devices so lets check the filters...
            if ($FilterByClass -ne $null) {
                foreach ($ClassFilter in $FilterByClass) {
                    if ($ClassFilter -eq $Class) {
                        Write-verbose "Class filter match $ClassFilter, skipping"
                        $matchFilter = $true
                    }
                }
            }
            if ($FilterByFriendlyName -ne $null) {
                foreach ($FriendlyNameFilter in $FilterByFriendlyName) {
                    if ($FriendlyName -like '*'+$FriendlyNameFilter+'*') {
                        Write-verbose "FriendlyName filter match $FriendlyName, skipping"
                        $matchFilter = $true
                    }
                }
            }
            if ($InstallState -eq $False) {
                if ($matchFilter -eq $false) {
                    #Add-OutputBoxLine-Yellow -Message "Attempting to removing unplugged device $FriendlyName"
                    $removeObj = New-Object System.Object
                    $removeObj | Add-Member -type NoteProperty -name FriendlyName -value $FriendlyName
                    $removeObj | Add-Member -type NoteProperty -name HWID -value $HWID
                    $removeObj | Add-Member -type NoteProperty -name InstallState -value $InstallState
                    $removeObj | Add-Member -type NoteProperty -name Class -value $Class
                    $removeArray += @($removeObj)
                    if([Win32.SetupApi]::SetupDiRemoveDevice($devs, [ref]$devInfo)){
                        Add-OutputBoxLine-Green -Message "Removed unplugged device $FriendlyName"
                    } else {
                        Add-OutputBoxLine-Red -Message "Failed to remove unplugged device $FriendlyName" 
                    }
                } else {
                    Add-OutputBoxLine-Yellow -Message "Filter matched. Skipping $FriendlyName" 
                }
            }
        }
        $devcount++
    }

}

# ----------- Updating registry settings... -----------' 

Function WindowsComponents([bool]$enable){
  
  if ($enable){
Add-OutputBoxLine -Message "==> Enable WindowsComponents registry settings..."
# Disable some of the "new" features of Windows 10, such as forcibly installing apps you don't want, and the new annoying animation for first time login.

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableSoftLanding' -PropertyType DWord -Value '1' -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate' -Name 'AutoDownload' -PropertyType DWord -Value '2' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableFirstLogonAnimation' -PropertyType DWord -Value '0' -Force

#Disable Windows Superfetch
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters' -Name 'EnableSuperfetch' -PropertyType DWord -Value '0' -Force
}
else{
Add-OutputBoxLine -Message "==> Restore WindowsComponents registry settings..."
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableSoftLanding' -PropertyType DWord -Value '0' -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate' -Name 'AutoDownload' -PropertyType DWord -Value '4' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableFirstLogonAnimation' -PropertyType DWord -Value '1' -Force

#Windows Superfetch
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters' -Name 'EnableSuperfetch' -PropertyType DWord -Value '1' -Force


}
}

Function UserPreference([bool]$enable){
 if ($enable){
Add-OutputBoxLine -Message "==> Enable UserPreference registry settings..."
# Set some commonly changed settings for the current user. The interesting one here is "NoTileApplicationNotification" which disables a bunch of start menu tiles.

New-Item -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\' -Name 'PushNotifications'
New-ItemProperty -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'NoTileApplicationNotification' -PropertyType DWord -Value '1' -Force

New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\' -Name 'CabinetState'
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState' -Name 'FullPath' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'IconsOnly' -PropertyType DWord -Value '0' -Force

#Preformance Power Setting
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'BackgroundAppGlobalToggle' -PropertyType DWord -Value '0' -Force

#Optimize visual effect
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name 'VisualFXSetting' -PropertyType DWord -Value '2' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow' -Name 'DefaultApplied' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow' -Name 'DefaultApplied' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation' -Name 'DefaultApplied' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations' -Name 'DefaultApplied' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoDriveTypeAutoRun' -PropertyType DWord -Value '221' -Force
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'FontSmoothing' -Value '2' -Force

# Change Explorer home screen back to "This PC"
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -PropertyType DWord -Value '1' -Force

# Change Windows Updates to "Notify to schedule restart"
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'UxOption' -PropertyType DWord -Value '1' -Force
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AUOptions' -Value '2' -Force #Check for updates but let me choose whether to download and install them"
}
else{
Add-OutputBoxLine -Message "==> Restore UserPreference registry settings..."
New-Item -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\' -Name 'PushNotifications'
New-ItemProperty -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'NoTileApplicationNotification' -PropertyType DWord -Value '0' -Force

New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\' -Name 'CabinetState'
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState' -Name 'FullPath' -PropertyType DWord -Value '0' -Force

New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'IconsOnly' -PropertyType DWord -Value '1' -Force

#Preformance Power Setting
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'BackgroundAppGlobalToggle' -PropertyType DWord -Value '1' -Force

#visual effect
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name 'VisualFXSetting' -PropertyType DWord -Value '0' -Force

# Change Explorer home screen back to "This PC"
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -PropertyType DWord -Value '2' -Force

# Change Windows Updates to "Notify to schedule restart"
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AUOptions' -Value '4' -Force #Check for updates but let me choose whether to download and install them"
}

}

Function SystemSpeedup([bool]$enable){
#System Speedup (Advanced SystemCare Iobit):
  if ($enable){
Add-OutputBoxLine -Message "==> Enable SystemSpeedup..."
#Automatically close non-responsive programs
New-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'AutoEndTasks' -PropertyType String -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'HungAppTimeout' -PropertyType String -Value '3000' -Force
New-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'WaitToKillAppTimeout' -PropertyType String -Value '3000' -Force
New-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\Session Manager\Memory Management' -Name 'AutoChkTimeout' -PropertyType DWord -Value '5' -Force

#Desktop single process
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name 'DesktopProcess' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name 'link' -propertytype Binary -Value ([byte[]] (0x00,0x00,0x00,0x00)) -Force

#Optimize Boot sector
New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\Dfrg\BootOptimizeFunction' -Name 'Enable' -PropertyType String -Value 'Y' -Force

New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\PCHealth\ErrorReporting' -Name 'DoReport' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\PCHealth\ErrorReporting' -Name 'ShowUI' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name 'AutoRestartShell' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer' -Name 'Max Cached Icons' -PropertyType DWord -Value '4000' -Force
#Disable remote registry
New-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\SecurePipeServers\winreg' -Name 'remoteregaccess' -PropertyType DWord -Value '1' -Force

New-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\Session Manager' -Name 'AutoChkTimeout' -PropertyType DWord -Value '5' -Force

#Exclusion Windows Defender (Reduce memory)
if(Test-Path -Path "$env:ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe"){
$ExclusionPath = Get-ChildItem "$env:ProgramData\Microsoft\Windows Defender\Platform\*\" -Filter MsMpEng.exe -Recurse | % { $_.FullName } 

 foreach ($ExclusionPaths in $ExclusionPath) {
 Add-MpPreference -ExclusionExtension "$ExclusionPaths" -Force
 }

}
  }
else{
Add-OutputBoxLine -Message "==> Restore SystemSpeedup..."
#Desktop single process
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name 'DesktopProcess' -PropertyType DWord -Value '0' -Force

#Optimize Boot sector
New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\Dfrg\BootOptimizeFunction' -Name 'Enable' -PropertyType String -Value 'N' -Force

New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\PCHealth\ErrorReporting' -Name 'DoReport' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\PCHealth\ErrorReporting' -Name 'ShowUI' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name 'AutoRestartShell' -PropertyType DWord -Value '0' -Force
Remove-ItemProperty -Path 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer' -Name 'Max Cached Icons' -Force

New-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\Session Manager' -Name 'AutoChkTimeout' -PropertyType DWord -Value '8' -Force

if(Test-Path -Path "$env:ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe"){
$ExclusionPath = Get-ChildItem "$env:ProgramData\Microsoft\Windows Defender\Platform\*\" -Filter MsMpEng.exe -Recurse | % { $_.FullName } 

 foreach ($ExclusionPaths in $ExclusionPath) {
 Remove-MpPreference -ExclusionExtension "$ExclusionPaths" -Force
 }
}

}


}

Function NetworkSpeedup([bool]$enable){
#Network Speedup (Advanced SystemCare Iobit):
 if ($enable){
Add-OutputBoxLine -Message "==> Enable NetworkSpeedup..."
#Optimize network card performance
New-ItemProperty -Path 'HKLM:\System\ControlSet001\Services\Tcpip\Parameters' -Name 'MaxConnectionsPerServer' -PropertyType DWord -Value '0' -Force
#Increase IE connections
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name 'MaxConnectionsPer1_0Server' -PropertyType DWord -Value '10' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name 'MaxConnectionsPerServer' -PropertyType DWord -Value '10' -Force

#Network Throttling Index 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -PropertyType DWord -Value '10' -Force

#Network optimize (System Mechanic Pro):
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DeliveryOptimization\Settings" -Name 'DownloadMode' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" -Name 'DownloadMode' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Psched" -Name 'NonBestEffortLimit' -PropertyType DWord -Value '0'

New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\CscService" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\CscService" -Name 'Start' -PropertyType DWord -Value '3'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\DPS" -Name 'Start' -PropertyType DWord -Value '3'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\PcaSvc" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\pla" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\seclogon" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\stisvc" -Name 'Start' -PropertyType DWord -Value '3'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\stisvc" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\TrkWks" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\TrkWks" -Name 'Start' -PropertyType DWord -Value '3'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\WerSvc" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'

New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'Tcp1323Opts' -PropertyType DWord -Value '0'

New-ItemProperty -Path "HKLM:\System\ControlSet001\Control\Lsa" -Name 'restrictanonymous' -PropertyType DWord -Value '2'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\NetBT\Parameters" -Name 'NoNameReleaseOnDemand' -PropertyType DWord -Value '1'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'EnableDeadGWDetect' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'SynAttackProtect' -PropertyType DWord -Value '1'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'TcpMaxPortsExhausted' -PropertyType DWord -Value '5'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'TcpMaxHalfOpen' -PropertyType DWord -Value '500'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'TcpMaxHalfOpenRetried' -PropertyType DWord -Value '400'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'KeepAliveTime' -PropertyType DWord -Value '300000'

 }
else{
Add-OutputBoxLine -Message "==> Restore NetworkSpeedup..."

#Increase IE connections
New-ItemProperty -Path 'Registry::\HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name 'MaxConnectionsPer1_0Server' -PropertyType DWord -Value '8' -Force
New-ItemProperty -Path 'Registry::\HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name 'MaxConnectionsPerServer' -PropertyType DWord -Value '8' -Force

#Network Throttling Index 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -PropertyType DWord -Value '10' -Force

#Network optimize (System Mechanic Pro):
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Psched" -Name 'NonBestEffortLimit' -PropertyType DWord -Value '20'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\DPS" -Name 'Start' -PropertyType DWord -Value '2'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\PcaSvc" -Name 'DelayedAutostart' -PropertyType DWord -Value '1'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\pla" -Name 'DelayedAutostart' -PropertyType DWord -Value '1'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\seclogon" -Name 'DelayedAutostart' -PropertyType DWord -Value '1'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\stisvc" -Name 'Start' -PropertyType DWord -Value '3'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\stisvc" -Name 'DelayedAutostart' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\TrkWks" -Name 'DelayedAutostart' -PropertyType DWord -Value '1'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\TrkWks" -Name 'Start' -PropertyType DWord -Value '2'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\WerSvc" -Name 'DelayedAutostart' -PropertyType DWord -Value '1'

New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'Tcp1323Opts' -PropertyType DWord -Value '3'


New-ItemProperty -Path "HKLM:\System\ControlSet001\Control\Lsa" -Name 'restrictanonymous' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\NetBT\Parameters" -Name 'NoNameReleaseOnDemand' -PropertyType DWord -Value '0'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'EnableDeadGWDetect' -PropertyType DWord -Value '1'
New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'SynAttackProtect' -PropertyType DWord -Value '0'

New-ItemProperty -Path "HKLM:\System\ControlSet001\Services\Tcpip\Parameters" -Name 'KeepAliveTime' -PropertyType DWord -Value '7200000'
}

}

Function Hibernate([bool]$enable){

 if ($enable){
Add-OutputBoxLine -Message "==> Disable Hibernate..." 
powercfg -h off 
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 100
}
else{
Add-OutputBoxLine -Message "==> Enable Hibernate..."
powercfg -h on
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 5
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name 'HiberbootEnabled' -Value '1' -Force
}

}

Function BootTimeOut([bool]$enable){
# Boot timeout Settings
 if ($enable){
Add-OutputBoxLine -Message "==> Set BootTimeOut to 3 seconds..." 
Start-process bcdedit -ArgumentList '/timeout 3' -verbose
}
else{
Add-OutputBoxLine -Message "==> Restore BootTimeOut to 30 seconds..." 
Start-process bcdedit -ArgumentList '/timeout 30' -verbose
 }
}

#Game Settings

Function GameSettings([bool]$enable){

if ($enable){
Add-OutputBoxLine -Message "==> Enable GameSettings..." 

$ntqtrmin = $null
$ntqtrmax = $null
$ntqtrcur = $null

#The resolution you want
$ntdesiredres = 10000
$ntsetres = $true
$ntcurrentres = 156250

#Import the functions from dll
$MethodDefinition = @’
[DllImport("ntdll.dll", SetLastError=true)]
public static extern NtStatus NtQueryTimerResolution(out uint MinimumResolution, out uint MaximumResolution, out uint ActualResolution);

[DllImport("ntdll.dll", SetLastError=true)]
public static extern int NtSetTimerResolution(int DesiredResolution, bool SetResolution, out int CurrentResolution );
‘@
$NtStatus = Add-Type -MemberDefinition $MethodDefinition -Name 'NtStatus' -Namespace 'Win32' -PassThru

#Set the timer resolution using the variables at the top
$ret1 = [Win32.NtStatus]::NtSetTimerResolution($ntdesiredres,$ntsetres,[ref]$ntcurrentres)

#Query the timer resolution and store them in the variables ntqtrmin, ntqtrmax and ntqtrcur
[Win32.NtStatus]::NtQueryTimerResolution([ref]$ntqtrmin, [ref]$ntqtrmax, [ref]$ntqtrcur)

#Print the timer resolution values
#Write-Host "Current Timer Res: $ntqtrcur `r`nTimer Res Minimum: $ntqtrmin `r`nTimer Res Maximum: $ntqtrmax `r`n"

#https://www.speedguide.net/articles/gaming-tweaks-5812
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -PropertyType DWord -Value '0xffffffff' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\' -Name 'SystemResponsiveness' -PropertyType DWord -Value '0' -Force -Verbose

New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'GPU Priority' -PropertyType DWord -Value '8' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -PropertyType DWord -Value '6' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Affinity' -PropertyType DWord -Value '0' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Background Only' -PropertyType String -Value 'False' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Clock Rate' -PropertyType DWord -Value '10000' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Scheduling Category' -PropertyType String -Value 'High' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'SFIO Priority' -PropertyType String -Value 'High' -Force -Verbose

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'LargeSystemCache' -PropertyType DWord -Value '0' -Force -Verbose

Disable-NetAdapterRsc -Name * -Verbose
Disable-NetAdapterLso -Name * -Verbose
Set-NetTCPSetting -SettingName InternetCustom -EcnCapability Disabled -Verbose
#netsh int tcp set global rss=disabled

Add-OutputBoxLine-Green -Message "==> GameSettings enabled" 

}
else{
Add-OutputBoxLine -Message "==> Restore GameSettings..." 

$ntqtrmin = $null
$ntqtrmax = $null
$ntqtrcur = $null

#The resolution you want
$ntdesiredres = 156250
$ntsetres = $true
$ntcurrentres = 156250

#Import the functions from dll
$MethodDefinition = @’
[DllImport("ntdll.dll", SetLastError=true)]
public static extern NtStatus NtQueryTimerResolution(out uint MinimumResolution, out uint MaximumResolution, out uint ActualResolution);

[DllImport("ntdll.dll", SetLastError=true)]
public static extern int NtSetTimerResolution(int DesiredResolution, bool SetResolution, out int CurrentResolution );
‘@
$NtStatus = Add-Type -MemberDefinition $MethodDefinition -Name 'NtStatus' -Namespace 'Win32' -PassThru

#Set the timer resolution using the variables at the top
$ret1 = [Win32.NtStatus]::NtSetTimerResolution($ntdesiredres,$ntsetres,[ref]$ntcurrentres)

#Query the timer resolution and store them in the variables ntqtrmin, ntqtrmax and ntqtrcur
[Win32.NtStatus]::NtQueryTimerResolution([ref]$ntqtrmin, [ref]$ntqtrmax, [ref]$ntqtrcur)

#Print the timer resolution values
#Write-Host "Current Timer Res: $ntqtrcur `r`nTimer Res Minimum: $ntqtrmin `r`nTimer Res Maximum: $ntqtrmax `r`n"

New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -PropertyType DWord -Value '10' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\' -Name 'SystemResponsiveness' -PropertyType DWord -Value '20' -Force -Verbose

New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'GPU Priority' -PropertyType DWord -Value '2' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -PropertyType DWord -Value '2' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Affinity' -PropertyType DWord -Value '0' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Background Only' -PropertyType String -Value 'False' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Clock Rate' -PropertyType DWord -Value '10000' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Scheduling Category' -PropertyType String -Value 'Medium' -Force -Verbose
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'SFIO Priority' -PropertyType String -Value 'Normal' -Force -Verbose

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'LargeSystemCache' -PropertyType DWord -Value '0' -Force -Verbose

Enable-NetAdapterRsc -Name * -Verbose
Enable-NetAdapterLso -Name * -Verbose
Set-NetTCPSetting -SettingName InternetCustom -EcnCapability Disabled -Verbose
#netsh int tcp set global rss=enabled
Add-OutputBoxLine-Green -Message "==> GameSettings restored" 

}
}

#Clean-up: 
Function DISM-cleanup{
Add-OutputBoxLine -Message "==> DISM Clean-Up..." 
Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /StartComponentCleanup /ResetBase' -Wait
Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /spsuperseded' -Wait
If (Get-process | Where-Object {$_.Name -like 'Dism'}) {Stop-Process -Name Dism -Force}
If (Get-process | Where-Object {$_.Name -like 'DismHost'}) {Stop-Process -Name DismHost -Force}
Clear-WindowsCorruptMountPoint   
<#If ((Get-WindowsCapability -Online -Name NetFX3~~~~).State -ne 'Installed') {
    Add-WindowsCapability –Online -Name NetFx3~~~~
}#>
}

Function Delete-Rougefolders{
Add-OutputBoxLine -Message "==> Deleting rouge folders..." 
if (test-path "$env:HOMEDRIVE\Config.Msi") {remove-item -Path "$env:HOMEDRIVE\Config.Msi" -force -recurse}
if (test-path "$env:HOMEDRIVE\Intel") {remove-item -Path "$env:HOMEDRIVE\Intel" -force -recurse}
if (test-path "$env:HOMEDRIVE\PerfLogs") {remove-item -Path "$env:HOMEDRIVE\PerfLogs" -force -recurse}
if (test-path "$env:HOMEDRIVE\swsetup") {remove-item -Path "$env:HOMEDRIVE\swsetup" -force -recurse} # HP Software and Driver Repositry
if (test-path "$env:windir\memory\*.dmp") {remove-item -Path "$env:windir\memory\*.dmp" -force}
}

Function Delete-Junk{

Add-OutputBoxLine -Message "==> Removing System and User junk files..." 

if(Test-Path -Path "$env:windir\minidump\*"){Remove-Item -Path "$env:windir\minidump\*" -Force -Recurse -verbose}
if(Test-Path -Path "$env:windir\Prefetch\*"){Remove-Item -Path "$env:windir\Prefetch\*" -Force -Recurse}
#if(Test-Path -Path "$env:windir\Installer\*"){Remove-Item -Path "$env:windir\Installer\*" -Force -Recurse}

if(Test-Path -Path "$env:windir\Temp\*"){Remove-Item -Path "$env:windir\Temp\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\ServiceProfiles\LocalService\AppData\Local\Temp\*"){Remove-Item -Path "$env:windir\ServiceProfiles\LocalService\AppData\Local\Temp\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\ServiceProfiles\NetworkService\AppData\Local\Temp\*"){Remove-Item -Path "$env:windir\ServiceProfiles\NetworkService\AppData\Local\Temp\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Temp\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\Local Settings\Temp\*"){Remove-Item -Path "$env:USERPROFILE\Local Settings\Temp\*" -Force -Recurse}
if(Test-Path -Path "$env:HOMEDRIVE\inetpub\temp\*"){Remove-Item -Path "$env:HOMEDRIVE\inetpub\temp\*" -Force -Recurse}


if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WER\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WER\*" -Force -Recurse} 
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Temporary Internet Files\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Force -Recurse} 
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IECompatCache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IECompatCache\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IEDownloadHistory\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\IEDownloadHistory\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Feeds Cache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Feeds Cache\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCookies\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCookies\*" -Force -Recurse} 
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Terminal Server Client\Cache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Terminal Server Client\Cache\*" -Force -Recurse} 
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WebCache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WebCache\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\ElevatedDiagnostics\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\ElevatedDiagnostics\*" -Force -Recurse} 

if(Test-Path -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\WER\ReportQueue\*"){Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\WER\ReportQueue\*" -Force -Recurse} 
if(Test-Path -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\WER\ReportArchive\*"){Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\WER\ReportArchive\*" -Force -Recurse} 
if(Test-Path -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Power Efficiency Diagnostics\*"){Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Power Efficiency Diagnostics\*" -Force -Recurse} 

if(Test-Path -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows Defender\Scans\History\Results\*"){Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows Defender\Scans\History\Results\*" -Force -Recurse} 
if(Test-Path -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows Defender\Support\*"){Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows Defender\Support\*" -Recurse -Force} 
if(Test-Path -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows Defender\Scans\*"){Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows Defender\Scans\*" -include "*.bin" -Force -Recurse} 

if(Test-Path -Path "$env:HOMEDRIVE\Program Files\rempl\*") {Remove-Item -Path "$env:HOMEDRIVE\Program Files\rempl\*" -Force -Recurse }
if(Test-Path -Path "$env:HOMEDRIVE\ESD\*") {Remove-Item -Path "$env:HOMEDRIVE\ESD\*" -Force -Recurse}
if(Test-path -Path "$env:HOMEDRIVE\Program Files\Downloaded Program Files\*") {Remove-Item -Path "$env:HOMEDRIVE\Program Files\Downloaded Program Files" -Force -Recurse }

if(Test-Path -Path "$env:USERPROFILE\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*"){Remove-Item -Path "$env:USERPROFILE\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\D3DSCache\*"){Remove-Item -Path "$env:USERPROFILE\AppData\Local\D3DSCache\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Explorer\*"){Remove-Item -Path "C:\Users\Martijn\AppData\Local\Microsoft\Windows\Explorer\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*"){Remove-Item -Path "C:\Users\Martijn\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*" -Force -Recurse}
if(Test-Path -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\*"){Remove-Item -Path "C:\Users\Martijn\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\*" -Force -Recurse}

if(Test-Path -Path "$env:windir\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\*"){Remove-Item -Path "$env:windir\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*"){Remove-Item -Path "$env:windir\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" -Force -Recurse}
if(Test-Path -Path "$env:ProgramData\Microsoft\Network\Downloader\*"){Remove-Item -Path "$env:ProgramData\Microsoft\Network\Downloader\*" -Force -Recurse}

if(Test-Path -Path "$env:windir\System32\WDI\*"){Remove-Item -Path "$env:windir\System32\WDI\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\Performance\WinSAT\DataStore\*"){Remove-Item -Path "$env:windir\Performance\WinSAT\DataStore\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\appcompat\Programs\Install\*"){Remove-Item -Path "$env:windir\appcompat\Programs\Install\*" -Force -Recurse}
if(Test-Path -Path "$env:windir\System32\config\systemprofile\AppData\Local\CrashDumps\"){Remove-Item -Path "$env:windir\System32\config\systemprofile\AppData\Local\CrashDumps\*.dmp" -Force -Recurse}
if(Test-Path -Path "$env:windir\System32\config\systemprofile\AppData\Local\\D3DSCache\"){Remove-Item -Path "$env:windir\System32\config\systemprofile\AppData\Local\\D3DSCache\*" -Force -Recurse}

if(Test-Path -Path "$env:windir\INF\*") {Remove-Item -Path "$envF:windir\INF\*" -Include "*.log" -force -recurse}
if(Test-Path -Path "$env:windir\security\logs\*") {Remove-Item -Path "$env:windir\security\logs\*" -force -recurse}
if(Test-Path -Path "$env:windir\debug\WIA\*") {Remove-Item -Path "$env:windir\debug\WIA\*" -force -recurse}
if(Test-Path -Path "$env:windir\Logs\*") {Remove-Item -Path "$env:windir\Logs\*" -force -recurse}
#if(Test-Path -Path "$env:windir\Logs\CBS\*.log"){Remove-Item -Path "$env:windir\Logs\CBS\*.log" -Force -Recurse}
#if(Test-Path -Path "$env:windir\Logs\NetSetup\*.etl"){Remove-Item -Path "$env:windir\Logs\NetSetup\*.etl" -Force -Recurse}
#if(Test-Path -Path "$env:windir\Logs\WindowsUpdate\*.etl"){Remove-Item -Path "$env:windir\Logs\WindowsUpdate\*.etl" -Force -Recurse}
if(Test-Path -Path "$env:windir\System32\LogFiles\*"){Remove-Item -Path "$env:windir\System32\LogFiles\*" -Force -Recurse}

if(Test-Path -Path "$env:HOMEDRIVE\inetpub\logs\LogFiles\*"){Get-ChildItem "$env:HOMEDRIVE\inetpub\logs\LogFiles\*" -Recurse -Force | Where-Object { ($_.CreationTime -le $(Get-Date).AddDays(-60)) } | Remove-Item -Force -Recurse -verbose}
if(Test-Path -Path "$env:HOMEDRIVE"){Get-Childitem "$env:HOMEDRIVE\" -include *.tmp, *.temp -recurse -force | foreach ($_) {remove-item $_.fullname -recurse -force -verbose}}

if(Test-Path -Path "$env:ProgramData\NVIDIA Corporation\DriverDumps\*"){Remove-Item -Path "$env:ProgramData\NVIDIA Corporation\DriverDumps\*" -Force -Recurse}

if(Test-Path -Path "$env:LOCALAPPDATA\*.old"){Get-ChildItem "$env:LOCALAPPDATA\*.old" -Recurse -Force | Remove-Item -Force -Recurse}
if(Test-Path -Path "$env:APPDATA\*.old"){Get-ChildItem "$env:APPDATA\*.old" -Recurse -Force | Remove-Item -Force -Recurse}
if(Test-Path -Path "$env:ProgramData\*.old"){Get-ChildItem "$env:ProgramData\*.old" -Recurse -Force | Remove-Item -Force -Recurse}

if(Test-Path -Path "$env:LOCALAPPDATA\*.log"){Get-ChildItem "$env:LOCALAPPDATA\*.log" -Recurse -Force | Remove-Item -Force -Recurse}
if(Test-Path -Path "$env:APPDATA\*.log"){Get-ChildItem "$env:APPDATA\*.log" -Recurse -Force | Remove-Item -Force -Recurse}
if(Test-Path -Path "$env:ProgramData\*.log"){Get-ChildItem "$env:ProgramData\*.log" -Recurse -Force | Remove-Item -Force -Recurse}
#Get-ChildItem "$env:windir\*.log" -Recurse -Force | Remove-Item -Force -Recurse


}

Function Remove-InvalidStartMenuItem{

Add-OutputBoxLine -Message "==> Removing Invalid Shortcuts..." 

    $WshShell = New-Object -comObject WScript.Shell
    $Files = Get-ChildItem -Path "$env:USERPROFILE\*" -Filter *.lnk -Recurse
    foreach ($File in $Files) {
        $FilePath = $File.FullName
        $Shortcut = $WshShell.CreateShortcut($FilePath)
        $Target = $Shortcut.TargetPath
        if (Test-Path -Path $Target) {
           #Add-OutputBoxLine -Message "Valid: $($File.BaseName)"
        } else {
            Add-OutputBoxLine-Yellow -Message "Invalid: $($File.BaseName) removed."
            try {
              Remove-Item -Path $FilePath
              Add-OutputBoxLine-Green -Message "Removed: $($File.BaseName) removed."
            } catch {
              Add-OutputBoxLine-Red -Message "ERROR: $($File.BaseName) not removed."
            }
        }
    }

Get-ChildItem -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -File -Force -Exclude desktop.ini | Remove-Item -Force -verbose
Get-ChildItem -Path "$env:APPDATA\Microsoft\Windows\Recent\AutomaticDestinations\*" -File -Force -Exclude desktop.ini, f01b4d95cf55d32a.automaticDestinations-ms | Remove-Item -Force -verbose
Get-ChildItem -Path "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations\*" -File -Force -Exclude desktop.ini | Remove-Item -Force -verbose 

}

Function Delete-EmptyFolder($path){
# Remove hidden files, like thumbs.db
$removeHiddenFiles = $false
# Get hidden files or not. Depending on removeHiddenFiles setting
$getHiddelFiles = !$removeHiddenFiles

    # Go through each subfolder, 
    Foreach ($subFolder in Get-ChildItem -Force -Literal $path -Directory) 
    {
        # Call the function recursively
        Delete-EmptyFolder -path $subFolder.FullName
    }

    # Get all child items
    $subItems = Get-ChildItem -Force:$getHiddelFiles -LiteralPath $path

    # If there are no items, then we can delete the folder
    # Exluce folder: If (($subItems -eq $null) -and (-Not($path.contains("DfsrPrivate")))) 
    If (($subItems -eq $null) -and (-Not($path.contains("Cache"))) -and (-Not($path.contains("Logs"))) -and (-Not($path.contains("Installer")))) 
    {
        Add-OutputBoxLine -Message "Removing empty folder '${path}'"
        Remove-Item -Force -Recurse:$removeHiddenFiles -LiteralPath $Path #-WhatIf:$true
    } 
    
}

Function Delete-Updatedownloads{

Add-OutputBoxLine -Message "==> Removing Windows updates downloads..." 
Stop-Service wuauserv -Force 
Stop-Service TrustedInstaller -NoWait -Force
Get-ChildItem -Path "$env:windir\SoftwareDistribution\" -Exclude "DataStore" | Remove-Item -force -recurse -verbose
Remove-Item -Path "$env:windir\SoftwareDistribution\DataStore\Logs\*" -force -recurse -verbose
if(Test-Path -Path "$env:windir\SoftwareDistribution.bak") {Remove-Item -Path "$env:windir\SoftwareDistribution.bak" -Force -Recurse -verbose}
Start-Service wuauserv 
Start-Service TrustedInstaller 
}

Function Delete-Volumeshadow{

Add-OutputBoxLine -Message "==> Removing volume shadow..."
Start-Process -FilePath 'vssadmin.exe' -ArgumentList 'Delete Shadows /all /quiet' -Wait -verbose | Out-Null
}

Function Clear-Cache{

Add-OutputBoxLine -Message "==> Deleting cache..." 

#CCMCACHE
$MinDays = 60
$UIResourceMgr = New-Object -ComObject UIResource.UIResourceMgr -Verbose
$Cache = $UIResourceMgr.GetCacheInfo() 
$Cache.GetCacheElements()  | 
    where-object {[datetime]$_.LastReferenceTime -lt (get-date).adddays(-$mindays)} -Verbose | 
    foreach {
$Cache.DeleteCacheElement($_.CacheElementID)  
}

#App-V Cache
net stop AppVClient
Get-AppvClientPackage -All | Remove-AppVClientPackage
net stop AppVClient
 

if(Test-Path -Path "$env:PROGRAMDATA\App-V\*" ){Remove-Item -Path "$env:PROGRAMDATA\App-V\*"  -Force -Recurse} 
if(Test-Path -Path "$env:PROGRAMDATA\Microsoft\AppV\Client\Catalog\Packages\*"){Remove-Item -Path "$env:PROGRAMDATA\Microsoft\AppV\Client\Catalog\Packages\*" -Force -Recurse} 
if(Test-Path -Path "$env:PROGRAMDATA\Microsoft\AppV\Client\VFS\*"){Remove-Item -Path "$env:PROGRAMDATA\Microsoft\AppV\Client\VFS\*" -Force -Recurse} 
if(Test-Path -Path "$env:LOCALAPPDATA\Microsoft\AppV\Client\Integration\*"){Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\AppV\Client\Integration\*"  -Force -Recurse} 
if(Test-Path -Path "$env:LOCALAPPDATA\Microsoft\AppV\Client\VFS\*" ){Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\AppV\Client\VFS\*"  -Force -Recurse} 
if(Test-Path -Path "$env:LOCALAPPDATA\Package Cache\*"){Remove-Item -Path "$env:LOCALAPPDATA\Package Cache\*" -Force -Recurse} 
if(Test-Path -Path "$env:HOMEDRIVE\ProgramData\Package Cache\*"){Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Package Cache\*" -Force -Recurse} 

if (Get-Service | Where-Object {$_.Name -like 'cbdhsvc*'}){Restart-Service -Name "cbdhsvc*" -force}

#Flush Memory Cache
If (Test-Path "$env:windir\System32\Rundll32.exe"){Start-Process -FilePath "$env:windir\System32\Rundll32.exe" -ArgumentList 'advapi32.dll,ProcessIdleTasks' -verbose}
If (Test-Path "$env:windir\SysWOW64\Rundll32.exe"){Start-Process -FilePath "$env:windir\SysWOW64\Rundll32.exe" -ArgumentList 'advapi32.dll,ProcessIdleTasks' -verbose}


#Clear Caches (3rd Party)
#Mozilla Firefox
if (Test-Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles"){
Remove-Item -Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*.default\cache\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*.default\cache\*.*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*.default\thumbnails\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*.default\cookies.sqlite" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite" -Recurse -Force
}
#Google Chrome
If (Test-Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default"){
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cookies-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Favicons-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Login Data-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Media History-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Network Action Predictor-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\QuotaManager-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Reporting and NEL-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Shortcuts-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Top Sites-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Web Data-journal" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Affiliation Database-journal" -Recurse -Force
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Safe Browsing Cookies-journal" -Recurse -Force
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\GPUCache\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\File System\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extension State\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\JumpListIconsRecentClosed\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Service Worker\Database\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Service Worker\ScriptCache\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Service Worker\CacheStorage\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\IndexedDB\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Session Storage\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\GrShaderCache\GPUCache\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\ShaderCache\GPUCache\*" -Recurse -Force 
Remove-Item -path "$env:LOCALAPPDATA\Google\Chrome\User Data\Crashpad\reports\*" -Recurse -Force 
Remove-Item -Path "$env:LOCALAPPDATA\Google\Software Reporter Tool\*" -include "*.log" -Force -Recurse
}

#Edge
If (Test-Path "$env:LOCALAPPDATA\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\*\Microsoft\CryptnetUrlCache"){
Remove-Item -path "$env:LOCALAPPDATA\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\*\Microsoft\CryptnetUrlCache\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Session Storage\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extension State\*" -Recurse -Force

}

#Clipboard
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Clipboard]::Clear()

#Cache folder and delete contant
Get-ChildItem $env:LOCALAPPDATA -Recurse -Force | Where-Object {
    $_.PSIsContainer -and
    $_.Name -like "*Cache"
} | Select-Object -Expand FullName | ForEach-Object {
    Remove-Item "$_\*" -Recurse -force -Verbose
}

Get-ChildItem $env:APPDATA -Recurse -Force | Where-Object {
    $_.PSIsContainer -and
     $_.Name -like "*Cache" 
} | Select-Object -Expand FullName | ForEach-Object {
    Remove-Item "$_\*" -Recurse -force -Verbose
}

Get-ChildItem $env:ProgramData -Recurse -Force | Where-Object {
    $_.PSIsContainer -and
     $_.Name -like "*Cache"
} | Select-Object -Expand FullName | ForEach-Object {
    Remove-Item "$_\*" -Recurse -force -Verbose
}


#DNS Cache
Clear-DnsClientCache 
Clear-BCCache -force
Start-Process -FilePath 'ipconfig.exe' -ArgumentList '/flushdns' -Wait -verbose 

#Java Cache
Start-Process -FilePath 'javaws.exe' -ArgumentList '-uninstall' -Wait -verbose 

}

Function CCleaner-Clean{
if (test-path "$env:HOMEDRIVE\Program Files\CCleaner") {
Add-OutputBoxLine -Message "==> Starting silent Clean-Up CCleaner..." 
Start-Process -FilePath "$env:HOMEDRIVE\Program Files\CCleaner\CCleaner64.exe" -ArgumentList "/AUTO" -Wait -WarningAction SilentlyContinue -verbose
}
}

Function Windows-Cleanmgr{
Add-OutputBoxLine -Message "==> Running Windows System Clean-Up..."
Stop-Process -Name cleanmgr, dismhost -Force
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
                Add-OutputBoxLine -Message "==> Adding $regName to the following Registry Paths..."
                $regVolumeCachesPaths | ForEach-Object {
                    #Add-OutputBoxLine -Message "$_"
                    New-ItemProperty -Path Registry::$_ -Name $regName -Value $regValue -PropertyType $regType -Force | Out-Null
                }

                #  If machine is Windows Server 2008 R2, copy files required by CleanMgr and wait for action to complete
                If ($MachineOS -eq 'Windows Server 2008 R2') {
                    Copy-Item -Path '$env:HOMEDRIVE\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe' -Destination '$env:HOMEDRIVE\Windows\System32\' -Force | Out-Null
                    Copy-Item -Path '$env:HOMEDRIVE\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui' -Destination '$env:HOMEDRIVE\Windows\System32\en-US\' -Force | Out-Null
                }

                #  Start Volume Cache Cleanup
                $ErrorActionPreference = 'SilentlyContinue'
                Start-Process -FilePath 'CleanMgr.exe' -ArgumentList "/sagerun:$regSageSet"
               Do {

                if((New-Object -ComObject WScript.Shell).AppActivate((get-process cleanmgr).MainWindowTitle) -eq $false)
                {Start-Sleep -Seconds 5
                (New-Object -ComObject WScript.Shell).AppActivate((get-process cleanmgr).MainWindowTitle)}

                }until(!(Get-Process -Name cleanmgr, dismhost))
                $ErrorActionPreference = 'Continue'
            }
            Else {
                Add-OutputBoxLine -Message '==> Path Not Found! Skipping...'
            }
#Storage Sense:

New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '01' -PropertyType DWord -Value '1' -Force -verbose
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '04' -PropertyType DWord -Value '1' -Force -verbose
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '08' -PropertyType DWord -Value '1' -Force -verbose
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '256' -PropertyType DWord -Value '30' -Force -verbose
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '1024' -PropertyType DWord -Value '1' -Force -verbose
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Name '2048' -PropertyType DWord -Value '7' -Force -verbose  

}

Function Clear-Eventlogs{
Add-OutputBoxLine -Message "==> Clearing all event logs..." 
$Feed.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("")
wevtutil el | Foreach-Object {Add-OutputBoxLine -Message "Clearing $_"; wevtutil cl "$_"}
}

#Privacy:
Function Test-RegistryValue([String]$Path,[String]$Name){

      if (!(Test-Path $Path)) { return $false }
   
      $Key = Get-Item -LiteralPath $Path
      if ($Key.GetValue($Name, $null) -ne $null) {
          return $true
      } else {
          return $false
      }
    }

Function Get-RegistryValue([String]$Path,[String]$Name){

      if (!(Test-Path $Path)) { return $null }
   
      $Key = Get-Item -LiteralPath $Path
      if ($Key.GetValue($Name, $null) -ne $null) {
          return $Key.GetValue($Name, $null)
      } else {
          return $null
      }
    }

Function Remove-RegistryValue([String]$Path,[String]$Name){

        $old = Get-RegistryValue -Path $Path -Name $Name
        if ($old -ne $null)
        {
            Remove-ItemProperty -Path "$Path" -Name "$Name"
            Add-OutputBoxLine-Yellow -Message "$Path\$Name removed"
        }
        else
        {
            Add-OutputBoxLine-Green -Message "$Path\$Name does not exist" 
        }

    }

Function Create-RegistryKey([string]$path){        
        # creates a parent key and if needed grandparent key as well
        # for this script that is good enough

        If (!(Test-Path $Path))
        {
            $parent = "$path\.."

            $grandParent = "$parent\.."
            If (!(Test-Path $grandParent))
            {
                New-item -Path $grandParent | Out-Null
            }

            If (!(Test-Path $parent))
            {
                New-item -Path $parent | Out-Null
            }

            New-item -Path $Path | Out-Null
        }
    }

Function Add-RegistryDWord([String]$Path,[String]$Name,[int32]$value){

        $old = Get-RegistryValue -Path $Path -Name $Name
        if ($old -ne $null)
        {
            if ([int32]$old -eq $value)
            {
                Add-OutputBoxLine-Green -Message "$Path\$Name already set to $value" 
                return
            }
        }


        If (Test-RegistryValue $Path $Name)
        {
            Set-ItemProperty -Path $Path -Name $Name -Value $value -Force
        }
        else
        {
            Create-RegistryKey -path $path
            New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value $value -Force | Out-Null
        }


        Add-OutputBoxLine-Yellow -Message "$Path\$Name changed to $value"
    }

Function Add-RegistryString([String]$Path,[String]$Name,[string]$value){


        $old = Get-RegistryValue -Path $Path -Name $Name
        if ($old -ne $null)
        {
            if ([string]$old -eq $value)
            {
                Add-OutputBoxLine-Green -Message "$Path\$Name already set to $value"
                return
            }
        }

        If (Test-RegistryValue $Path $Name)
        {
            Set-ItemProperty -Path $Path -Name $Name -Value $value -Force
        }
        else
        {
            Create-RegistryKey -path $path
            New-ItemProperty -Path $Path -Name $Name -PropertyType String -Value $value -Force |Out-Null
        }

        Add-OutputBoxLine-Yellow -Message "$Path\$Name changed to $value"
    }

Function Get-AppSID(){

        Get-ChildItem "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Mappings" | foreach {

        $key = $_.Name -replace "HKEY_CURRENT_USER","HKCU:"

        $val = Get-RegistryValue -Path $key -Name "Moniker" 

        if ($val -ne $null)
        {
            if ($val -match "^microsoft\.people_")
            {
                $script:sidPeople = $_.PsChildName
            }
            if ($val -match "^microsoft\.windows\.cortana")
            {
                $script:sidCortana = $_.PsChildName
            }
        }     
    }              
    }

Function DeviceAccess([string]$guid,[string]$value){
        Add-RegistryString -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{$guid}" -Name Value -Value $value
    }

Function DeviceAccessName([string]$name,[string]$value){
        Add-RegistryString -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\$name" -Name Value -Value $value
    }

Function DeviceAccessApp([string]$app,[string]$guid,[string]$value){

        Add-RegistryString -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\$app\{$guid}" -Name Value -Value $value
    }

    # ----------- User Privacy Functions -----------

Function SmartScreen([int]$value){
        
        # Turn on SmartScreen Filter
        #Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" -Name EnableWebContentEvaluation -Value $value 
        Add-RegistryDWord -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name EnableSmartScreen -Value $value  
        
    }

Function ImproveTyping([int]$value){

        # Send Microsoft info about how to write to help us improve typing and writing in the future
        Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Input\TIPC" -Name Enabled -Value $value
    }

Function AdvertisingId([int]$value){

       # Let apps use my advertising ID for experience across apps
        Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value $value
    }

Function LanguageList([int]$value){

        # Let websites provice locally relevant content by accessing my language list
        Add-RegistryDWord -Path "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -Value $value
    }

Function SpeachInkingTyping([bool]$enable){

        if ($enable)
        {
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name AcceptedPrivacyPolicy -Value 1
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name RestrictImplicitTextCollection -Value 0
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name RestrictImplicitInkCollection -Value 0
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name HarvestContacts -Value 1
        }
        else
        {
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name AcceptedPrivacyPolicy -Value 0
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name RestrictImplicitTextCollection -Value 1
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name RestrictImplicitInkCollection -Value 1
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name HarvestContacts -Value 0    
        }
    }

Function Location([string]$value){

        DeviceAccess -guid "BFA794E4-F964-4FDB-90F6-51056BFE4B44" -value $value

        # Disabling Location Tracking
        $LocationConfig = "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
        If (!(Test-Path $LocationConfig)) {
        New-Item $LocationConfig
        }
        Set-ItemProperty $LocationConfig -Name 'Status' -Value '0' -Force  
 }

Function Camera([string]$value){

        DeviceAccess -guid "E5323777-F976-4f5b-9B55-B94699C46E44" -value $value
    }

Function Microphone([string]$value){
        DeviceAccess -guid "2EEF81BE-33FA-4800-9670-1CD474972C3F" -value $value
    }

Function CallHistory([string]$value){
        DeviceAccess -guid "8BC668CF-7728-45BD-93F8-CF2B3B41D7AB" -value $value
    }

Function Email([string]$value){
        DeviceAccess -guid "9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5" -value $value
    }

Function Tasks([string]$value){
        DeviceAccess -guid "E390DF20-07DF-446D-B962-F5C953062741" -value $value
    }

Function Contacts([string]$value){

        $exclude = $script:sidCortana + "|" + $script:sidPeople

        DeviceAccess -guid "7D7E8402-7C54-4821-A34E-AEEFD62DED93" -value $value

        Get-ChildItem HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess | ForEach-Object{

            $app = $_.PSChildName

            if ($app -ne "Global")
            {
                $key = $_.Name -replace "HKEY_CURRENT_USER","HKCU:"

                $contactsGUID = "7D7E8402-7C54-4821-A34E-AEEFD62DED93"
           
                $key += "\{$contactsGUID}"

                if (Test-Path "$key")
                {
                    if ($app -notmatch $exclude)
                    {
                        DeviceAccessApp -app $app -guid $contactsGUID -value $value
                    }
                }
            }
        }
    }

Function Calendar([string]$value){
        DeviceAccess -guid "D89823BA-7180-4B81-B50C-7E471E6121A3" -value $value
    }

Function AccountInfo([string]$value){
        DeviceAccess -guid "C1D23ACC-752B-43E5-8448-8D0E519CD6D6" -value $value
    }

Function Messaging([string]$value){

        DeviceAccess -guid "992AFA70-6F47-4148-B3E9-3003349C1548" -value $value
    }

Function Radios([string]$value){

        DeviceAccess -guid "A8804298-2D5F-42E3-9531-9C8C39EB29CE" -value $value
    }

Function OtherDevices([string]$value){

        DeviceAccessName -name "LooselyCoupled" -value $value
    }

Function FeedbackFrequency([int]$value){

        if ($value -lt 0)
        {
            # remove entry
            Remove-RegistryValue -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name NumberOfSIUFInPeriod
            Remove-RegistryValue -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name PeriodInNanoSeconds
        }
        else
        {
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name NumberOfSIUFInPeriod -Value $value
            Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name PeriodInNanoSeconds -Value $value
        }
}

Function AppNotifications([string]$value){
        DeviceAccess -guid "52079E78-A92B-413F-B213-E8FE35712E72" -value $value

    }    

Function AppDiagnostics([string]$value){
        DeviceAccess -guid "2297E4E2-5DBE-466D-A12B-0F8286F0D9CA" -value $value
        Add-RegistryString -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name Value -Value $value
        Add-RegistryString -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name Value -Value $value
        Add-RegistryString -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name Value -Value $value
        Add-RegistryString -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name Value -Value $value
    } 

Function DoNotTrack([int]$value){
[string]$EdgeKey = "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge"

       # 1 adds the Do Not Track Header, 0 does not
        Add-RegistryDWord -Path "$EdgeKey\Main" -Name DoNotTrack -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name ConfigureDoNotTrack -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\TabletPC" -Name PreventHandwritingDataSharing -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\HandwritingErrorReports" -Name PreventHandwritingErrorReports -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\Personalization" -Name NoLockScreenCamera -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Name DisableWebSearch -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Name DisablePasswordReveal -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\AppCompat" -Name DisableInventory -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\AppCompat" -Name DisableUAR -Value $value
        If ($PCType -like "*Desktop*"){
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" -Name DisableSensors -Value $value
        }
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" -Name DisableLocation -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" -Name DisableWindowsLocationProvider -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" -Name DisableLocationScripting -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Google\Chrome\StabilityMetrics" -Name user_experience_metrics.stability.exited_cleanly -Value $value
}

     # ----------- Edge Browser Privacy Functions -----------

Function SearchSuggestions([int]$value){
[string]$EdgeKey = "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge"
    
       # 0 disables search suggestions, 1 does not
        Add-RegistryDWord -Path "$EdgeKey\User\Default\SearchScopes" -Name ShowSearchSuggestionsGlobal -Value $value
        Add-RegistryDWord -Path "$EdgeKey\Main" -Name ShowSearchSuggestionsGlobal -Value $value
        Add-RegistryDWord -Path "$EdgeKey\ServiceUI" -Name EnableCortana -Value $value
        Add-RegistryDWord -Path "$EdgeKey\ServiceUI" -Name ShowSearchHistory -Value $value
        New-Item -Path "$EdgeKey\ServiceUI\ShowSearchHistory" -ItemType Dword -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Windows Search" -Name CortanaConsent -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Name ConnectedSearchUseWeb -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Name AllowCloudSearch -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Name AllowSearchToUseLocation -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name BingSearchEnabled -Value $value

       
    }

Function PagePrediction([int]$value){
[string]$EdgeKey = "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge"
    
       # 0 disables PagePrediction, 1 enables them
        Add-RegistryDWord -Path "$EdgeKey\FlipAhead" -Name FPEnabled -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Edge" -Name UserFeedbackAllowed -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Edge" -Name AutofillCreditCardEnabled -Value $value
    }

Function PhishingFilter([int]$value){
[string]$EdgeKey = "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge"
    
       # 0 disables PhishingFilter, 1 enables it
        Add-RegistryDWord -Path "$EdgeKey\PhishingFilter" -Name EnabledV9 -Value $value
        Add-RegistryDWord -Path "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" -Name EnabledV9 -Value $value 
 }

Function StartTrackProgs([int]$value){
        Add-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Start_TrackProgs -Value $value
        
        #Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name SearchSuggestEnabled -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name PersonalizationReportingEnabled -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name PaymentMethodQueryEnabled -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name SendSiteInfoToImproveServices -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name MetricsReportingEnabled -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name AddressBarMicrosoftSearchInBingProviderEnabled -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name UserFeedbackAllowed -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name AutofillCreditCardEnabled -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name AutofillAddressEnabled -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name LocalProvidersEnabled -Value $value

    }

Function TailoredExperiences([int]$value){
        Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name TailoredExperiencesWithDiagnosticDataEnabled -Value $value
        Add-RegistryDWord -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name TailoredExperiencesWithDiagnosticDataEnabled -Value $value
    }

Function ShareUpdates([int]$value){



        # 0 = Off
        # 1 = PCs on my local network
        # 3 = PCs on my local network, and PCs on the Internet

        Add-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name DODownloadMode -Value $value 
         
        Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\DeliveryOptimization" -Name DODownloadMode -Value $value
        Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" -Name SystemSettingsDownloadMode -Value $value       
    }

Function WifiSense([int]$value){
    $WifiSense1 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting"
    $WifiSense2 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots"
    $WifiSense3 = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
    If (!(Test-Path $WifiSense1)) {
	    New-Item $WifiSense1
    }
    Add-RegistryDWord $WifiSense1 -Name  'Value' -Value $value -Force
	If (!(Test-Path $WifiSense2)) {
	    New-Item $WifiSense2
    }
    Add-RegistryDWord $WifiSense2 -Name  'Value' -Value $value -Force 
	Add-RegistryDWord $WifiSense3 -Name  'AutoConnectAllowedOEM' -Value $value -Force

    Add-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name WiFiSenseCredShared -Value $value        
    Add-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name WiFiSenseOpen -Value $value        
    }

Function SpyNet([bool]$enable){

        # Access to these registry keys are not allowed for administrators
        # so this does not work until we change those,
        # we give admins full permissions and after updating the values change it back.
        # Disable Windows Defender submission of samples and reporting.
       

$definition = @"
using System;
using System.Runtime.InteropServices;
namespace Win32Api
{
    public class NtDll
    {
        [DllImport("ntdll.dll", EntryPoint="RtlAdjustPrivilege")]
        public static extern int RtlAdjustPrivilege(ulong Privilege, bool Enable, bool CurrentThread, ref bool Enabled);
    }
}
"@
                 
        if (-not ("Win32Api.NtDll" -as [type])) 
        {
            Add-Type -TypeDefinition $definition -PassThru | out-null
        }
        else
        {
             ("Win32Api.NtDll" -as [type]) | Out-Null
        }
       
        $bEnabled = $false
        # Enable SeTakeOwnershipPrivilege
        $res = [Win32Api.NtDll]::RtlAdjustPrivilege(9, $true, $false, [ref]$bEnabled)

        $adminGroupSID = "S-1-5-32-544"

        $adminGroupName = (get-wmiobject -class "win32_account" -namespace "root\cimv2" | where-object{$_.sidtype -eq 4 -and $_.Sid -eq "$adminGroupSID"}).Name 

        # we take ownership from SYSTEM and I tried to give it back but that failed. I don't think that's a problem.
        $key = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows Defender\Spynet", [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,[System.Security.AccessControl.RegistryRights]::takeownership)
        $acl = $key.GetAccessControl()
        $acl.SetOwner([System.Security.Principal.NTAccount]$adminGroupName)
        $key.SetAccessControl($acl)

        $rule = New-Object System.Security.AccessControl.RegistryAccessRule ("$adminGroupName","FullControl","Allow")
        $acl.SetAccessRule($rule)
        $key.SetAccessControl($acl)

        if ($enable)
        {
            #Add-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet" -Name "SpyNetReporting" -Value 2
            Add-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Value 1 
        }
        else
        {
            #Add-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet" -Name "SpyNetReporting" -Value 0    
            Add-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Value 0                   
        }      

        # remove FUll Access ACE again
        $acl.RemoveAccessRule($rule) | Out-Null
        $key.SetAccessControl($acl)
    
    }

Function Telemetry ([bool]$enable){

      
        # http://winaero.com/blog/how-to-disable-telemetry-and-data-collection-in-windows-10/
        # this covers Diagnostic and usage data in 'Feedback and diagnostics'
        if ($enable)
        {
            Set-service -Name DiagTrack -Status Running -StartupType Automatic
            if ((Get-Service | where Name -eq dmwappushservice).count -eq 1)
            {
                & sc.exe config dmwappushservice start= delayed-auto | Out-Null
                Set-service -Name dmwappushservice -Status Running
            }
            # just setting the value to zero did not do the trick.
            Remove-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name 'AllowTelemetry'
            Add-RegistryDWord -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Value 1
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener' -Name 'Start' -Value 1
            Add-RegistryDWord -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Name 'ShowedToastAtLevel' -Value 1 

            reg load HKU\Default_User $env:HOMEDRIVE\Users\Default\NTUSER.DAT
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -Value 1 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Value 1 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -Value 1 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEnabled' -Value 1 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEverEnabled' -Value 1 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'OemPreInstalledAppsEnabled' -Value 1 
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'RotatingLockScreenEnabled' -Value 1 
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'RotatingLockScreenOverlayEnabled' -Value 1
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SoftLandingEnabled' -Value 1
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-353698Enabled' -Value 1 
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-338388Enabled' -Value 1
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-338389Enabled' -Value 1
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-353696Enabled' -Value 1
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-338393Enabled' -Value 1
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-353694Enabled' -Value 1
            reg unload HKU\Default_User
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\CDPUserSvc' -Name 'Start' -Value '2' 
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc' -Name 'Start' -Value '2'  
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\ControlSet001\Services\dmwappushsvc' -Name 'Start' -Value '2'  
        }
        else
        {            
            Stop-Service -Name DiagTrack -Force
            Set-service -Name DiagTrack -StartupType Disabled
            
            if((Get-Service | where Name -eq dmwappushservice).count -eq 1)
            {
                Stop-Service -Name dmwappushservice -Force
                Set-service -Name dmwappushservice -StartupType Disabled
            }

            # Disable data collection and telemetry settings.
            Add-RegistryDWord -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name 'AllowTelemetry' -Value 0 
            Add-RegistryDWord -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Value 0 
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener' -Name 'Start' -Value 0
            Add-RegistryDWord -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Name 'ShowedToastAtLevel' -Value 0 

            reg load HKU\Default_User $env:HOMEDRIVE\Users\Default\NTUSER.DAT
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -Value 0
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Value 0
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -Value 0 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEnabled' -Value 0 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEverEnabled' -Value 0 
            Add-RegistryDWord -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'OemPreInstalledAppsEnabled' -Value 0 
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'RotatingLockScreenEnabled' -Value 0 
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'RotatingLockScreenOverlayEnabled' -Value 0
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SoftLandingEnabled' -Value 0
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-353698Enabled' -Value 0 
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-338388Enabled' -Value 0
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-338389Enabled' -Value 0
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-353696Enabled' -Value 0
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-338393Enabled' -Value 0
            Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name 'SubscribedContent-353694Enabled' -Value 0
            reg unload HKU\Default_User
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\CDPUserSvc' -Name 'Start' -Value '4' 
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc' -Name 'Start' -Value '4' 
            Add-RegistryDWord -Path 'HKLM:\SYSTEM\ControlSet001\Services\dmwappushsvc' -Name 'Start' -Value '4' 
                                    
        }
    }

Function PrivacyMisc([int]$value){
#Values from OOSU10. https://www.oo-software.com/en/shutup10

Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Clipboard" -Name EnableClipboardHistory -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" -Name Enabled -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" -Name Enabled -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" -Name Enabled -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" -Name Enabled -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Speech" -Name AllowSpeechModelUpdate -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Microsoft\Speech_OneCore\Preferences" -Name ModelDownloadAllowed -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" -Name Enabled -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\InputPersonalization" -Name AllowInputPersonalization -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Policies\Microsoft\InputPersonalization" -Name AllowInputPersonalization -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" -Name Enabled -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\Messaging" -Name AllowMessageSync -Value $value
Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Microsoft\PolicyManager\current\device\Bluetooth" -Name AllowAdvertising -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Microsoft\PolicyManager\current\device\Browser" -Name AllowAddressBarDropdown -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Microsoft\PolicyManager\current\device\System" -Name AllowExperimentation -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name AllowClipboardHistory -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name AllowCrossDeviceClipboard -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\AppCompat" -Name AITEnable -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name EnableActivityFeed -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name PublishUserActivities -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name UploadUserActivities -Value $value
Add-RegistryDWord -Path "HKLM:\Software\Microsoft\SQMClient\Windows" -Name CEIPEnable -Value $value



}

Function PrivacyMisc2([bool]$enable){
  
  if ($enable)
        {
    Remove-RegistryValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync" -Name SyncPolicy
    Add-RegistryString -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name SmartScreenEnabled -Value 'On'   
  }
  else{
  Add-RegistryString -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name SmartScreenEnabled -Value 'Off'
  Add-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync" -Name SyncPolicy -Value 5
  Add-RegistryDWord -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SPP" -Name LastIndex -Value 56
  Add-RegistryDWord -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name LastIndex -Value 56
  }

}

    # ----------- Grouping Functions -----------

Function Set-StrictPrivacyFeature([bool]$enable){
        #enabled for -default, disabled for -strong and -balanced

        $AllowDeny = "Deny"
        $OnOff = 0      
        $OffOn = 1  
        
        if ($enable)
        {
            $AllowDeny = "Allow"
            $OnOff = 1
            $OffOn = 0
        }

        # General
        AdvertisingId -value $OnOff
        ImproveTyping -value $OnOff 
        PrivacyMisc -value $OnOff         
        # Location
        Location -value $AllowDeny
        # Camera
        Camera -value $AllowDeny
        # Microphone
        Microphone -value $AllowDeny
        # Speach, Inking, Typing
        SpeachInkingTyping -enable $enable
        # Account Info
        AccountInfo -value $AllowDeny
        # Contacts
        Contacts -value $AllowDeny
        # Calendar
        Calendar -value $AllowDeny
        # Messaging
        Messaging -value $AllowDeny
        # Radios
        Radios -value $AllowDeny
        # Other devices
        OtherDevices -value $AllowDeny
        # Let Apps Access My notifications
        AppNotifications -value $AllowDeny
        # Let apps access my call history
        CallHistory -value $AllowDeny
        # Let Apps access and send email
        Email -value $AllowDeny
        # Let apps access tasks
        Tasks -value $AllowDeny
        # Let apps access diagnostics of other apps
        AppDiagnostics -value $AllowDeny
        # Feedback & diagnostics         
        if ($enable)
        {
            FeedbackFrequency -value -1
        }
        else
        {
            FeedbackFrequency -value 0
        }

        # Edge

        DoNotTrack -value $OffOn
        SearchSuggestions -value $OnOff 
        PagePrediction -value $OnOff 
        #PhishingFilter -value $OnOff 
        StartTrackProgs -value $OnOff
        TailoredExperiences -value $OnOff
        
        
    }

Function Set-MiscPrivacyFeature([bool]$enable){            
        #enabled for -default and -balanced disabled for -strong 

        if ($enable)
        {
            SmartScreen -value 1
            #LanguageList -value 0
        }
        else
        {
            SmartScreen -value 0
            #LanguageList -value 1

        }
    }

#Restore

Function RepairMachine{

        Add-OutputBoxLine -Message "==> Repairing $PCType..."
        Add-OutputBoxLine -Message "--- This may take a while - please be patient ---"
        Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /CheckHealth' -Wait
        Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /ScanHealth' -Wait 
        Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /RestoreHealth' -Wait
        Start-Process -FilePath 'DISM.exe' -ArgumentList '/Online /Cleanup-Image /RestoreHealth /Source:repairSource\install.wim' -Wait
        Start-Process -FilePath 'sfc.exe' -ArgumentList '/scannow' -Wait -verbose 
        #Start-Process -FilePath 'chkdsk.exe' -ArgumentList 'c: /f' -Wait
        nbtstat /R 
        nbtstat /RR
        Start-Process -FilePath 'ipconfig.exe' -ArgumentList '/release' -Wait -verbose
        Start-Process -FilePath 'ipconfig.exe' -ArgumentList '/flushdns' -Wait -verbose 
        Start-Process -FilePath 'ipconfig.exe' -ArgumentList '/renew' -Wait -verbose 
        Start-Process -FilePath 'ipconfig.exe' -ArgumentList '/registerdns' -Wait -verbose 
 
        netsh winsock reset catalog 2
        netsh int ip reset reset.log﻿

        #Start-Process -FilePath 'wsreset.exe' -Wait -WindowStyle Hidden -verbose 

        $d = Get-PnpDevice| where {$_.class -like "Display*"}
        $d  | Disable-PnpDevice -Confirm:$false
        $d  | Enable-PnpDevice -Confirm:$false
       
        Add-OutputBoxLine-Green -Message "==> Repair finished"              
}

Function RestoreForm{

        $RestoreForm = New-Object System.Windows.Forms.Form
        $RestoreForm.ClientSize = '277,436'
        $RestoreForm.Text = "Select to Restore or Repair"
        $RestoreForm.TopMost = $false
        $RestoreForm.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#093a60")

        $BoostRestore = New-Object System.Windows.Forms.Button
        $BoostRestore.Text = "Restore Boost"
        $BoostRestore.width = 245
        $BoostRestore.height = 84
        $BoostRestore.location = New-Object System.Drawing.Point(16,38)
        $BoostRestore.Font = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
        $BoostRestore.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
        $BoostRestore.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
        $BoostRestore.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
        $RestoreForm.controls.Add($BoostRestore)
        
        $PrivacyRestore = New-Object System.Windows.Forms.Button
        $PrivacyRestore.Text = "Restore Privacy"
        $PrivacyRestore.width = 245
        $PrivacyRestore.height = 84
        $PrivacyRestore.location = New-Object System.Drawing.Point(16,130)
        $PrivacyRestore.Font = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
        $PrivacyRestore.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
        $PrivacyRestore.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
        $PrivacyRestore.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
        $RestoreForm.controls.Add($PrivacyRestore)

        $RestorePoint = New-Object System.Windows.Forms.Button
        $RestorePoint.Text = "Restore System"
        $RestorePoint.width = 245
        $RestorePoint.height = 84
        $RestorePoint.location = New-Object System.Drawing.Point(16,314)    
        $RestorePoint.Font = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
        $RestorePoint.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
        $RestorePoint.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
        $RestorePoint.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
        $RestoreForm.controls.Add($RestorePoint)

        $GameRestore = New-Object System.Windows.Forms.Button
        $GameRestore.Text = "Restore Game"
        $GameRestore.width = 245
        $GameRestore.height = 84
        $GameRestore.location = New-Object System.Drawing.Point(16,222)
        $GameRestore.Font = New-Object System.Drawing.Font('Arial',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
        $GameRestore.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
        $GameRestore.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#2b9eff")
        $GameRestore.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
        $RestoreForm.controls.Add($GameRestore)

        $TooltipBoostRest = New-Object system.Windows.Forms.ToolTip
        $TooltipBoostRest.SetToolTip($BoostRestore, "Restore Registry and Services")

        $TooltipPrivacy = New-Object system.Windows.Forms.ToolTip
        $TooltipPrivacy.SetToolTip($PrivacyRestore, "Restore Privacy Registry")

        $TooltipPoint = New-Object system.Windows.Forms.ToolTip
        $TooltipPoint.SetToolTip($RestorePoint, "Go to System Restore")

        $TooltipGames = New-Object system.Windows.Forms.ToolTip
        $TooltipGames.SetToolTip($GameRestore, "Restore Game Settings")

        $BoostRestore.Add_Click({
        Add-OutputBoxLine -Message "==> Restoring boost registry settings..."

        if ($osInfo -like '*Windows 7*') {
        Default-ServicesWIN7
        }
        elseif ($osInfo -like '*Windows 8*') {
        Default-ServicesWIN8
        }
        elseif ($osInfo -like '*Windows 10*') {
        Default-ServicesWIN10
        }
        else{
        Write-host 'No OS found'
        }
        WindowsComponents -enable $false
        UserPreference -enable $false
        SystemSpeedup -enable $false
        NetworkSpeedup -enable $false
        Hibernate -enable $false
        BootTimeOut -enable $false
        Add-OutputBoxLine-Green -Message "==> Restored boost registry settings"   
})

        $PrivacyRestore.Add_Click( {

        Add-OutputBoxLine -Message "==> Restoring privacy settings..."
        $progressBar1.Maximum = 7
        $progressBar1.Step = 1
        $progressBar1.Value = 0
        Set-MiscPrivacyFeature -enable $true
        $progressBar1.PerformStep()
        Set-StrictPrivacyFeature -enable $true
        $progressBar1.PerformStep()  
        ShareUpdates -value 3
        $progressBar1.PerformStep()
        WifiSense -value 1
        $progressBar1.PerformStep()
        Telemetry -enable $true
        $progressBar1.PerformStep()
        SpyNet -enable $true
        $progressBar1.PerformStep()
        PrivacyMisc2 -enable $true
        $progressBar1.PerformStep()
        Add-OutputBoxLine-Green -Message "==> Restored privacy settings"   

})
        
        $RestorePoint.Add_Click({
        Add-OutputBoxLine -Message "==> Opening System Restore..."
        Start-Process -FilePath 'rstrui.exe'
        })
        
        $GameRestore.Add_Click({
        Gamesettings -enable $false     
        })


        [void]$RestoreForm.ShowDialog()       
}
     
#-----------------------------------------------------------[Execution]------------------------------------------------------------

Stop-Transcript| Out-Null
Start-Log
dotInclude 'DeleteAppList.ps1'
dotInclude 'RestoreAppList.ps1'

#Hide Console
HideConsole

Add-OutputBoxLine-Yellow -Message " ========================================================================="
Add-OutputBoxLine-Yellow -Message " |           Welcome to System Clean-Up and Boost Ver. $version(Beta)         |"            
Add-OutputBoxLine-Yellow -Message " |                                                                       |"
Add-OutputBoxLine-Yellow -Message " |                          Made by Martijn G.                           |"
Add-OutputBoxLine-Yellow -Message " ========================================================================="

#Check Updates
Process-Updates

$ScanWindows.Add_Click({
$progressBar1.Value = 0
QuickScan-Defender})

$RestorePoint.Add_Click({
$progressBar1.Value = 0
RestoreForm
})

$Reboot.Add_Click({
$progressBar1.Value = 0
Reboot-System
})

$RemoveAppx.Add_Click({
$progressBar1.Value = 0
Appx-Remove
})

$RestoreAppx.Add_Click({
$progressBar1.Value = 0
Appx-Restore})

$MoveUpdateFolder.Add_Click({
$progressBar1.Value = 0
Junction-Updatefolder
})

$RestoreUpdate.Add_Click({
$progressBar1.Value = 0
Restore-Updatefolder})

$Label5.Add_DoubleClick({

$Feed.Text = ''
Clear-Host
Add-OutputBoxLine-Yellow -Message " ========================================================================="
Add-OutputBoxLine-Yellow -Message " |           Welcome to System Clean-Up and Boost Ver. $version(Beta)         |"            
Add-OutputBoxLine-Yellow -Message " |                                                                       |"
Add-OutputBoxLine-Yellow -Message " |                          Made by Martijn G.                           |"
Add-OutputBoxLine-Yellow -Message " ========================================================================="
})

$CleanButton.Add_Click({
$StopWatch1 = New-Object -TypeName System.Diagnostics.Stopwatch 
$StopWatch1.Start() 
$_.Cancel = $true

Add-OutputBoxLine -Message "==> Start Clean-Up..." 
$FreespaceBefore = (Get-WmiObject win32_logicaldisk -filter "DeviceID='C:'" | select Freespace).FreeSpace/(1e+9)

$progressBar1.Maximum = 14
$progressBar1.Step = 1
$progressBar1.Value = 0

$progressBar1.PerformStep()
$question = [System.Windows.Forms.MessageBox]::Show('Do you want to remove Empty Folders? This will take a while.', 'Remove Empty Folders', 'YesNo', 'Question')
    (New-Object -ComObject WScript.Shell).AppActivate(($question).MainWindowTitle)
    if ('Yes' -eq $question) {
    if(Test-Path -Path $env:ProgramFiles){Delete-EmptyFolder -path "$env:ProgramFiles"}
    if(Test-Path -Path ${env:ProgramFiles(x86)}){Delete-EmptyFolder -path "${env:ProgramFiles(x86)}"}
    if(Test-Path -Path $env:USERPROFILE){Delete-EmptyFolder -path "$env:USERPROFILE"}
    }
$progressBar1.PerformStep()
DISM-Cleanup
$progressBar1.PerformStep()
Delete-Rougefolders
$progressBar1.PerformStep()
Delete-Junk
$progressBar1.PerformStep()
Delete-Updatedownloads
$progressBar1.PerformStep()
Delete-Volumeshadow
$progressBar1.PerformStep()
Clear-Cache
$progressBar1.PerformStep()
#delete all System Restore Points older than 14 days 
$removeDate = (Get-Date).AddDays(-14) 
Get-ComputerRestorePoint |  
        Where { $_.ConvertToDateTime($_.CreationTime) -lt  $removeDate } |  
        Delete-ComputerRestorePoint
$progressBar1.PerformStep()
Remove-InvalidStartMenuItem
$progressBar1.PerformStep()
Windows-Cleanmgr
$progressBar1.PerformStep()
CCleaner-Clean
$progressBar1.PerformStep()
Clear-Eventlogs
$progressBar1.PerformStep()

$FreespaceAfter = (Get-WmiObject win32_logicaldisk -filter "DeviceID='C:'" | select Freespace).FreeSpace/(1e+9)
$FreeSpaced = ($FreespaceAfter - $FreespaceBefore)
$SpaceFreed.text = [math]::Round($FreeSpaced,3), 'GB'
$global:SpaceFree = $SpaceFreed.text 

$progressBar1.PerformStep()
Add-OutputBoxLine-Green -Message "==> Clean-Up Finished!" 
Add-OutputBoxLine -Message "Space Cleared: $global:SpaceFree"

$stopwatch1.Stop()
$global:TimeClean = $($StopWatch1.Elapsed.ToString())
Write-host "$global:TimeClean"
})

$BoostButton.Add_Click({  
$progressBar1.Maximum = 13
$progressBar1.Step = 1
$progressBar1.Value = 0

Add-OutputBoxLine -Message "==> Start Boost..." 
Create-ComputerRestorePoint
$progressBar1.PerformStep()

$StopWatch2 = New-Object -TypeName System.Diagnostics.Stopwatch 
$StopWatch2.Start() 
$progressBar1.PerformStep()

Disable-Services -enable $true
$progressBar1.PerformStep()
Disable-Features
$progressBar1.PerformStep()
Disable-Tasks 
$progressBar1.PerformStep()
Defrag-Schedule
$progressBar1.PerformStep()
WindowsComponents -enable $true
$progressBar1.PerformStep() 
UserPreference -enable $true
$progressBar1.PerformStep()
SystemSpeedup -enable $true
$progressBar1.PerformStep()
NetworkSpeedup -enable $true
$progressBar1.PerformStep()
Hibernate -enable $true
$progressBar1.PerformStep()
BootTimeOut -enable $true
$progressBar1.PerformStep()
Clean-OldDevice
$progressBar1.PerformStep()
Add-OutputBoxLine-Green -Message "==> Boost Finished!" 

$Stopwatch2.Stop()
$global:TimeBoost = $($StopWatch2.Elapsed.ToString())
Write-host "$global:TimeBoost"


})

$PrivacyButton.Add_Click({

if ($osInfo -like '*Windows 10*') {
Add-OutputBoxLine -Message "==> Start setting privacy..."
$progressBar1.Maximum = 8
$progressBar1.Step = 1
$progressBar1.Value = 0 

$progressBar1.PerformStep() 
Set-MiscPrivacyFeature -enable $false
$progressBar1.PerformStep()
Set-StrictPrivacyFeature -enable $false
$progressBar1.PerformStep() 
ShareUpdates -value 0
$progressBar1.PerformStep()
WifiSense -value 0
$progressBar1.PerformStep()
Telemetry -enable $false
$progressBar1.PerformStep()
SpyNet -enable $false
$progressBar1.PerformStep()
PrivacyMisc2 -enable $false
$progressBar1.PerformStep()
Add-OutputBoxLine-Green -Message "==> Finished setting privacy..."
}
else
{Add-OutputBoxLine-Red -Message "==> Privacy settings are only for Windows 10..."
}
})

$PictureBox9.Add_Click({

$question = [System.Windows.Forms.MessageBox]::Show('Enable GameSettings?', 'GameSettings?', 'YesNo', 'Question')
    (New-Object -ComObject WScript.Shell).AppActivate(($question).MainWindowTitle)
    if ('Yes' -eq $question) {
    GameSettings -enable $true
    }
})

$PictureBox11.Add_Click({
$question = [System.Windows.Forms.MessageBox]::Show('You want to repair your Machine?', 'Repair Machine?', 'YesNo', 'Question')
    (New-Object -ComObject WScript.Shell).AppActivate(($question).MainWindowTitle)
    if ('Yes' -eq $question) {
    RepairMachine
    }

})

$Form.ShowDialog()

