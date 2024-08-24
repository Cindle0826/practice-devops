package com.practice.devops.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j(topic = "c.TestController")
public class TestController {

    @GetMapping("/hello")
    public String sayHello() {
        log.info("hello ...");
        return "Hello";
    }
}
