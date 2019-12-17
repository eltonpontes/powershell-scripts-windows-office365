Import-Module ActiveDirectory -ErrorAction SilentlyContinue
foreach ($computer in Get-Content C:\User\computadores.txt) { 
$getcomputer = $(Get-ADComputer $computer).distinguishedName
Move-ADObject -Identity $getcomputer -TargetPath "OU=INATIVOS,DC=eltonpontes,DC=local" 
}