package com.springsource.pizzashop.repository;

import com.springsource.pizzashop.domain.Pizza;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface PizzaRepository extends JpaSpecificationExecutor<Pizza>, JpaRepository<Pizza, Long> {
}
