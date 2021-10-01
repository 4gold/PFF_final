package com.EEIT131_PFF.springboot.p_product.service;

import java.util.List;


import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.ProductImage;



public interface ProductService {

	List<Product> findAllProduct();

	void save(Product productId);
	
	void update(Product productId);

	Product findById(Integer productId);

	Product findByProductName(String productName);
	
	Product findByProductId(Integer productId);
	
	Product findByProductId(String productId);

	Partner findPartnerById(Integer partnerId);

	ProductImage getProductImage(Integer productImageId);

	List<Product> getAllProduct(String onSale);


//下方為圖形



	void saveI(ProductImage productImage);

	List<ProductImage> findAllI();

	ProductImage findProductImageById(Integer productImageId);
	
	Product findFk_productIdById(Integer productId);

	List<Product> listAll(String keyword);

	List<Product> findAllOrderByUp();

	List<Product> findAllOrderByDown();
	
	List<Product> findAllOrderonStockByUp();

	List<Product> findAllOrderonStockByDown();

}