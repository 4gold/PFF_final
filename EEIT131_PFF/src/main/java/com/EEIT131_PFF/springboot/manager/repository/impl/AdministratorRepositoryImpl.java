package com.EEIT131_PFF.springboot.manager.repository.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.EEIT131_PFF.springboot.model.Administrator;
import com.EEIT131_PFF.springboot.manager.repository.AdministratorRepository;

@Repository
public class AdministratorRepositoryImpl implements AdministratorRepository {

	@Autowired
	EntityManager entityManager;

	@Override
	public Administrator selectById(String accountId) {
		String hql = "from Administrator Where accountId =:accountId";
		Administrator administrator = null;
		try {
			administrator = entityManager.createQuery(hql, Administrator.class).setParameter("accountId", accountId)
					.getSingleResult();
		} catch (NoResultException nre) {
			return null;
		} catch (NonUniqueResultException nure) {
			return null;
		}

		return administrator;

	}

	public void merge(Administrator administrator) {
		if (selectById(administrator.getAccountId()) == null) {
			throw new RuntimeException("帳號不存在");
		}
		entityManager.detach(administrator);

		entityManager.merge(administrator);

		System.out.println("administrator merged");
	}

}
