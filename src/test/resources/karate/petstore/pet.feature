  Feature: Administra mascotas en PetStore con datos json

    Background:
      * url baseUrl
      * configure headers = { 'Content-Type': 'application/json' }

    Scenario Outline: Añadir una nueva mascota, consultar, actualizar y consultar por estado

      Given path '/pet'
      And request
        """
        {
      "id": <id>,
      "category": {
      "id": <category_id>,
      "name": "<category_name>"
      },
      "name": "<name>",
      "photoUrls": [
      "string"
      ],
      "tags": [
      {
      "id": 0,
      "name": "string"
      }
      ],
      "status": "<status>"
      }
      """
      When method POST
      Then status 200
      And print response
      And match response.id == <id>
      And match response.name == '<name>'
      And match response.status == '<status>'

      Given path '/pet/' + <id>
      When method GET
      Then status 200
      And print response
      And match response.id == <id>
      And match response.name == '<name>'
      And match response.status == '<status>'


      Given path '/pet'
      And request
        """
        {
      "id": <id>,
      "category": {
      "id": <category_id>,
      "name": "<category_name>"
      },
      "name": "<new_name>",
      "photoUrls": [
      "string"
      ],
      "tags": [
      {
      "id": 0,
      "name": "string"
      }
      ],
      "status": "<new_status>"
      }
      """
      When method PUT
      Then status 200
      And print response
      And match response.id == <id>
      And match response.name == '<new_name>'
      And match response.status == '<new_status>'


      Given path '/pet/findByStatus'
      And param status = '<new_status>'
      When method GET
      Then status 200
      And print response
      * def foundPet = karate.filter(response, function(pet) { return pet.id == <id>; })
      * match foundPet[0].id == <id>
      * match foundPet[0].name == '<new_name>'
      * match foundPet[0].status == '<new_status>'

      Examples:
        | read('pet_data.json') |

