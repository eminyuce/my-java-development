package com.springsource.pizzashop.repository;

import com.springsource.pizzashop.domain.Topping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ToppingRepository extends JpaSpecificationExecutor<Topping>, JpaRepository<Topping, Long> {
}
