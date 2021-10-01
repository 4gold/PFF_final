package com.EEIT131_PFF.springboot.manager.repository;

import com.EEIT131_PFF.springboot.model.Administrator;

public interface AdministratorRepository {

	Administrator selectById(String accountId);

	

}