package com.example.snake;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TriangleService {

    @Autowired
    private TriangleRepository triangleRepository;

    public void checkTriangleType() {
        String triangleType = triangleRepository.findTriangleType(3, 4, 5);
        System.out.println("Triangle Type: " + triangleType);
    }
}
