package com.EEIT131_PFF.springboot.p_product.repository;

import java.util.List;


import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.ProductImage;


public interface ProductRepository {

	List<Product> findAll();

	void save(Product productId);

	void update(Product product);

	Product findById(Integer productId);

	Product findByProductName(String productName);
	
	
	//在確認 這兩葛塞在哪裡
	Product findByProductId(Integer productId);
	Product findByProduct(String productId);

	Partner findPartnerById(Integer partnerId);
	
	//下方為圖形的
	
	ProductImage getProductImage(Integer productImageId);

	List<Product> getAllProduct(String onSale);
	//下方為圖形的
	
	
	ProductImage findProductImageById(Integer productImageId);
	
	Product findFk_productIdById(Integer productId);
	
	void saveI(ProductImage productImage);

	List<ProductImage> findAllI();

	List<Product> findAll(String keyword);

	List<Product> findAllOrderByUp();

	List<Product> findAllOrderByDown();
	
	List<Product> findAllOrderonStockByUp();

	List<Product> findAllOrderonStockByDown();


}