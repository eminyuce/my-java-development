package com.springsource.pizzashop.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@Entity
public class Base {

    @NotNull
    @Size(min = 2)
    private String name;

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
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

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public String toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }

	public static Base fromJsonToBase(String json) {
        return new JSONDeserializer<Base>().use(null, Base.class).deserialize(json);
    }

	public static String toJsonArray(Collection<Base> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }

	public static Collection<Base> fromJsonArrayToBases(String json) {
        return new JSONDeserializer<List<Base>>().use(null, ArrayList.class).use("values", Base.class).deserialize(json);
    }
}
