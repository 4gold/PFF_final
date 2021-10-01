package com.EEIT131_PFF.springboot.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.model.Administrator;
import com.EEIT131_PFF.springboot.manager.repository.AdministratorRepository;
import com.EEIT131_PFF.springboot.manager.service.AdministratorService;

@Service
@Transactional
public class AdministratorServiceImpl implements AdministratorService {

	@Autowired
	AdministratorRepository AdministratorRepository;


	@Override
	public Administrator selectById(String accountId) {
		return AdministratorRepository.selectById(accountId);
	}

	

}
