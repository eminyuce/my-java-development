package com.alcatel.lucent.model.report;


import javax.persistence.Entity;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Subselect;



public class CityReportBean {

	// select ci.CountryCode,
	// ci.Name,co.Continent,ci.Population,co.LifeExpectancy,co.GNP from city as
	// ci inner join country co on ci.CountryCode = co.Code where ci.Name

	private String name;
	private String countryCode;
	private String continent;
	private int population;
	private Float lifeExpectancy;
	private Float gnp;

	public CityReportBean() {
	}

	public CityReportBean(String name, String countryCode) {
		super();
		this.name = name;
		this.countryCode = countryCode;
	}

	public CityReportBean(String name, String countryCode, String continent,
			int population, Float lifeExpectancy, Float gnp) {
		super();
		this.name = name;
		this.countryCode = countryCode;
		this.continent = continent;
		this.population = population;
		this.lifeExpectancy = lifeExpectancy;
		this.gnp = gnp;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public int getPopulation() {
		return population;
	}

	public void setPopulation(int population) {
		this.population = population;
	}

	public Float getLifeExpectancy() {
		return lifeExpectancy;
	}

	public void setLifeExpectancy(Float lifeExpectancy) {
		this.lifeExpectancy = lifeExpectancy;
	}

	public Float getGnp() {
		return gnp;
	}

	public void setGnp(Float gnp) {
		this.gnp = gnp;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CityReportBean [name=");
		builder.append(name);
		builder.append(", countryCode=");
		builder.append(countryCode);
		builder.append(", continent=");
		builder.append(continent);
		builder.append(", population=");
		builder.append(population);
		builder.append(", lifeExpectancy=");
		builder.append(lifeExpectancy);
		builder.append(", gnp=");
		builder.append(gnp);
		builder.append("]");
		return builder.toString();
	}

}
