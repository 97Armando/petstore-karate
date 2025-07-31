package com.petstore.api.runner;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.BeforeAll;

class TestRunner {

    @Karate.Test
    Karate testPetStore() {
        return Karate.run("classpath:karate/petstore").relativeTo(getClass());
    }

    @BeforeAll
    static void beforeAll() {

    }
}