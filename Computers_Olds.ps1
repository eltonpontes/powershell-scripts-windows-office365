$computadoresantigos = "----------Computadodores Antigos----------" 
$time = (Get-Date).Adddays(-($DaysInactive))
$computadoresantigos = Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -Properties LastLogonTimeStamp
$computadoresantigos | Out-File C:\Contas\computadoresantigos.csv -Append