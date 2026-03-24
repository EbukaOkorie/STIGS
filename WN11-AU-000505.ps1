<#
.SYNOPSIS
    This PowerShell script configures the Security event log maximum size to 1024000 KB (1 GB),
    satisfying DISA STIG requirement WN11-AU-000505.

.NOTES
    Author          : Chukwuebuka Okorie
    LinkedIn        : https://www.linkedin.com/in/chukwuebuka-okorie-5132b2355/
    GitHub          : https://github.com/EbukaOkorie
    Date Created    : 2026-03-24
    Last Modified   : 2026-03-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000505

.TESTED ON
    Date(s) Tested  : 2026-03-24
    Tested By       : Chukwuebuka Okorie
    Systems Tested  : Windows 11 (Azure VM - 10.1.0.106)
    PowerShell Ver. :

.USAGE
    Run this script in an elevated PowerShell session.
    Example syntax:
        PS C:\> .\WN11-AU-000505.ps1
#>

# Remediation: Create the registry path if it does not exist, then set Security event log size to 1024000 KB
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" -Name "MaxSize" -Value 1024000 -Type DWord

# Verification: Check the output below and confirm "MaxSize" shows 1024000
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" -Name "MaxSize"
