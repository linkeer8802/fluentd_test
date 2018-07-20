////////////////////////////////////////////////////////////////////
// FluentTest.java
// Copyright (C) 2015-2018  lecaishui.com All Rights Reserved.
////////////////////////////////////////////////////////////////////

package org.fluent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.Vertx;

/**
 * @author weird
 */
public class FluentTest {

  static final Logger logger = LoggerFactory.getLogger(FluentTest.class);
  
  /**
   * @param args
   */
  public static void main(String[] args) {
    
    String format = "Hello %s";
    String message = String.format(format, "fluentd");
    
    Vertx vertx = Vertx.vertx();
    vertx.createHttpServer().requestHandler(request -> {
      request.response().end(message);
    }).listen(8080);
    
    System.out.println(message);
    
    logger.info("follow is exception test.");
    
    try {
      exceptionMethod();
    } catch (Exception e) {
      e.printStackTrace();
      logger.error("Invoke method error, case by: ", e);
    }
    
    throw new RuntimeException("error test!");
  }
  
  public static int exceptionMethod() {
    logger.warn("it will has some exception~");
    return 0 / 0;
  }
  
  
}
