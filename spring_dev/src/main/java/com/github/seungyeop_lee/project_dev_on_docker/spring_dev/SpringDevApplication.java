package com.github.seungyeop_lee.project_dev_on_docker.spring_dev;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class SpringDevApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringDevApplication.class, args);
    }

}
