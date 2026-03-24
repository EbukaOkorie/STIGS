<#
.SYNOPSIS
    This PowerShell script configures the minimum password age to at least 1 day,
    satisfying DISA STIG requirement WN11-AC-000030.

.NOTES
    Author          : Chukwuebuka Okorie
    LinkedIn        : https://www.linkedin.com/in/chukwuebuka-okorie-5132b2355/
    GitHub          : https://github.com/EbukaOkorie
    Date Created    : 2026-03-24
    Last Modified   : 2026-03-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000030

.TESTED ON
    Date(s) Tested  : 2026-03-24
    Tested By       : Chukwuebuka Okorie
    Systems Tested  : Windows 11 (Azure VM - 10.1.0.106)
    PowerShell Ver. :

.USAGE
    Run this script in an elevated PowerShell session.
    Example syntax:
        PS C:\> .\WN11-AC-000030.ps1
#>

# Remediation: Set the minimum password age to 1 day
net accounts /minpwage:1

# Verification: Check the output below and confirm "Minimum password age (days)" shows 1 or greater
net accounts
