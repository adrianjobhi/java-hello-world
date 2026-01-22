package com.example;

import static spark.Spark.*;

public class App {
  public static void main(String[] args) {
    // Cloud Run expone el puerto en la variable PORT
    int portNumber = Integer.parseInt(System.getenv().getOrDefault("PORT", "8080"));
    port(portNumber);

    get("/", (req, res) -> "Hola Mundo desde Cloud Run 🚀");
    get("/health", (req, res) -> "ok");
  }
}
