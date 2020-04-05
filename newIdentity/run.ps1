using namespace System.Net

# Input bindings are passed in via param block.
# City data provided by
# https://simplemaps.com/data/us-cities.
param($Request, $TriggerMetadata, $GivenNames, $Surnames, $CityData, $Depts)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$City = $Request.Query.City
$Dept = $Request.Query.Dept
$State = $Request.Query.State
$GivenNames = $GivenNames -split ','
$Surnames = $Surnames -split ','
$Departments = $Depts -split ','

$GivenName = Get-Random $GivenNames
$GivenName = $GivenName.Substring(0,1).ToUpper() + $GivenName.Substring(1)

$Surname = Get-Random $Surnames
$Surname = $Surname.Substring(0,1).ToUpper() + $Surname.Substring(1)

if ($Departments -notcontains $Dept) {
    Write-Error "Not a valid department"
    $Dept = Get-Random $Departments
}

if ($City -and $State) {
    try {
        $City = $CityData | Where-Object {$_.city -eq $City -and $_.state_id -eq $State}
    }
    catch {
        Write-Error "Failed to retrieve city data"
        $City = Get-Random $CityData
    }
}
else {
    $City = Get-Random $CityData
}

$Identity = [psobject]@{
    GivenName = $GivenName
    Surname = $Surname
    City = $City.city
    StateId = $City.state_id
    StateName = $City.state_name
    TimeZone = $City.timezone
    ZipCodes = $City.zips
    Dept = $Dept
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    Body = $Identity
})

