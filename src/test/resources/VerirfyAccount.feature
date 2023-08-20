Feature: Verify Account

Background: setup test
	Given url "https://tek-insurance-api.azurewebsites.net"
	

Scenario: Verify and account that is exest
	And path "/api/token"
	And request {"username" : "supervisor", "password" : "tek_supervisor"}
	When method post
	Then status 200
	And print response
	Given path "/api/accounts/get-account"
	And param primaryPersonId = "8562"
	And header Authorization = "Bearer " + response.token
	When method get
	Then status 200
	And print response
	And assert response.primaryPersonId == 8562