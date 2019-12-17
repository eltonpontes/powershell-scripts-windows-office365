$list_txt="C:\lista.txt";
$while=Get-Content $list_txt

foreach( $list_txt in $while ){
  Disable-ADAccount -Identity $list_txt

}