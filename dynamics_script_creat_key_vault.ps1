# ----PLACEHOLDER------------------------------------------------------------------ #
$subscriptionId = 'XXXXXXX-XXXX-XXXXXX-XXXXXXXXX'
$keyvaultName = 'Name'
$secretName = 'DataExport'
$resourceGroupName = 'Name'
$location ='Brazil South'
$connectionString = 'Server=tcp:XXXXXXX.database.windows.net,1433;Initial Catalog=XXXXXXXXX;Persist Security Info=False;User ID=administrador;Password=XXXXXXXXX;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'
$organizationIdList = 'XXXXXXXX-XXXX-XXXXX-XXXXX-XXXXXXXXXXX'
$tenantId = 'XXXXXXXXXXXXXXXXXX'
# -------------------------------------------------------------------------------- #

# Login to Azure account, select Subscription and tenant Id
 Get-AzureRmSubscription 
 Select-AzureRmSubscription -SubscriptionId 
Login-AzureRmAccount
Set-AzureRmContext -TenantId $tenantId -SubscriptionId $subscriptionId
 
# Create new resource group if not exists.
$rgAvail = Get-AzureRmResourceGroup -Name $resourceGroupName -Location $location -ErrorAction SilentlyContinue
if(!$rgAvail){
    New-AzureRmResourceGroup -Name $resourceGroupName -Location $location
}
 
# Create new key vault if not exists.
$kvAvail = Get-AzureRmKeyVault -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -ErrorAction SilentlyContinue
if(!$kvAvail){
    New-AzureRmKeyVault -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -Location $location
    # Wait few seconds for DNS entry to propagate
    Start-Sleep -Seconds 15
}
 
# Create tags to store allowed set of Organizations.
$secretTags = @{}
foreach ($orgId in $organizationIdList.Split(',')) {
    $secretTags.Add($orgId.Trim(), $tenantId)
}
 
# Add or update a secret to key vault.
$secretVaule = ConvertTo-SecureString $connectionString -AsPlainText -Force
$secret = Set-AzureKeyVaultSecret -VaultName $keyvaultName -Name $secretName -SecretValue $secretVaule -Tags $secretTags
 
# Authorize application to access key vault.
$servicePrincipal = 'XXXXXXXXXXXXXXXXXX'
Set-AzureRmKeyVaultAccessPolicy -VaultName $keyvaultName -ServicePrincipalName $servicePrincipal -PermissionsToSecrets get
                                                                                       
# Display secret url.
Write-Host "Connection Key Vault URL is " $secret.id.TrimEnd($secret.Version)