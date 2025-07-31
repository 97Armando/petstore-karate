  # src/test/resources/karate/petstore/pet.feature

  Feature: Manage pets in PetStore

    Background:
      * url baseUrl # Usa la baseUrl definida en karate-config.js
      * configure headers = { 'Content-Type': 'application/json' } # Definir headers comunes

    Scenario: Add a new pet, consult, update and consult by status
      # 1. Añadir una mascota a la tienda
      Given path '/pet'
      And request
        """
        {
      "id": 99999, # Usar un ID grande para evitar conflictos si se usa una base de datos real
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
      And print response # Capturar la salida completa de la adición
      And match response.id == 99999 # Verificar que el ID de la mascota sea el esperado
      And match response.name == 'doggie'
      * def petId = response.id # Capturar el ID de la mascota para usarlo en escenarios posteriores
      * def petName = response.name # Capturar el nombre para futuras aserciones

      # 2. Consultar la mascota ingresada previamente (Búsqueda por ID)
      Given path '/pet/' + petId # Usar el ID capturado
      When method GET
      Then status 200
      And print response # Capturar la salida
      And match response.id == petId
      And match response.name == 'doggie'
      And match response.status == 'available'

      # 3. Actualizar el nombre de la mascota y el estatus a "sold"
      Given path '/pet'
      And request
        """
        {
      "id": #(petId), # Usar el ID capturado, notación #(variable) para inyección de valores
      "category": {
      "id": 1,
      "name": "Dogs"
      },
      "name": "new_doggie_name", # Nuevo nombre
      "photoUrls": [
      "string"
      ],
      "tags": [
      {
      "id": 0,
      "name": "string"
      }
      ],
      "status": "sold" # Nuevo estatus
      }
      """
      When method PUT
      Then status 200
      And print response # Capturar la salida de la actualización
      And match response.id == petId
      And match response.name == 'new_doggie_name'
      And match response.status == 'sold'

      # 4. Consultar la mascota modificada por estatus (Búsqueda por estatus)
      Given path '/pet/findByStatus'
      And param status = 'sold' # Consultar por el estatus 'sold'
      When method GET
      Then status 200
      And print response # Capturar la salida (lista de mascotas con estatus 'sold')
      And match response contains { id: #(petId), name: 'new_doggie_name', status: 'sold' }
    # Asegúrate de que la mascota que acabamos de modificar esté en la lista