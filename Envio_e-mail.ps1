$SMTPServer = "smtp.office365.com" 
$SMTPPort = "587" 
$Username = "email@dominio.com.br" 
$Password = 'Password'
$to = "contato@eltonpontes.com.br" 
#$cc = "emailcopia@dominio.com.br" 
#$bcc = "emailoculto@dominio.com.br" 
$subject = "Assunto do E-mail" 
$body = "Este e-mail foi enviado usando PowerShell.
Att, 
Sua Assinatura"
$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true 
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password); 
$smtp.send($message); 
write-host "E-mail Enviado!"