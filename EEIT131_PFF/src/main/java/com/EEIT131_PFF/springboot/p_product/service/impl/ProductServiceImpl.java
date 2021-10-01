package com.EEIT131_PFF.springboot.p_product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.ProductImage;
import com.EEIT131_PFF.springboot.p_product.repository.ProductRepository;
import com.EEIT131_PFF.springboot.p_product.service.ProductService;





@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository ProductRepository;

	@Override
	public List<Product> findAllProduct() {
		return ProductRepository.findAll();
	}

	@Override
	public Product findByProductId(Integer productId) {
		return ProductRepository.findByProductId(productId);
	}

	@Override
	public void save(Product product) {
		ProductRepository.save(product);
	}

	@Override
	public Product findById(Integer productId) {
		return ProductRepository.findById(productId);
	}

	@Override
	public void update(Product productId) {
		ProductRepository.update(productId);
	}

	@Override
	public Product findByProductName(String productName) {
		return ProductRepository.findByProductName(productName);
	}

	@Override
	public Product findByProductId(String productId) {
		return ProductRepository.findByProduct(productId);
	}

	@Override
	public Partner findPartnerById(Integer partnerId) {
		return  ProductRepository.findPartnerById(partnerId);
	}

	@Override
	public List<Product> getAllProduct(String onSale) {
	
		return ProductRepository.getAllProduct(onSale);
	}


	@Override
	public ProductImage getProductImage(Integer productImageId) {
	
		return ProductRepository.getProductImage(productImageId);
	}
	
//下方為圖形

	@Override
	public List<ProductImage> findAllI() {

		return ProductRepository.findAllI();
	}
	
	

	@Override
	public void saveI(ProductImage productImage) {
//		if (findByMemberId(member.getId()) != null) {
//			throw new RuntimeException("帳號已存在，請更換新帳號");
//		}
		ProductRepository.saveI(productImage);
	}

	@Override
	public ProductImage findProductImageById(Integer productImageId) {
		return ProductRepository.findProductImageById(productImageId);
	}
	
	@Override
	public Product findFk_productIdById(Integer productId) {
		return  ProductRepository.findFk_productIdById(productId);
	}

	//關鍵字
	
	
	@Override
	public List<Product> listAll(String keyword) {
		if (keyword !=null) {
			return ProductRepository.findAll(keyword);
		}
		return ProductRepository.findAll();
	}
	
	//價格搜尋
	
	
	@Override
	public List<Product> findAllOrderByUp() {

		return ProductRepository.findAllOrderByUp();
	}
	

	
	@Override
	public List<Product> findAllOrderByDown() {

		return ProductRepository.findAllOrderByDown();
	}
	
	@Override
	public List<Product> findAllOrderonStockByUp() {
		
		return ProductRepository.findAllOrderonStockByUp();
	}
	@Override
	public List<Product> findAllOrderonStockByDown() {
		
		return ProductRepository.findAllOrderonStockByDown();
	}


}
