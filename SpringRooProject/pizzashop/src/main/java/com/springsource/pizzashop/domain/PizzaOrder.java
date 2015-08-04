package com.springsource.pizzashop.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class PizzaOrder {

    @NotNull
    @Size(min = 2)
    private String name;

    @Size(max = 30)
    private String address;

    private BigDecimal total;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date deliveryDate;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Pizza> pizzas = new HashSet<Pizza>();

	public String toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }

	public static PizzaOrder fromJsonToPizzaOrder(String json) {
        return new JSONDeserializer<PizzaOrder>().use(null, PizzaOrder.class).deserialize(json);
    }

	public static String toJsonArray(Collection<PizzaOrder> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }

	public static Collection<PizzaOrder> fromJsonArrayToPizzaOrders(String json) {
        return new JSONDeserializer<List<PizzaOrder>>().use(null, ArrayList.class).use("values", PizzaOrder.class).deserialize(json);
    }

	@EmbeddedId
    private PizzaOrderPk id;

	@Version
    @Column(name = "version")
    private Integer version;

	public PizzaOrderPk getId() {
        return this.id;
    }

	public void setId(PizzaOrderPk id) {
        this.id = id;
    }

	public Integer getVersion() {
        return this.version;
    }

	public void setVersion(Integer version) {
        this.version = version;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public String getAddress() {
        return this.address;
    }

	public void setAddress(String address) {
        this.address = address;
    }

	public BigDecimal getTotal() {
        return this.total;
    }

	public void setTotal(BigDecimal total) {
        this.total = total;
    }

	public Date getDeliveryDate() {
        return this.deliveryDate;
    }

	public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

	public Set<Pizza> getPizzas() {
        return this.pizzas;
    }

	public void setPizzas(Set<Pizza> pizzas) {
        this.pizzas = pizzas;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
