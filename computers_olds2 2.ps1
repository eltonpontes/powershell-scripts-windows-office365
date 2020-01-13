$date = '40'
$computaresold =Get-ADcomputer -Filter * -properties * | FT name, Lastlogondate $date
$computaresold | Out-File C:\Contas\computaresold.csv -Append