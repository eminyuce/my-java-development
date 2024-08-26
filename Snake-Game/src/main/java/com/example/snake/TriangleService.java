package com.example.snake;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;


@Service
public class TriangleService {
    private static final Logger log =   LoggerFactory.getLogger(TriangleService.class);
    @Autowired
    private TriangleRepository triangleRepository;

    @Transactional(readOnly = true)
    public void checkTriangleType() {
        String triangleType = triangleRepository.findTriangleType(3, 4, 5);
        log.info("Triangle Type: " + triangleType);
    }

    @Transactional(readOnly = true) // Ensure this method runs within a transaction
    public void getAllTriangleTypes() {
        var triangleTypes = triangleRepository.getAllTriangleTypes();
        log.info("ALL Triangle Types: " + triangleTypes);
    }
}
