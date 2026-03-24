<#
.SYNOPSIS
    This PowerShell script renames the built-in guest account from "Guest" to "Visitor",
    satisfying DISA STIG requirement WN11-SO-000025.

.NOTES
    Author          : Chukwuebuka Okorie
    LinkedIn        : https://www.linkedin.com/in/chukwuebuka-okorie-5132b2355/
    GitHub          : https://github.com/EbukaOkorie
    Date Created    : 2026-03-24
    Last Modified   : 2026-03-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000025

.TESTED ON
    Date(s) Tested  : 2026-03-24
    Tested By       : Chukwuebuka Okorie
    Systems Tested  : Windows 11 (Azure VM - 10.1.0.106)
    PowerShell Ver. :

.USAGE
    Run this script in an elevated PowerShell session.
    Example syntax:
        PS C:\> .\WN11-SO-000025.ps1
#>

# Remediation: Rename the built-in guest account from "Guest" to "Visitor"
Rename-LocalUser -Name "Guest" -NewName "Visitor"

# Verification: Check the output below and confirm the built-in guest account is now named "Visitor"
Get-LocalUser | Where-Object {$_.Description -like "*Built-in account for guest*"}
