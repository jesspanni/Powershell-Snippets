# Swith to AzureResourceManager mode
# NOTE: This will be deprecated https://github.com/Azure/azure-powershell/wiki/Deprecation-of-Switch-AzureMode-in-Azure-PowerShell
Switch-AzureMode AzureResourceManager
Add-AzureAccount


# Create new empty resource group, NOTE: Prefered method is to use JSON resource group templates
New-AzureResourceGroup -Name <resource-group-name> -Location "West Europe"


# List all the resource group templates
Get-AzureResourceGroupGalleryTemplate -Publisher Microsoft



