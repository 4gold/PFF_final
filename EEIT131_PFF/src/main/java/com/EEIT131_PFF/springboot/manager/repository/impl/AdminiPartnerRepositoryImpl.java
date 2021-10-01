package com.EEIT131_PFF.springboot.manager.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.OptimisticLockException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.manager.repository.AdminiPartnerRepository;

@Repository
public class AdminiPartnerRepositoryImpl implements AdminiPartnerRepository {

	@Autowired
	EntityManager entityManager;

	@Override
	public List<Partner> findAllPartner() {
		String hql = "FROM   Partner";
		return entityManager.createQuery(hql, Partner.class).getResultList();
	}

	@Override
	public Partner findByPartnerId(Integer partnerId) {
		String hql = "FROM Partner p WHERE p.partnerId = :partnerId";
		Partner part = null;
		try {
			part = (Partner)entityManager.createQuery(hql, Partner.class)
					            .setParameter("partnerId", partnerId)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return part;
	}

	@Override
	public void save(Partner partnerId) {
		entityManager.persist(partnerId);
	}

	@Override
	public Partner findById(Integer partnerId) {
		return entityManager.find(Partner.class, partnerId);
	}

	@Override
	public void update(Partner partner) {
		Partner partner0 = findByPartnerId(partner.getPartnerId());
		entityManager.detach(partner0);
		entityManager.merge(partner);
	}

	//刪除方式
	@Override
	public void DeletePartner(Integer partnerId) {
		String hql = "DELETE FROM Partner p WHERE p.partnerId = :partnerId";
		try {		
			int isSuccess = entityManager.createQuery(hql)
					                     .setParameter("partnerId", partnerId)
					                     .executeUpdate();
			if(isSuccess==0) {
		        throw new OptimisticLockException("刪除失敗");
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("刪除失敗");
		}
		System.out.println("savedPartner delete");
	};




}
