package com.example.snake;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.NamedStoredProcedureQuery;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureParameter;

@Entity
@NamedStoredProcedureQuery(
    name = "Triangle.findTriangleType",
    procedureName = "findTriangleType",
    parameters = {
        @StoredProcedureParameter(mode = ParameterMode.IN, name = "a", type = Integer.class),
        @StoredProcedureParameter(mode = ParameterMode.IN, name = "b", type = Integer.class),
        @StoredProcedureParameter(mode = ParameterMode.IN, name = "c", type = Integer.class),
        @StoredProcedureParameter(mode = ParameterMode.OUT, name = "type", type = String.class)
    }
)
public class Triangle {
    @Id
    private Long id;
    private Integer a;
    private Integer b;
    private Integer c;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getA() {
		return a;
	}
	public void setA(Integer a) {
		this.a = a;
	}
	public Integer getB() {
		return b;
	}
	public void setB(Integer b) {
		this.b = b;
	}
	public Integer getC() {
		return c;
	}
	public void setC(Integer c) {
		this.c = c;
	}
}