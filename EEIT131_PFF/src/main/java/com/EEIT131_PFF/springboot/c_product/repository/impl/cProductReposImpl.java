package com.EEIT131_PFF.springboot.c_product.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.c_product.repository.cProductRepository;
import com.EEIT131_PFF.springboot.model.Product;



@Repository
@Transactional
public class cProductReposImpl implements cProductRepository {

	@Autowired
	EntityManager entityManager;



	@Override
	public List<Product> findAllI() {
		String hql = "FROM Product";
		return entityManager.createQuery(hql, Product.class).getResultList();
	}

//	@Override
//	public List<Instructors> saveData() {
//		String hql="FROM Instructors";
//		return entityManager.createQuery(hql, Instructors.class)
//	            .getResultList();
//	}

	

	@Override
	public void saveI(Product product) {
		entityManager.persist(product);

	}

//	@Override
//	public Instructors findById(Integer instructorId) {
//		return entityManager.find(Instructors.class, instructorId);
//	}	

	@Override
	public Product findById(Integer productId) {
		String hql = "FROM Product i where i.productId =:productId";
		Product product = null;
		try {
			product = entityManager.createQuery(hql, Product.class).setParameter("productId", productId)
					.getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return product;
	}


    //依照價格從低到高
	@Override
	public List<Product> findAllOrderByUp() {
		String hql = "FROM Product ORDER BY price ASC";
		return entityManager.createQuery(hql, Product.class).getResultList();
	}

	// 依照價格從高到低
	@Override
	public List<Product> findAllOrderByDown() {
		String hql = "FROM Product ORDER BY price DESC";
		return entityManager.createQuery(hql, Product.class).getResultList();
	}

	// 傳type進去，篩選物品
	@Override
	public List<Product> getAllTP(String type) {
		String hql = "FROM Product WHERE productType=:type";
		return entityManager.createQuery(hql, Product.class).setParameter("type", type).getResultList();
	}

	@Override
	public List<Product> findAll123(String keyword) {
		String hql = "FROM Product p WHERE p.productName LIKE :keyword OR p.productType LIKE :keyword1";
		return entityManager.createQuery(hql, Product.class).setParameter("keyword", "%" + keyword + "%")
				.setParameter("keyword1", "%" + keyword + "%").getResultList();

	}

	
}
