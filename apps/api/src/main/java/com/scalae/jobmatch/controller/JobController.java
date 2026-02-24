package com.scalae.jobmatch.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class JobController {

    @GetMapping("/jobs")
    public List<Map<String, Object>> jobs() {
        return List.of(
                Map.of("id", 1, "title", "Java Developer"),
                Map.of("id", 2, "title", "Data Engineer")
        );
    }
}