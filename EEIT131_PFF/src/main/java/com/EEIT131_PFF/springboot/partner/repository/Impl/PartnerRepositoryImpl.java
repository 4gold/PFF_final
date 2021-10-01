package com.EEIT131_PFF.springboot.partner.repository.Impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.EEIT131_PFF.springboot.model.SalesOrder;


import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.partner.repository.PartnerRepository;
import com.EEIT131_PFF.springboot.model.Product;


@Repository
public class PartnerRepositoryImpl implements PartnerRepository {

	@Autowired
	EntityManager entityManager;
	
	@Override
	public List<Partner>  findAll(){
		String hql = "FROM   Partner";
		return entityManager.createQuery(hql, Partner.class)
				            .getResultList();
	}

	@Override
	public Partner findByPartnerId(Integer partnerId) {
		String hql = "FROM Partner m WHERE m.id = :id";
		Partner partner = null;
		try {
			partner = entityManager.createQuery(hql, Partner.class)
		                          .setParameter("id", partnerId)
		                          .getSingleResult();
		} catch(NoResultException e) {
			;
		} catch(NonUniqueResultException e) {
			;
		}	
		return partner;
	}

	@Override
	public void save(Partner partner) {
		entityManager.persist(partner);
	}

	@Override
	public Partner findById(Integer partnerId) {
		return entityManager.find(Partner.class, partnerId);
	}

	@Override
	public void update(Partner partner) {
		entityManager.detach(partner); 
		entityManager.merge(partner);
		
	}

	@Override
	public Partner findByuniformNumbers(String uniformNumbers) {
		String hql = "FROM Partner m WHERE m.id = :id";
		Partner partner = null;
		try {
			partner = entityManager.createQuery(hql, Partner.class)
		                          .setParameter("id", uniformNumbers)
		                          .getSingleResult();
		} catch(NoResultException e) {
			;
		} catch(NonUniqueResultException e) {
			;
		}	
		return partner;
	}

	@Override
	public Partner findById(String partnerId) {
		return entityManager.find(Partner.class, partnerId);
	}

	@Override
	public Partner selectById(String uniformNumbers) {
		String hql = "from Partner where uniformNumbers =: uniformNumbers";
		Partner partner = entityManager.createQuery(hql, Partner.class).setParameter("uniformNumbers", uniformNumbers).getSingleResult();
		return partner;
	}

	@Override
	public List<OrderDetails> selectAllOrder(Integer partnerId) {
		System.out.println("partnerId: "+partnerId);
//		String hql = "from OrderDetails WHERE orderId = 10000";
//		OrderDetails order = (OrderDetails)entityManager.createQuery(hql).getSingleResult();
//		System.out.println(order.getMemberpayment().getMember().getMemberId());
		
		String hql2 = "FROM Product p WHERE p.partner.partnerId =:partnerId";
		
		List<Product> products = entityManager.createQuery(hql2, Product.class).setParameter("partnerId", partnerId).getResultList();
		List<OrderDetails> orders = new ArrayList<>();
		for(int i = 0; i < products.size();i++) {
			
			Integer productId = products.get(i).getProductId();
			String hql3 = "FROM SalesOrder s WHERE s.product.productId=:productId";
			List<SalesOrder> salesOrders = entityManager.createQuery(hql3, SalesOrder.class).setParameter("productId", productId).getResultList();
			List<Integer> orderIdcheck = new ArrayList<>();
			
			//是否重複?
			Boolean isDuplicate = false;
			for(int j = 0;j < salesOrders.size();j++) {
				Integer orderId = salesOrders.get(j).getOrderDetails().getOrderId();
				for(int x = 0; x < orderIdcheck.size(); x++) {
					if(orderIdcheck.get(x) == orderId) {
						isDuplicate = true;					
					}					
				}
				if(!isDuplicate) {
					orderIdcheck.add(orderId);
				}
				isDuplicate = false;
			}
			
			
			
			for(int x = 0 ; x < orderIdcheck.size(); x++) {
				String hql4 = "FROM OrderDetails WHERE orderId =:orderId";
				Integer orderId = orderIdcheck.get(x);
				OrderDetails order = entityManager.createQuery(hql4, OrderDetails.class).setParameter("orderId", orderId).getSingleResult();
				orders.add(order);
			}
		}
		
		
//		Partner partner = (Partner)entityManager.createQuery(hql2,Partner.class).
//				setParameter("partnerId", partnerId).getSingleResult();
//		List<OrderDetails> orders = new ArrayList<OrderDetails>();
//		Set<Product> productSet = new TreeSet<Product>();
//		productSet = partner.getProducts();
//				
//		//排序Set
//		Iterator<Product> itr = productSet.iterator();			    
//				
//		
//		while (itr.hasNext()) {
//			Iterator<SalesOrder> itr2 = itr.next().getSalesOrder().iterator();
//			while(itr2.hasNext()) {
//				OrderDetails currentOrder = itr2.next().getOrderDetails();
//				Boolean isDuplicate=false;
//				for(int i = 0; i < orders.size(); i++) {		
//					if(orders.get(i).getOrderId()==currentOrder.getOrderId()) {
//						isDuplicate=true;
//					};
//				}
//				//檢查沒有重複再加進去
//				if(!isDuplicate) {
//					orders.add(currentOrder);						
//				}
//
//			}
//		   		 
//		}
		
		System.out.println(orders.get(0).getSalesOrders());
		
		return orders;

	}

	@Override
	public OrderDetails selectAllOrder1(Integer orderId) {
		String hql = "FROM OrderDetails WHERE orderId=:orderId";
		
		return (OrderDetails)entityManager.createQuery(hql).setParameter("orderId", orderId).getSingleResult();
	}



	

	 
			
}
