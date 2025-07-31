function fn() {
  var config = {
    baseUrl: 'https://petstore.swagger.io/v2',
  };

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('ssl', true);

  return config;
}