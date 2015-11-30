# Create a storage account, NOTE: account nuame must be unique and lowercase
New-AzureStorageAccount -StorageAccountName <storage-account-name> -Location 'West Europe'


# NOTE: You will either need to define an Azure Storage Context to run these cmdlets or associate a default storage account
# with your subscription.

# To setup a default storage account (you can ommit the -Context switch in all examples below)
Set-AzureSubscription -SubscriptionId <storageid> -CurrentStorageAccountName <storage-account-name>

# Alternatively you can create a storage context that is then passed into the various cmdlets
$ctx = New-AzureStorageContext -StorageAccountName <storage-account-name> -StorageAccountKey <storage-account-key>

# Create container
New-AzureStorageContainer -Name <container-name> -Context $ctx 

# Upload content to storage
$FileToUpload = 'c:\temp\file.txt'
Set-AzureStorageBlobContent -Container <container-name> -Context $ctx -File $FileToUpload

# List contents
Get-AzureStorageBlob -Container <container-name> -Context $ctx


