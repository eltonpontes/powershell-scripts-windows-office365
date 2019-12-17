$ContasDesabilitadas = Search-ADAccount -AccountDisabled | select name, SamAccountName
$ContasHabilitadas = Get-ADUser -properties whencreated -Filter * | where {$_.Enabled -eq �True"} | select name, SamAccountName, whencreated , EmailAddress
$ContasInativas = Search-ADAccount -AccountInactive | select name, SamAccountName
$ContasPasswordNeverExpires = Search-ADAccount -PasswordNeverExpires |
Select-Object Name, ObjectClass,PasswordNeverExpires

$ContasDesabilitadas | Out-File C:\Contas\ContasDesabilitadas.csv
$ContasHabilitadas | Out-File C:\Contas\ContasHabilitadas.csv
$ContasInativas| Out-File C:\Contas\ContasInativas.csv
$ContasPasswordNeverExpires | Out-File C:\Contas\ContasPasswordNeverExpires.csv