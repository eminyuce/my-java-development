package com.example.snake;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class TriangleService {
    private static final Logger log =   LoggerFactory.getLogger(TriangleService.class);
    @Autowired
    private TriangleRepository triangleRepository;

    public void checkTriangleType() {
        String triangleType = triangleRepository.findTriangleType(3, 4, 5);
        log.info("Triangle Type: " + triangleType);
    }
}
