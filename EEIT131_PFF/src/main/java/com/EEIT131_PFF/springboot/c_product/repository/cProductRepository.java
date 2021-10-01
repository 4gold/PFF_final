package com.EEIT131_PFF.springboot.c_product.repository;

import java.util.List;

import com.EEIT131_PFF.springboot.model.Product;


public interface cProductRepository {

	


	Product findById(Integer productId);


//	List<Instructors> saveData();

	void saveI(Product product);

	List<Product> findAllI();

	List<Product> findAllOrderByUp();

	List<Product> getAllTP(String productType) ;



	List<Product> findAll123(String keyword);

	List<Product> findAllOrderByDown();
}
