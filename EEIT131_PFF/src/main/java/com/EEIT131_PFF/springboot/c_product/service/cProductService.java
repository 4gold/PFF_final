package com.EEIT131_PFF.springboot.c_product.service;

import java.util.List;


import com.EEIT131_PFF.springboot.model.Product;



public interface cProductService {

	Product findById(Integer productId);	 

//	List<Instructors> saveData();

	void saveI(Product product);

	List<Product> findAllI();

	List<Product> findAllOrderByUp();

	List<Product> getAllTP(String productType);

	List<Product> listAll(String keyword);

	List<Product> findAllOrderByDown();



}
