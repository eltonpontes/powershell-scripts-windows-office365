Import-Module ActiveDirectory -ErrorAction SilentlyContinue
[array]$horaLogon = (Get-ADUser usuarioteste -Properties logonHours).logonHours
foreach ($user in Get-Content C:\ADRestricao\User1.txt) { 
Get-ADUser -Identity $user | Set-ADUser -Replace @{logonhours=$horaLogon} 
}