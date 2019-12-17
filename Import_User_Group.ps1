Import-module ActiveDirectory

$list_txt="C:\User\User.txt";
$while=Get-Content $list_txt

foreach( $list_txt in $while ){
  Add-ADGroupMember -Identity NOME_DO_GRUPO -Member $list_txt

}