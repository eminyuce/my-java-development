package com.emin.yuce.model.report;

import java.math.BigInteger;

public class CityReportBean {

	// select ci.CountryCode, ci.Name,co.Continent,ci.Population,co.LifeExpectancy,co.GNP from city as ci inner join country co on ci.CountryCode = co.Code where ci.Name

	private String name;
	private String countryCode;
	private String continent;
	private BigInteger population;
	private Double lifeExpectancy;
	private Double gnp;
	
	public CityReportBean() {
	}
	
	public CityReportBean(String name, String countryCode, String continent,
			BigInteger population, Double lifeExpectancy, Double gnp) {
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

	public BigInteger getPopulation() {
		return population;
	}

	public void setPopulation(BigInteger population) {
		this.population = population;
	}

	public Double getLifeExpectancy() {
		return lifeExpectancy;
	}

	public void setLifeExpectancy(Double lifeExpectancy) {
		this.lifeExpectancy = lifeExpectancy;
	}

	public Double getGnp() {
		return gnp;
	}

	public void setGnp(Double gnp) {
		this.gnp = gnp;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Name="+this.name;
	}
	
	
}
