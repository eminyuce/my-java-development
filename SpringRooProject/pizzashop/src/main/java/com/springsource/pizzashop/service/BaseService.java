package com.springsource.pizzashop.service;

import com.springsource.pizzashop.domain.Base;
import java.util.List;

public interface BaseService {

	public abstract long countAllBases();


	public abstract void deleteBase(Base base);


	public abstract Base findBase(Long id);


	public abstract List<Base> findAllBases();


	public abstract List<Base> findBaseEntries(int firstResult, int maxResults);


	public abstract void saveBase(Base base);


	public abstract Base updateBase(Base base);

}
