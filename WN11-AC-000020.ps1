<#
.SYNOPSIS
    This PowerShell script configures the password history to 24 passwords remembered,
    satisfying DISA STIG requirement WN11-AC-000020.

.NOTES
    Author          : Chukwuebuka Okorie
    LinkedIn        : https://www.linkedin.com/in/chukwuebuka-okorie-5132b2355/
    GitHub          : https://github.com/EbukaOkorie
    Date Created    : 2026-03-24
    Last Modified   : 2026-03-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000020

.TESTED ON
    Date(s) Tested  : 2026-03-24
    Tested By       : Chukwuebuka Okorie
    Systems Tested  : Windows 11 (Azure VM - 10.1.0.106)
    PowerShell Ver. :

.USAGE
    Run this script in an elevated PowerShell session.
    Example syntax:
        PS C:\> .\WN11-AC-000020.ps1
#>

# Remediation: Set password history to remember 24 passwords
net accounts /uniquepw:24

# Verification: Check the output below and confirm "Length of password history maintained" shows 24
net accounts
