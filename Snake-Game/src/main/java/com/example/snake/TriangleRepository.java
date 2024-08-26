package com.example.snake;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TriangleRepository extends JpaRepository<Triangle, Long> {

    @Procedure(procedureName = "findTriangleType")
    String findTriangleType(@Param("a") Integer a, @Param("b") Integer b, @Param("c") Integer c);

    @Procedure(procedureName = "GetAllTriangleTypes")
    List<String> getAllTriangleTypes();
}