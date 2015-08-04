package com.springsource.pizzashop.repository;

import com.springsource.pizzashop.domain.PizzaOrder;
import com.springsource.pizzashop.domain.PizzaOrderPk;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface PizzaOrderRepository extends JpaSpecificationExecutor<PizzaOrder>, JpaRepository<PizzaOrder, PizzaOrderPk> {
}
