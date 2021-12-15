Write-host "======================================================"
Write-host "Custom Commands:"
Write-host "Elevate - Open a new prompt with elevated permissions"
Write-host "Get-IP - Get Public and Private IPs"
Write-host "======================================================"
Write-host ""

# Modules
if (Get-Module -ListAvailable -Name Posh-Git) { Import-Module posh-git } else { Install-Module posh-git -Scope CurrentUser -Force }
if (Get-Module -ListAvailable -Name oh-my-posh) { Import-Module oh-my-posh } else { Install-Module oh-my-posh -Scope CurrentUser -Force }
if (Get-Module -ListAvailable -Name Terminal-Icons) { Import-Module Terminal-Icons } else { Install-Module -Name Terminal-Icons -Repository PSGallery -Force }
if (Get-Module -ListAvailable -Name Posh-Git) { Import-Module PSReadLine } else { Install-Module -Name PSReadline -AllowPrerelease -Scope CurrentUser -Force SkipPublisherCheck }

# Prompt
Set-PoshPrompt amro
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionSource History

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias less 'C:\Program Files\Git\user\bin\less.exe'


function elevate(){
    Start-Process -Verb runas cmd.exe '/c start wt.exe'
    exit
}

function Get-IP(){
    $extip = New-Object -TypeName PSObject
    $extip | Add-Member -MemberType NoteProperty -Name Source -Value "External IP"
    $extip | Add-Member -MemberType NoteProperty -Name IPAddress -Value "$(curl checkip.amazonaws.com -s)"
    $intip = New-Object -TypeName PSObject
    $intip | Add-Member -MemberType NoteProperty -Name Source -Value "Interal IP"
    $intip | Add-Member -MemberType NoteProperty -Name IPAddress -Value "$( Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet" | select -ExpandProperty IPAddress)"
    $Result = @($extip, $intip)
    $Result
}
