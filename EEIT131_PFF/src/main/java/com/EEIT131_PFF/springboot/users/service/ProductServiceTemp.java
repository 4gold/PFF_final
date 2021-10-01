package com.EEIT131_PFF.springboot.users.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EEIT131_PFF.springboot.model.Bookmark;
import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.model.Product;



@Transactional
@Service
public class ProductServiceTemp {
	
	@Autowired
	EntityManager entityManager;
	
	
	public void save(Product product) {
		entityManager.persist(product);
	}
	
	public List<Product> findAll() {
		String hql="FROM Product";
		return entityManager.createQuery(hql, Product.class)
	            .getResultList();
	}
	public Partner find(Integer partnerId) {
		return entityManager.find(Partner.class, partnerId);
	}
	
	public Product findById(Integer productId) {
		String hql="FROM Product p where p.productId =:productId";
		Product product=null;
		try{
			product = entityManager.createQuery(hql,Product.class)
					               .setParameter("productId", productId)
					               .getSingleResult();
		} catch(NoResultException e) {
			;
		} catch(NonUniqueResultException e) {
			;
		}	
		return product;
	}
	
	public void saveBookmark() {
		Bookmark bk1 = new Bookmark();
		bk1.setFk_memberId(10003);
		bk1.setFk_productId(1000);
		
		Bookmark bk2 = new Bookmark();
		bk2.setFk_memberId(10003);
		bk2.setFk_productId(1001);
		
		entityManager.persist(bk1);
		entityManager.persist(bk2);
	}
	
	
}
