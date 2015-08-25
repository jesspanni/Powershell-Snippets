# Storage account name, NOTE: MUST BE UNIQUE AND LOWERCASE
$StorageAccountName = 'uniquelowercase0999'

$Location = 'West Europe'

# Container name, NOTE: MUST BE LOWERCASE
$ContainerName = 'mycontainer'

# Create a storage account
New-AzureStorageAccount -StorageAccountName $StorageAccountName -Location $Location

# Create container
$StorageAccountKey = (Get-AzureStorageKey -StorageAccountName $StorageAccountName).Primary
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
New-AzureStorageContainer -Name $ContainerName -Context $ctx

# Upload content to storage
$FileToUpload = 'c:\temp\file.txt'
Set-AzureStorageBlobContent -Container $ContainerName -Context $ctx -File $FileToUpload

# List contents
Get-AzureStorageBlob -Container $ContainerName -Context $ctx


