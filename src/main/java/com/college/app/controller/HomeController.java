package com.college.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "index.html";
    }

    @GetMapping("/courses")
    public String courses() {
        return "courses.html";
    }

    @GetMapping("/admissions")
    public String admissions() {
        return "admissions.html";
    }

    @GetMapping("/campus")
    public String campus() {
        return "campus.html";
    }
}
