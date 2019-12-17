$Creds = Get-Credential -Credential contato@eltonpontes.com.br
Connect-MsolService –Credential $Creds
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powerShell-liveID?serializationLevel=Full -Credential $Creds -Authentication Basic -AllowRedirection
Import-PSSession $Session  