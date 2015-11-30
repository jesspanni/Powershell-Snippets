# To access key vault cmdlets you need to be running in ARM (Azure Resource Manager) mode
Switch-AzureMode –Name AzureResourceManager

# Add a key vault to an existing resource group
New-AzureKeyVault -VaultName <unique-key-vault-name> -ResourceGroupName <resource-group> -Location 'West Europe' -Sku <premium|standard>

# Add a key to the vault
Add-AzureKeyVaultKey -VaultName <key-vault-name> -Name <key-name> -Destination "Software"

# get all keys in a vault
get-azurekeyvaultkey  -VaultName <key-vault-name>

# Grant permission to an AD user to encrypt using key
Set-AzureKeyVaultAccessPolicy -UserPrincipalName <user-in-AAD> -VaultName <key-vault-name> -PermissionsToKeys encrypt
