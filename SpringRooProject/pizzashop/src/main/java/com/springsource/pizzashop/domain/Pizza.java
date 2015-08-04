package com.springsource.pizzashop.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@Entity
public class Pizza {

    @NotNull
    @Size(min = 2)
    private String name;

    private BigDecimal price;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Topping> toppings = new HashSet<Topping>();

    @ManyToOne
    private Base base;

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public BigDecimal getPrice() {
        return this.price;
    }

	public void setPrice(BigDecimal price) {
        this.price = price;
    }

	public Set<Topping> getToppings() {
        return this.toppings;
    }

	public void setToppings(Set<Topping> toppings) {
        this.toppings = toppings;
    }

	public Base getBase() {
        return this.base;
    }

	public void setBase(Base base) {
        this.base = base;
    }

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;

	public Long getId() {
        return this.id;
    }

	public void setId(Long id) {
        this.id = id;
    }

	public Integer getVersion() {
        return this.version;
    }

	public void setVersion(Integer version) {
        this.version = version;
    }

	public String toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }

	public static Pizza fromJsonToPizza(String json) {
        return new JSONDeserializer<Pizza>().use(null, Pizza.class).deserialize(json);
    }

	public static String toJsonArray(Collection<Pizza> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }

	public static Collection<Pizza> fromJsonArrayToPizzas(String json) {
        return new JSONDeserializer<List<Pizza>>().use(null, ArrayList.class).use("values", Pizza.class).deserialize(json);
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
