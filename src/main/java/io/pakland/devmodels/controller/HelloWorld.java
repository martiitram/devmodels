package io.pakland.devmodels.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorld {

    @GetMapping("hello")
    String printHelloWorld() {
        int a;
        return "hola";
    }
}
