// src/test/resources/karate/karate-config.js
function fn() {
  var config = {
    baseUrl: 'https://petstore.swagger.io/v2',
    # Puedes añadir credenciales o tokens aquí si los necesitaras en el futuro
    # apiToken: 'your_api_token_here'
  };

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('ssl', true); # Asegúrate de que las llamadas HTTPS funcionen correctamente

  return config;
}