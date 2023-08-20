Feature: Security Token Tests

Scenario: Genearate valid token with valid username and password
#prepare request
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

Scenario: validate token with invalid username
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "wrongUsername", "password": "tek_supervisor"}
When method post
Then status 400
And print response
And assert response.errorMessage == "User not found"

Scenario: validate token with invalide password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor", "password": "wrongPassword"}
When method post
Then status 400
And print response
And assert response.errorMessage == "Password Not Matched"
