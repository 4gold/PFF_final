package com.EEIT131_PFF.springboot.c_product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.EEIT131_PFF.springboot.c_product.repository.cProductRepository;
import com.EEIT131_PFF.springboot.c_product.service.cProductService;
import com.EEIT131_PFF.springboot.model.Product;

@Service
@Transactional
public class cProductServiceImpl implements cProductService {
	
	@Autowired
	cProductRepository productRepository;

	

	@Override
	public List<Product> findAllI() {

		return productRepository.findAllI();
	}
	
	@Override
	public List<Product> findAllOrderByUp() {

		return productRepository.findAllOrderByUp();
	}
	

	@Override
	public List<Product> findAllOrderByDown() {

		return productRepository.findAllOrderByDown();
	}
	
	@Override
	public List<Product> listAll(String keyword) {
		if (keyword !=null) {       
			return productRepository.findAll123(keyword);
		}
		return productRepository.findAll123(keyword);
	}
	
//	@Override
//	public List<Instructors> saveData() {
//		return productRepository.saveData();
//	}


	@Override
	public void saveI(Product product) {
//		if (findByMemberId(member.getId()) != null) {
//			throw new RuntimeException("帳號已存在，請更換新帳號");
//		}
		productRepository.saveI(product);
	}
	



	@Override
	public Product findById(Integer productId) {
		return productRepository.findById(productId);
	}


	
	 @Override
	 public List<Product> getAllTP(String productType) {
	 
	  return productRepository.getAllTP(productType);
	 }

}
