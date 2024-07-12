param(
    [string]$vmName,
    [string]$resourceGroupName
)

# Authenticate and connect to Azure
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Connect-AzAccount -ServicePrincipal -Tenant $Conn.TenantID `
    -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

# Start the VM
Start-AzVM -Name $vmName -ResourceGroupName $resourceGroupName
