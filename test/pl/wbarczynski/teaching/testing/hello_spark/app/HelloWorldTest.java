package pl.wbarczynski.teaching.testing.hello_spark.app;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import spark.Request;

public class HelloWorldTest {

  @Test
  public void testGreetings() {
    String paramValue = "Wojtek";
    String expected = HelloWorld.GREETINGS + " " + paramValue + "!"; 

    String actualValue = HelloWorld.greetings(new RequestMock(paramValue), null);

    assertEquals(expected, actualValue);
  }

  protected class RequestMock extends Request {
    public String returnedValue;

    public RequestMock(String returnedValue) {
      this.returnedValue = returnedValue;
    }

    public String queryParamOrDefault(String paramName, String defValue) {
      return returnedValue;
    }
  }
}
