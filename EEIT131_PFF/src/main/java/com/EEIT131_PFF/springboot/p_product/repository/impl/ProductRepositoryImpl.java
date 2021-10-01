
package com.EEIT131_PFF.springboot.p_product.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.ProductImage;
import com.EEIT131_PFF.springboot.p_product.repository.ProductRepository;


@Repository
public class ProductRepositoryImpl implements ProductRepository {

	@Autowired
	EntityManager entityManager;

	@Override
	public List<Product> findAll() {
		String hql = "FROM Product";
		return entityManager.createQuery(hql, Product.class).getResultList();
	}
	
    //ONSALE 找尋資料表中有無重複id的方式
	@Override	
	public Product findByProductName(String productName) {
		String hql = "FROM Product p WHERE p.productName = :productName";
		Product user = null;
		
		try {
			user = entityManager.createQuery(hql, Product.class)
					            .setParameter("productName", productName)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;
	}
	
	 //找尋資料表中productid
	
	@Override
	public Product findByProductId(Integer productId) {
		String hql = "FROM Product p WHERE p.productId = :productId";
		Product user = null;
		try {
			user = (Product)entityManager.createQuery(hql, Product.class)
					            .setParameter("productId", productId)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;
	}
	//新增方式
	@Override
	public void save(Product product) {
		if (findByProductName(product.getProductName()) != null) {
			throw new RuntimeException("商品已存在");
		}
		entityManager.persist(product);
	}

	
	
	@Override
	public void update(Product product) {
		Product product0 = findByProductId(product.getProductId());
		//entityManager.detach(product0);
		entityManager.merge(product);
	}


	
	@Override
	public Product findById(Integer productId) {
		return entityManager.find(Product.class, productId);
	}

	@Override
	public Product findByProduct(String productId) {
		String hql = "FROM Product p WHERE p.productId = :productId";
		Product user = null;
		try {
			user = entityManager.createQuery(hql, Product.class)
					            .setParameter("productId", productId)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;

}

	@Override
	public Partner findPartnerById(Integer partnerId) {
		String hql = "FROM Partner WHERE partnerId = :partnerId";
		Partner user1 = null;
		try {
			user1 = entityManager.createQuery(hql, Partner.class)
					            .setParameter("partnerId", partnerId)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user1;

	}

	//傳onSale進去，篩選上架或下架的物品
	@Override
	public List<Product> getAllProduct(String onSale) {
		String hql = "FROM Product WHERE onSale=:onSale";
		return entityManager.createQuery(hql, Product.class).setParameter("onSale", onSale).getResultList();

}

	@Override
	public ProductImage getProductImage(Integer productImageId) {
		String hql = "FROM ProductImage WHERE productImageId = :productImageId";
		ProductImage user1 = null;
		try {
			user1 = entityManager.createQuery(hql, ProductImage.class)
					            .setParameter("productImageId", productImageId)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user1;
	}
	
	//關鍵字搜尋

	@Override
	public List<Product> findAll(String keyword) {
		String hql = "FROM Product p WHERE p.productName LIKE :keyword OR p.productType LIKE :keyword1";
		return entityManager.createQuery(hql, Product.class).setParameter("keyword", "%"+keyword+"%")
				.setParameter("keyword1", "%"+keyword+"%").getResultList();
		
	}
	
	//價格搜尋

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


	
		//下方為圖形
		@Override
		public List<ProductImage> findAllI() {
			String hql="FROM ProductImage";
			return entityManager.createQuery(hql, ProductImage.class)
		            .getResultList();
		}
		
		@Override
		public void saveI(ProductImage productImage) {
			entityManager.persist(productImage);

		}
		

		@Override
		public ProductImage findProductImageById(Integer productImageId) {
			String hql="FROM ProductImage p where p.productImageId =:productImageId";
			ProductImage productImage=null;
			try{
				productImage = entityManager.createQuery(hql,ProductImage.class)
						               .setParameter("productImageId", productImageId)
						               .getSingleResult();
			} catch(NoResultException e) {
				;
			} catch(NonUniqueResultException e) {
				;
			}	
			return productImage;
		}


		@Override
		public Product findFk_productIdById(Integer productId) {
			String hql = "FROM Product WHERE productId = :productId";
			Product user1 = null;
			try {
				user1 = entityManager.createQuery(hql, Product.class)
						            .setParameter("productId", productId)
						            .getSingleResult();
			} catch (NoResultException e) {
				;
			} catch (NonUniqueResultException e) {
				;
			}
			return user1;

		}
		//庫存搜尋

		   //依照庫存從低到高

		  @Override
		  public List<Product> findAllOrderonStockByUp() {
			   String hql = "FROM Product ORDER BY onStock ASC";
			   return entityManager.createQuery(hql, Product.class).getResultList();
		  }

		   // 依照庫存從高到低
		 
		  @Override
		  public List<Product> findAllOrderonStockByDown() {
			   String hql = "FROM Product ORDER BY onStock DESC";
			   return entityManager.createQuery(hql, Product.class).getResultList();
		  }

	
		
	}


	

