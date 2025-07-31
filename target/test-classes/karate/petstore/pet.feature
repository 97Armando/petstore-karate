  Feature: Manage pets in PetStore

    Background:
      * url baseUrl
      * configure headers = { 'Content-Type': 'application/json' }

    Scenario: Add a new pet, consult, update and consult by status

      Given path '/pet'
      And request
        """
        {
      "id": 99999,
      "category": {
      "id": 1,
      "name": "Dogs"
      },
      "name": "doggie",
      "photoUrls": [
      "string"
      ],
      "tags": [
      {
      "id": 0,
      "name": "string"
      }
      ],
      "status": "available"
      }
      """
      When method POST
      Then status 200
      And print response
      And match response.id == 99999
      And match response.name == 'doggie'
      * def petId = response.id
      * def petName = response.name


      Given path '/pet/' + petId
      When method GET
      Then status 200
      And print response
      And match response.id == petId
      And match response.name == 'doggie'
      And match response.status == 'available'


      Given path '/pet'
      And request
        """
        {
      "id":
      "category": {
      "id": 1,
      "name": "Dogs"
      },
      "name": "new_doggie_name",
      "photoUrls": [
      "string"
      ],
      "tags": [
      {
      "id": 0,
      "name": "string"
      }
      ],
      "status": "sold"
      }
      """
      When method PUT
      Then status 200
      And print response
      And match response.id == petId
      And match response.name == 'new_doggie_name'
      And match response.status == 'sold'


      Given path '/pet/findByStatus'
      And param status = 'sold'
      When method GET
      Then status 200
      And print response
      And match response contains { id:, name: 'new_doggie_name', status: 'sold' }
