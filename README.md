# New-Identity
Random Identity generator running as an Azure Function

Public Azure app to generate a random identity for use in whatever you want.  Returns the following:

    * GivenName
    * Surname
    * City
    * StateId
    * StateName
    * TimeZone
    * ZipCodes
    * Dept

### Get a randmon identity
`https://genident.azurewebsites.net/api/newIdentity`

Accepts the following parameters
    * Dept
        - Forces identity to return in a specific department
        - If the value supplied does not exist in the getDepts it will randomly choose one
    * City and State
        - Required to be used together
        - Will return the selected city in that state
        - If no city is returned a random city will be chosen
    * UserCount
        - Defaults to 1
        - Will return an array of users of specified amount
  
Examples:  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/newIdentity'`  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/newIdentity?Dept=Marketing'`  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/newIdentity?City=Raleigh&State=NC'`  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/newIdentity?City=Raleigh&State=NC&Dept=Purchasing'`  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/newIdentity?UserCount=1000'`  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/newIdentity?UserCount=100&City=Raleigh&State=NC'`  

### Get all cities and their respective data:
`https://genident.azurewebsites.net/api/getCities`

Example:  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/getCities'`

### Get all departments for use
`https://genident.azurewebsites.net/api/getDepts`

Example:  
`Invoke-RestMethod -Uri 'https://genident.azurewebsites.net/api/getDepts'`
