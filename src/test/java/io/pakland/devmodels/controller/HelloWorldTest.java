package io.pakland.devmodels.controller;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class HelloWorldTest {
    @Test
    void HelloWorldUnitTest() {
        HelloWorld helloWorld = new HelloWorld();
        assertEquals("hola", helloWorld.printHelloWorld());

    }
}