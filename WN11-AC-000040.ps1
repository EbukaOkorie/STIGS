<#
.SYNOPSIS
    This PowerShell script enables the built-in Microsoft password complexity filter,
    satisfying DISA STIG requirement WN11-AC-000040.

.NOTES
    Author          : Chukwuebuka Okorie
    LinkedIn        : https://www.linkedin.com/in/chukwuebuka-okorie-5132b2355/
    GitHub          : https://github.com/EbukaOkorie
    Date Created    : 2026-03-24
    Last Modified   : 2026-03-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000040

.TESTED ON
    Date(s) Tested  : 2026-03-24
    Tested By       : Chukwuebuka Okorie
    Systems Tested  : Windows 11 (Azure VM - 10.1.0.106)
    PowerShell Ver. :

.USAGE
    Run this script in an elevated PowerShell session.
    Requires C:\temp directory to exist (script will create it if missing).
    Example syntax:
        PS C:\> .\WN11-AC-000040.ps1
#>

# Remediation: Enable password complexity via secedit
New-Item -Path "C:\temp" -ItemType Directory -Force
secedit /export /cfg C:\temp\secpol.cfg
(Get-Content C:\temp\secpol.cfg).Replace("PasswordComplexity = 0", "PasswordComplexity = 1") | Set-Content C:\temp\secpol.cfg
secedit /configure /db C:\windows\security\local.db /cfg C:\temp\secpol.cfg /areas SECURITYPOLICY

# Verification: Check the output below and confirm "Password Complexity" shows 1 (enabled)
secedit /export /cfg C:\temp\secpol_check.cfg
Get-Content C:\temp\secpol_check.cfg | Select-String "PasswordComplexity"
