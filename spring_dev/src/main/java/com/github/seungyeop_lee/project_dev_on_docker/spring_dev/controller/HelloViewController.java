package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/hello-view")
public class HelloViewController {
    @GetMapping("/{name}")
    public String hello(@PathVariable(required = false) String name, Model model) {
        model.addAttribute("name", name);
        return "hello";
    }
}
