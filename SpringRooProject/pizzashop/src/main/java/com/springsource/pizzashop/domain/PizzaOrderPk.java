package com.springsource.pizzashop.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Embeddable;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.beans.factory.annotation.Configurable;

@Embeddable
@Configurable
public final class PizzaOrderPk implements Serializable {

    private String shopCountry;

    private String shopCity;

    private String shopName;

	public PizzaOrderPk(String shopCountry, String shopCity, String shopName) {
        super();
        this.shopCountry = shopCountry;
        this.shopCity = shopCity;
        this.shopName = shopName;
    }

	private PizzaOrderPk() {
        super();
    }

	public String getShopCountry() {
        return shopCountry;
    }

	public String getShopCity() {
        return shopCity;
    }

	public String getShopName() {
        return shopName;
    }

	public String toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }

	public static PizzaOrderPk fromJsonToPizzaOrderPk(String json) {
        return new JSONDeserializer<PizzaOrderPk>().use(null, PizzaOrderPk.class).deserialize(json);
    }

	public static String toJsonArray(Collection<PizzaOrderPk> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }

	public static Collection<PizzaOrderPk> fromJsonArrayToPizzaOrderPks(String json) {
        return new JSONDeserializer<List<PizzaOrderPk>>().use(null, ArrayList.class).use("values", PizzaOrderPk.class).deserialize(json);
    }

	private static final long serialVersionUID = 1L;

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public boolean equals(Object obj) {
        if (!(obj instanceof PizzaOrderPk)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        PizzaOrderPk rhs = (PizzaOrderPk) obj;
        return new EqualsBuilder().append(shopCity, rhs.shopCity).append(shopCountry, rhs.shopCountry).append(shopName, rhs.shopName).isEquals();
    }

	public int hashCode() {
        return new HashCodeBuilder().append(shopCity).append(shopCountry).append(shopName).toHashCode();
    }
}
