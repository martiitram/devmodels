package io.pakland.devmodels.controller;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;


class HelloWorldTestFeature {
    @Test
    void HelloWorldTest() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("http://localhost:8080/hello"))
                .build();
        try {
            HttpResponse<String> response = client.send(request,
                    HttpResponse.BodyHandlers.ofString());
            assertEquals(response.body(), "patata");
        } catch (IOException | InterruptedException e) {
            fail("error on io");
            throw new RuntimeException(e);
        }
    }
}