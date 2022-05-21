package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.controller;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.SessionScope;

import java.io.Serializable;

@RestController
@RequestMapping("/hello")
@RequiredArgsConstructor
public class HelloController {
    private final NameStore nameStore;

    @GetMapping("")
    public String hello(@RequestParam(required = false) String name) {
        if (name != null) {
            nameStore.setName(name);
        }
        return "hello " + nameStore.getName() + "!";
    }

    @Component
    @SessionScope
    @Data
    public static class NameStore implements Serializable {
        private String name;
    }
}
