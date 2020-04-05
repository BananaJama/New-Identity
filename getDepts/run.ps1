using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata, $Depts)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

$Departments = $Depts -split ','

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    Body = $Departments
})
