package pl.wbarczynski.teaching.testing.hello_spark.app;

import static spark.Spark.get;

import spark.Request;
import spark.Response;

public class HelloWorld {
  public static final String GREETINGS = "Greetings";
  
  public static void main(String[] args) {
    get("/hello", (req, res) -> "Hello World");
    get("/greetings", (req, res) -> HelloWorld.greetings(req, res));
  }

  protected static String greetings(Request request, Response response) {
    final String n = request.queryParamOrDefault("name", "");
    return GREETINGS + " " + n + "!";
  }
}
