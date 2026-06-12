Clear-Host

Write-Host ""
Write-Host "========================================================"
Write-Host ""
Write-Host "        __  __      _ ______     __  __  ______" -ForegroundColor Cyan
Write-Host "       / / / /___  (_) ____/__  / /_/ / / /  _/" -ForegroundColor Cyan
Write-Host "      / / / / __ \/ / / __/ _ \/ __/ / / // /" -ForegroundColor Cyan
Write-Host "     / /_/ / / / / / /_/ /  __/ /_/ /_/ // /" -ForegroundColor Cyan
Write-Host "     \____/_/ /_/_/\____/\___/\__/\____/___/" -ForegroundColor Cyan
Write-Host "          UniGetUI Package Installer Script" 
Write-Host "        Created with UniGetUI Version 2026.2.0"
Write-Host ""
Write-Host "========================================================"
Write-Host ""
Write-Host "NOTES:" -ForegroundColor Yellow
Write-Host "  - The install process will not be as reliable as importing a bundle with UniGetUI. Expect issues and errors." -ForegroundColor Yellow
Write-Host "  - Packages will be installed with the install options specified at the time of creation of this script." -ForegroundColor Yellow
Write-Host "  - Error/Sucess detection may not be 100% accurate." -ForegroundColor Yellow
Write-Host "  - Some of the packages may require elevation. Some of them may ask for permission, but others may fail. Consider running this script elevated." -ForegroundColor Yellow
Write-Host "  - You can skip confirmation prompts by running this script with the parameter `/DisablePausePrompts` " -ForegroundColor Yellow
Write-Host ""
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
Write-Host ""
Write-Host "This script will attempt to install the following packages:"
Write-Host " 1 - Internet Download Manager"
Write-Host " 2 - Windows App Runtime 1.8"
Write-Host " 3 - MobaXterm"
Write-Host " 4 - Mail Master"
Write-Host " 5 - TRAE SOLO"
Write-Host " 6 - MPC-BE"
Write-Host " 7 - PotPlayer"
Write-Host " 8 - HandBrake"
Write-Host " 9 - WeChat"
Write-Host "10 - Microsoft Edge"
Write-Host "11 - VLC media player"
Write-Host "12 - Python Launcher"
Write-Host "13 - Trae"
Write-Host "14 - WPS Office"
Write-Host "15 - Windows App Runtime 1.6"
Write-Host "16 - Microsoft GameInput"
Write-Host "17 - DBX"
Write-Host "18 - OneCommander"
Write-Host "19 - Microsoft Visual C++ 2015 UWP Runtime Package"
Write-Host "20 - Xterminal"
Write-Host "21 - 7-Zip ZS"
Write-Host "22 - 360ChromeX"
Write-Host "23 - Microsoft Visual C++ 2015-2022 Redistributable (x86)"
Write-Host "24 - OBS Studio"
Write-Host "25 - WinFsp 2025"
Write-Host "26 - Tabbit Browser"
Write-Host "27 - App Installer"
Write-Host "28 - Windows App Runtime 1.4"
Write-Host "29 - Windows App Runtime 1.5"
Write-Host "30 - Git"
Write-Host "31 - UniGetUI (MS Store)"
Write-Host "32 - WinRAR"
Write-Host "33 - LocalSend"
Write-Host "34 - Microsoft .NET Windows Desktop Runtime 10.0"
Write-Host "35 - FFmpeg"
Write-Host "36 - pgAdmin 4"
Write-Host "37 - Quark"
Write-Host "38 - Microsoft .NET Native Runtime"
Write-Host "39 - Clash Verge Rev"
Write-Host "40 - Caesium Image Compressor"
Write-Host "41 - Tencent Meeting"
Write-Host "42 - QQBrowser"
Write-Host "43 - RealVNC Viewer"
Write-Host "44 - Microsoft .NET Windows Desktop Runtime 6.0"
Write-Host "45 - Java(TM) SE Development Kit 17"
Write-Host "46 - DingTalk"
Write-Host "47 - Microsoft Visual C++ 2015-2022 Redistributable (x64)"
Write-Host "48 - Windows App Runtime 1.7"
Write-Host "49 - FastCopy"
Write-Host "50 - QuickLook"
Write-Host "51 - Thunder"
Write-Host "52 - Wireshark"
Write-Host "53 - Mem Reduct"
Write-Host "54 - Python 3.14"
Write-Host "55 - Notepad++"
Write-Host "56 - Microsoft Visual C++ 2015 UWP Desktop Runtime Package"
Write-Host "57 - GeekUninstaller"
Write-Host "58 - Listary"
Write-Host "59 - LiteMonitor"
Write-Host "60 - NETworkManager"
Write-Host "61 - Go Programming Language"
Write-Host "62 - ToDesk"
Write-Host "63 - aDrive"
Write-Host "64 - Microsoft .NET Windows Desktop Runtime 7.0"
Write-Host "65 - Node.js"
Write-Host "66 - BaiduNetdisk"
Write-Host "67 - 360CleanMaster"
Write-Host "68 - QQ"
Write-Host "69 - UniGetUI (MS Store)"
Write-Host "70 - Everything Lite"
Write-Host "71 - ZhiPu"
Write-Host "72 - Google Chrome"
Write-Host "73 - Windows Terminal"
Write-Host "74 - Microsoft .NET Windows Desktop Runtime 9.0"
Write-Host "75 - CloudHome"
Write-Host "76 - Cryptomator"
Write-Host "77 - Qoder"
Write-Host "78 - Tiny RDM"
Write-Host "79 - Upscayl"
Write-Host "80 - Apifox"
Write-Host "81 - Microsoft .NET Windows Desktop Runtime 8.0"
Write-Host "82 - DouBao"
Write-Host "83 - UURemote"
Write-Host "84 - DirectX End-User Runtime"
Write-Host "85 - Qview"
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
Clear-Host

# Check if directory C:\ProgramFiles exists, if not, create it
if (-not (Test-Path "C:\ProgramFiles")) {
    Write-Host ">>> Directory C:\ProgramFiles does not exist, creating..." -ForegroundColor Cyan
    try {
        New-Item -Path "C:\ProgramFiles" -ItemType Directory -Force | Out-Null
        Write-Host ">>> Directory C:\ProgramFiles created successfully." -ForegroundColor Green
    } catch {
        Write-Host ">>> Failed to create directory C:\ProgramFiles: $($_.Exception.Message)" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host ">>> Directory C:\ProgramFiles already exists." -ForegroundColor Gray
}

# update App Installer
Write-Host "Updating App Installer..." -ForegroundColor Cyan
winget upgrade --id Microsoft.AppInstaller --silent --accept-source-agreements --accept-package-agreements

$success_count=0
$failure_count=0
$commands_run=0
$results=""
$log_results=""

$commands= @(
    'cmd.exe /C winget.exe install --id "Tonec.InternetDownloadManager" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\IDM" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsAppRuntime.1.8" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Mobatek.MobaXterm" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "NetEase.MailMaster" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\MailMaster" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "ByteDance.TraeSolo" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\TraeSolo"',
    'cmd.exe /C winget.exe install --id "MPC-BE.MPC-BE" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\MPCBE" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Daum.PotPlayer" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\PotPlayer"',
    'cmd.exe /C winget.exe install --id "HandBrake.HandBrake" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\HandBrake"',
    'cmd.exe /C winget.exe install --id "Tencent.WeChat.Universal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\WeiXin"',
    'cmd.exe /C winget.exe install --id "Microsoft.Edge" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "VideoLAN.VLC" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\VLC"',
    'cmd.exe /C winget.exe install --id "Python.Launcher" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "ByteDance.Trae" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\Trae"',
    'cmd.exe /C winget.exe install --id "Kingsoft.WPSOffice.CN" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\WPSOffice"',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsAppRuntime.1.6" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.GameInput" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "t8y2.DBX" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\t8y2DBX"',
    'cmd.exe /C winget.exe install --id "MilosParipovic.OneCommander" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\OneCommander"',
    'cmd.exe /C winget.exe install --id "Microsoft.VCLibs.14" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "JiLuo.Xterminal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\Xterminal"',
    'cmd.exe /C winget.exe install --id "mcmilk.7zip-zstd" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\7zip-zstd"',
    'cmd.exe /C winget.exe install --id "360.360Chrome.X" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\360"',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2015+.x86" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "OBSProject.OBSStudio" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\OBS"',
    'cmd.exe /C winget.exe install --id "WinFsp.WinFsp" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLDIR=""C:\ProgramFiles\WinFsp"""',
    'cmd.exe /C winget.exe install --id "Meituan.TabbitBrowser.CN" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\TabbitBrowser" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.AppInstaller" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsAppRuntime.1.4" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsAppRuntime.1.5" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Git.Git" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\Git" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "9NP6T8MGVRXL" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "RARLab.WinRAR" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\WinRAR"',
    'cmd.exe /C winget.exe install --id "LocalSend.LocalSend" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\LocalSend"',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.10" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Gyan.FFmpeg" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\GyanFFmpeg" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "PostgreSQL.pgAdmin" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\pgAdmin"',
    'cmd.exe /C winget.exe install --id "Alibaba.Quark" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\Quark"',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.Native.Runtime" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "ClashVergeRev.ClashVergeRev" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\ClashVergeRev"',
    'cmd.exe /C winget.exe install --id "SaeraSoft.CaesiumImageCompressor" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\CaesiumImageCompressor"',
    'cmd.exe /C winget.exe install --id "Tencent.TencentMeeting" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/SilentInstall=0 /InstallPath=""C:\ProgramFiles\TencentMeeting"""',
    'cmd.exe /C winget.exe install --id "Tencent.QQBrowser" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\QQBrowser"',
    'cmd.exe /C winget.exe install --id "RealVNC.VNCViewer" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLDIR=""C:\ProgramFiles\VNCViewer"""',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.6" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Oracle.JDK.17" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLDIR=""C:\ProgramFiles\JDK17"""',
    'cmd.exe /C winget.exe install --id "Alibaba.DingTalk.Mainland" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\DingTalk"',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2015+.x64" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsAppRuntime.1.7" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "FastCopy.FastCopy" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\FastCopy" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "QL-Win.QuickLook" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLFOLDER=""C:\ProgramFiles\QuickLook"""',
    'cmd.exe /C winget.exe install --id "Thunder.Thunder" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\Thunder"',
    'cmd.exe /C winget.exe install --id "WiresharkFoundation.Wireshark" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\Wireshark"',
    'cmd.exe /C winget.exe install --id "Henry++.MemReduct" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\MemReduct"',
    'cmd.exe /C winget.exe install --id "Python.Python.3.14" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\Python314"',
    'cmd.exe /C winget.exe install --id "Notepad++.Notepad++" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\Notepad++"',
    'cmd.exe /C winget.exe install --id "Microsoft.VCLibs.Desktop.14" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "GeekUninstaller.GeekUninstaller" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\GeekUninstaller" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Bopsoft.Listary" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\Listary" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Diorser.LiteMonitor" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\LiteMonitor" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "BornToBeRoot.NETworkManager" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLDIR=""C:\ProgramFiles\NETworkManager"""',
    'cmd.exe /C winget.exe install --id "GoLang.Go" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\GoLangGo"',
    'cmd.exe /C winget.exe install --id "Youqu.ToDesk" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\Todesk"',
    'cmd.exe /C winget.exe install --id "Alibaba.aDrive" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\aDrive"',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.7" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "OpenJS.NodeJS" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLDIR=""C:\ProgramFiles\NodeJS"""',
    'cmd.exe /C winget.exe install --id "Baidu.BaiduNetdisk" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\BaiduNetdisk"',
    'cmd.exe /C winget.exe install --id "360.360CleanMaster" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\360CleanMaster" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Tencent.QQ.NT" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\QQNT" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "XPFFTQ032PTPHF" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "voidtools.Everything.Lite" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLDIR=""C:\ProgramFiles\EverythingLite"""',
    'cmd.exe /C winget.exe install --id "ZhipuAI.ChatGLM" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\ChatGLM"',
    'cmd.exe /C winget.exe install --id "Google.Chrome" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\Chrome"',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsTerminal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.9" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Kingdee.CloudHub" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\CloudHub"',
    'cmd.exe /C winget.exe install --id "Cryptomator.Cryptomator" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/qn INSTALLDIR=""C:\ProgramFiles\Cryptomator"""',
    'cmd.exe /C winget.exe install --id "Alibaba.Qoder" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\Qoder" --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "TinyCraft.TinyRDM" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\TinyRDM"',
    'cmd.exe /C winget.exe install --id "Upscayl.Upscayl" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\Upscayl"',
    'cmd.exe /C winget.exe install --id "Ruihu.Apifox" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --override "/S /D=C:\ProgramFiles\Apifox"',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.8" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "ByteDance.Doubao" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\Doubao"',
    'cmd.exe /C winget.exe install --id "NetEase.UURemote" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force --location "C:\ProgramFiles\UURemote"',
    'cmd.exe /C winget.exe install --id "Microsoft.DirectX" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "jurplel.qView" --exact --source winget --accept-source-agreements --disable-interactivity --silent --location "C:\ProgramFiles\Qview" --accept-package-agreements --force'
)

foreach ($command in $commands) {
    # Extract package ID from command
    $packageId = "Unknown"
    if ($command -match '--id\s+"([^"]+)"') {
        $packageId = $Matches[1]
    }

    # Extract source from command
    $source = "winget"
    if ($command -match '--source\s+(\S+)') {
        $source = $Matches[1]
    }

    # Check if already installed
    $installed = $false
    try {
        $listResult = winget list --id $packageId --exact --source $source --accept-source-agreements --disable-interactivity 2>$null | Out-String
        if ($listResult -and $listResult -notmatch "No installed package" -and $listResult -match [regex]::Escape($packageId)) {
            $installed = $true
        }
    } catch {
        # If check fails, proceed with install
    }

    if ($installed) {
        Write-Host "$packageId already installed" -ForegroundColor Cyan
        $success_count++
        $results += "$([char]0x1b)[36m$packageId already installed`n"
        $log_results += "$packageId already installed`n"
    } else {
        Write-Host "Installing: $packageId" -ForegroundColor Yellow
        cmd.exe /C $command
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$packageId installed successfully" -ForegroundColor Green
            $success_count++
            $results += "$([char]0x1b)[32m$packageId installed successfully`n"
            $log_results += "$packageId installed successfully`n"
        }
        else {
            Write-Host "$packageId install failed" -ForegroundColor Red
            $failure_count++
            $results += "$([char]0x1b)[31m$packageId install failed`n"
            $log_results += "$packageId install failed`n"
        }
    }
    $commands_run++
    Write-Host ""
}

Write-Host "========================================================"
Write-Host "                  OPERATION SUMMARY"
Write-Host "========================================================"
Write-Host "Total commands run: $commands_run"
Write-Host "Successful: $success_count"
Write-Host "Failed: $failure_count"
Write-Host ""
Write-Host "Details:"
Write-Host "$results$([char]0x1b)[37m"
Write-Host "========================================================"

# Save log to Desktop
$logPath = Join-Path ([Environment]::GetFolderPath("Desktop")) "install_apps.log"
$logContent = @"
========================================================
                  OPERATION SUMMARY
========================================================
Total commands run: $commands_run
Successful: $success_count
Failed: $failure_count

Details:
$log_results
========================================================
"@
try {
    $logContent | Out-File -FilePath $logPath -Encoding utf8 -Force
    Write-Host "Log saved to: $logPath" -ForegroundColor Gray
} catch {
    Write-Host "Failed to save log to: $logPath" -ForegroundColor Red
}

if ($failure_count -gt 0) {
    Write-Host "Some commands failed. Please check the log above." -ForegroundColor Yellow
}
else {
    Write-Host "All commands executed successfully!" -ForegroundColor Green
}

# Disable all startup applications
Write-Host ""
Write-Host "========================================================"
Write-Host "          DISABLING ALL STARTUP APPLICATIONS"
Write-Host "========================================================"
Write-Host ">>> Scanning for startup applications..." -ForegroundColor Cyan

$startupDisabled = 0
$startupSkipped = 0

# 1. Disable Registry Startup Entries (Current User)
$cuRunPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$cuRunOncePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
$cuRunKey = Get-Item -Path $cuRunPath -ErrorAction SilentlyContinue
if ($cuRunKey) {
    foreach ($valueName in $cuRunKey.GetValueNames()) {
        try {
            Remove-ItemProperty -Path $cuRunPath -Name $valueName -Force -ErrorAction Stop
            Write-Host "  [DISABLED] CU:Run - $valueName" -ForegroundColor Green
            $startupDisabled++
        } catch {
            Write-Host "  [SKIPPED] CU:Run - $valueName" -ForegroundColor Gray
            $startupSkipped++
        }
    }
}
$cuRunOnceKey = Get-Item -Path $cuRunOncePath -ErrorAction SilentlyContinue
if ($cuRunOnceKey) {
    foreach ($valueName in $cuRunOnceKey.GetValueNames()) {
        try {
            Remove-ItemProperty -Path $cuRunOncePath -Name $valueName -Force -ErrorAction Stop
            Write-Host "  [DISABLED] CU:RunOnce - $valueName" -ForegroundColor Green
            $startupDisabled++
        } catch {
            Write-Host "  [SKIPPED] CU:RunOnce - $valueName" -ForegroundColor Gray
            $startupSkipped++
        }
    }
}

# 2. Disable Registry Startup Entries (Local Machine)
$lmRunPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
$lmRunOncePath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
$lmRunKey = Get-Item -Path $lmRunPath -ErrorAction SilentlyContinue
if ($lmRunKey) {
    foreach ($valueName in $lmRunKey.GetValueNames()) {
        try {
            Remove-ItemProperty -Path $lmRunPath -Name $valueName -Force -ErrorAction Stop
            Write-Host "  [DISABLED] LM:Run - $valueName" -ForegroundColor Green
            $startupDisabled++
        } catch {
            Write-Host "  [SKIPPED] LM:Run - $valueName" -ForegroundColor Gray
            $startupSkipped++
        }
    }
}
$lmRunOnceKey = Get-Item -Path $lmRunOncePath -ErrorAction SilentlyContinue
if ($lmRunOnceKey) {
    foreach ($valueName in $lmRunOnceKey.GetValueNames()) {
        try {
            Remove-ItemProperty -Path $lmRunOncePath -Name $valueName -Force -ErrorAction Stop
            Write-Host "  [DISABLED] LM:RunOnce - $valueName" -ForegroundColor Green
            $startupDisabled++
        } catch {
            Write-Host "  [SKIPPED] LM:RunOnce - $valueName" -ForegroundColor Gray
            $startupSkipped++
        }
    }
}

# 3. Clear Startup Folder (Current User)
$cuStartupPath = [Environment]::GetFolderPath("Startup")
if (Test-Path $cuStartupPath) {
    $files = Get-ChildItem -Path $cuStartupPath -File -Force
    foreach ($file in $files) {
        try {
            Remove-Item -Path $file.FullName -Force -ErrorAction Stop
            Write-Host "  [DISABLED] CU:Folder - $($file.Name)" -ForegroundColor Green
            $startupDisabled++
        } catch {
            Write-Host "  [SKIPPED] CU:Folder - $($file.Name)" -ForegroundColor Gray
            $startupSkipped++
        }
    }
}

# 4. Clear Startup Folder (Common)
$commonStartupPath = [Environment]::GetFolderPath("CommonStartup")
if (Test-Path $commonStartupPath) {
    $files = Get-ChildItem -Path $commonStartupPath -File -Force
    foreach ($file in $files) {
        try {
            Remove-Item -Path $file.FullName -Force -ErrorAction Stop
            Write-Host "  [DISABLED] Common:Folder - $($file.Name)" -ForegroundColor Green
            $startupDisabled++
        } catch {
            Write-Host "  [SKIPPED] Common:Folder - $($file.Name)" -ForegroundColor Gray
            $startupSkipped++
        }
    }
}

# 5. Disable Scheduled Tasks that start at logon
Write-Host ""
Write-Host ">>> Checking Scheduled Tasks..." -ForegroundColor Cyan
$scheduledTasks = Get-ScheduledTask | Where-Object { 
    $_.Settings.Enabled -eq $true -and 
    $_.Principal.LogonType -ne "ServiceAccount" -and 
    $_.Triggers -match "AtLogon"
}
foreach ($task in $scheduledTasks) {
    try {
        Disable-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath -ErrorAction Stop | Out-Null
        Write-Host "  [DISABLED] Task - $($task.TaskName)" -ForegroundColor Green
        $startupDisabled++
    } catch {
        Write-Host "  [SKIPPED] Task - $($task.TaskName)" -ForegroundColor Gray
        $startupSkipped++
    }
}

Write-Host "========================================================"
Write-Host "Startup cleanup complete: Disabled $startupDisabled, Skipped $startupSkipped" -ForegroundColor Green
Write-Host "========================================================"
Write-Host ""

function Restart-Computer {
    # Restart the computer
    Write-Host "The system will restart in 10 seconds. Press Ctrl+C to cancel." -ForegroundColor Cyan
    try {
        for ($i = 10; $i -ge 0; $i--) {
            Write-Progress -Activity "System Restart Countdown" -Status "The system will restart in $i seconds" -SecondsRemaining $i -PercentComplete ((10-$i)*10)
            Start-Sleep -Seconds 1
        }
        
        Write-Host "`nRestarting system now..." -ForegroundColor Red
        Restart-Computer -Force
        
    } catch {
        Write-Host "`nRestart cancelled by user." -ForegroundColor Green
        exit 0
    }
}

# Ask if user wants to restart the computer
$restart = Read-Host "Do you want to restart the computer now? (y/n)"
if ($restart -eq "y") {
    Restart-Computer
}
