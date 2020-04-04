using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata, $GivenNames, $Surnames)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$GivenNames = $GivenNames -split ','
$Surnames = $Surnames -split ','

$FullName = [psobject]@{
    GivenName = Get-Random $GivenNames
    Surname = Get-Random $Surnames
}

$body = $FullName

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    Body = $body
})
