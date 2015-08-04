/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alcatel.lucent.model;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

import com.alcatel.lucent.model.report.CityReportBean;

/**
 * 
 * @author eminy
 */
@Entity
@Table(name = "city", catalog = "world", schema = "")
@NamedNativeQueries(value = { 
		@NamedNativeQuery(name = "SP_Test_Stored_Proc", query = "call Test_Stored_Proc(:name)", resultClass = City.class) })
@NamedQueries({
		@NamedQuery(name = "City.findAll", query = "SELECT c FROM City c"),
		@NamedQuery(name = "City.findById", query = "SELECT c FROM City c WHERE c.id = :id"),
		@NamedQuery(name = "City.findByName", query = "SELECT c FROM City c WHERE c.name = :name"),
		@NamedQuery(name = "City.findByCountryCode", query = "SELECT c FROM City c WHERE c.countryCode = :countryCode"),
		@NamedQuery(name = "City.findByDistrict", query = "SELECT c FROM City c WHERE c.district = :district"),
		@NamedQuery(name = "City.findByPopulation", query = "SELECT c FROM City c WHERE c.population = :population") })
public class City implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "ID", nullable = false)
	private Integer id;
	@Basic(optional = false)
	@Column(name = "Name", nullable = false, length = 35)
	private String name;
	@Basic(optional = false)
	@Column(name = "CountryCode", nullable = false, length = 3)
	private String countryCode;
	@Basic(optional = false)
	@Column(name = "District", nullable = false, length = 20)
	private String district;
	@Basic(optional = false)
	@Column(name = "Population", nullable = false)
	private int population;

	public City() {
	}

	public City(Integer id) {
		this.id = id;
	}

	public City(Integer id, String name, String countryCode, String district,
			int population) {
		this.id = id;
		this.name = name;
		this.countryCode = countryCode;
		this.district = district;
		this.population = population;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public int getPopulation() {
		return population;
	}

	public void setPopulation(int population) {
		this.population = population;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are
		// not set
		if (!(object instanceof City)) {
			return false;
		}
		City other = (City) object;
		if ((this.id == null && other.id != null)
				|| (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("City [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", countryCode=");
		builder.append(countryCode);
		builder.append(", district=");
		builder.append(district);
		builder.append(", population=");
		builder.append(population);
		builder.append("]");
		return builder.toString();
	}

}
