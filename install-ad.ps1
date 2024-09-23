param (
    [string]$DomainName,
    [string]$NetBIOSName,
    [string]$SafeModePassword
)

# Installiere die AD DS-Rolle
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Force

# Erstelle den neuen AD-Domain-Controller
Install-ADDSForest `
    -DomainName $DomainName `
    -DomainNetbiosName $NetBIOSName `
    -SafeModeAdministratorPassword (ConvertTo-SecureString $SafeModePassword -AsPlainText -Force) `
    -Force

# Starte den Server neu, um die Installation abzuschließen
Restart-Computer