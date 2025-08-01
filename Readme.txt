# Automatización de API REST con Karate DSL

El proyecto contiene una prueba funcional automatizada (E2E) para la API PetStore de Swagger, utilizando Karate DSL para la automatización de servicios REST.

# Tecnologías Utilizadas

Java Development Kit (JDK): 17
Apache Maven: 3.9.10
Karate DSL: 1.4.1
JUnit 5: Integración con Karate

# Prerrequisitos

Asegurese de tener instaladas las siguientes herramientas en su sistema:

1.JDK 17: [Oracle](https://www.oracle.com/java/technologies/downloads/)
2.Maven 3.9.10: [Apache Maven](https://maven.apache.org/download.cgi)

Configure sus variables de entorno `M2_HOME` y `PATH`.

# Instrucciones de Ejecución

1.Clonar el Repositorio:
  bash
  git clone https://github.com/97Armando/petstore-karate.git
  cd petstore-karate

2.Ejecutar las Pruebas:
  Abre una terminal en la raíz del proyecto y ejecuta el siguiente comando Maven:
  mvn clean test

  Este comando compilará el proyecto, ejecutará las pruebas definidas en los archivos .feature de Karate y generará los reportes.

3.Visualice los Reportes:
  Una vez que la ejecución finalice, los reportes de Karate se encontrarán en la carpeta 'target/karate-reports'.
  Abra el archivo 'karate-summary.html' en su navegador web preferido para ver el resumen detallado de la ejecución de las pruebas.

