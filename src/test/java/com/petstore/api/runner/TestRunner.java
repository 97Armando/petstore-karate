package com.petstore.api.runner;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.BeforeAll;

class TestRunner {

    // Puedes usar @Karate.Test si quieres ejecutar solo un feature o especificar tags
    // @Karate.Test
    // Karate testAll() {
    //     return Karate.run("classpath:karate/petstore").relativeTo(getClass());
    // }
    // Este enfoque es más común para ejecutar todos los features en una ruta
    @Karate.Test
    Karate testPetStore() {
        return Karate.run("petstore").relativeTo(getClass());
    }

    // Opcional: Configuración global antes de todas las pruebas (si necesitas algo Java-específico)
    @BeforeAll
    static void beforeAll() {
        // Puedes poner aquí cualquier configuración global que se ejecute una sola vez
        // Por ejemplo, iniciar un servidor de mock, o configurar variables de entorno si no lo haces en karate-config.js
    }
}