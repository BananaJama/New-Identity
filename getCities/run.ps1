using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata, $CityData)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."



# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    Body = $CityData
})
