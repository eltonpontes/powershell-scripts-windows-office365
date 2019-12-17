$ContasHabilitadas = Get-ADUser -filter * -properties * | where {$_.Enabled -eq “True"} | select name, SamAccountName, EmailAddress
$ContasHabilitadas | Out-File C:\Contasemail\ContasHabilitadas.csv

#$ContasHabilitadas = Get-ADUser -Filter * -Properties name, Enabled, EmailAddress, Department, SID
#$ContasHabilitadas = Get-ADUser -filter * -properties * | where {$_.Enabled -eq “True"} | select name, EmailAddress, Department, SID
#$ContasHabilitadas = Get-ADUser -properties whencreated -Filter * | where {$_.Enabled -eq “True"} | select name, SamAccountName, whencreated , EmailAddress