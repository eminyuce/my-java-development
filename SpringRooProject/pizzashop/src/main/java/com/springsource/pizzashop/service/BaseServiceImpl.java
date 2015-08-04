package com.springsource.pizzashop.service;

import com.springsource.pizzashop.domain.Base;
import com.springsource.pizzashop.repository.BaseRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class BaseServiceImpl implements BaseService {

	@Autowired
    BaseRepository baseRepository;

	public long countAllBases() {
        return baseRepository.count();
    }

	public void deleteBase(Base base) {
        baseRepository.delete(base);
    }

	public Base findBase(Long id) {
        return baseRepository.findOne(id);
    }

	public List<Base> findAllBases() {
        return baseRepository.findAll();
    }

	public List<Base> findBaseEntries(int firstResult, int maxResults) {
        return baseRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveBase(Base base) {
        baseRepository.save(base);
    }

	public Base updateBase(Base base) {
        return baseRepository.save(base);
    }
}
