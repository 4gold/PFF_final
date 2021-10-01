
package com.EEIT131_PFF.springboot.cart.repository.impl;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.EEIT131_PFF.springboot.cart.repository.CartRepository;
import com.EEIT131_PFF.springboot.cart.vo.CartVo;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberPayment;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.SalesOrder;
import com.EEIT131_PFF.springboot.model.SavedPayment;

@Repository
@Transactional
public class CartRepositoryImpl implements CartRepository {

	@Autowired
	EntityManager entityManager;

	@Override
	@Transactional
	public List<Product> findAll() {
		String hql = "FROM Product";// Product找尋的是物件名稱
		return entityManager.createQuery(hql, Product.class).getResultList();

	}

	// 找尋資料表中productId
	@Override
	@Transactional
	public Product findByProductId(Integer productId) {
		String hql = "FROM Product m WHERE m.productId = :productId";
		Product user = null;
		try {
			user = entityManager.createQuery(hql, Product.class).setParameter("productId", productId).getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;
	}

	// 新增方式
	@Override
	@Transactional
	public void save(Product product) {
		entityManager.persist(product);
	}

	@Override
	@Transactional
	public void delete(Product product) {
		entityManager.remove(entityManager.contains(product) ? product : entityManager.merge(product));

	}

	@Override
	@Transactional
	public void update(Product product) {
		Product product0 = findByProductId(product.getProductId());
		entityManager.detach(product0);
		entityManager.merge(product);

	}

	@Override
	@Transactional
	public Member findByMemberId(Integer memberId) {
		String hql = "FROM Member WHERE memberId = :memberId";
		Member user = null;
		try {
			user = entityManager.createQuery(hql, Member.class).setParameter("memberId", memberId).getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;
	}

	@Override
	@Transactional
	public MemberPayment findByMemberPaymentId(Integer memberPaymentId) {
		String hql = "FROM MemberPayment WHERE memberPaymentId = : memberPaymentId";
		MemberPayment user = null;
		try {
			user = entityManager.createQuery(hql, MemberPayment.class).setParameter("memberPaymentId", memberPaymentId)
					.getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;

	}


	
	@Override
	@Transactional
	//Member 會員資料表 利用 accoungId 是唯一值
	public Member selectById(String accountId) {
		
		String hql="from Member Where accountId =:accountId"; 
		//hql(Hibernate Query Language) Where語法 條件為是 accountId =: accountId
		Member member = null;
		try {
			member= entityManager.createQuery(hql, Member.class)
	                .setParameter("accountId", accountId).getSingleResult();
			//entityManager建立週期.createQuery(hql,Member.class物件)取得(HQL語法).setParameter()設定參數值.getSingleResult();回應錯誤
		}catch (NoResultException nre) { 
			return null; 
		} catch (NonUniqueResultException nure) {
			return null; 
	    }
		
		return member;//查詢結果正確最後傳回Member物件
		
	}



	@Override
	@Transactional
	public void saveOrderDetails(OrderDetails orderDetails) {
		entityManager.persist(orderDetails);
		
	}


	
	@Override
	@Transactional
	//用memberId從SavedPayment取
	public SavedPayment selectBySaveMemberPaymentId(Integer memberId) {
		
		String hql="from SavedPayment Where fk_memberId =:memberId"; 
		//hql(Hibernate Query Language) Where語法 條件為是 accountId =: accountId
		List<SavedPayment> savedPayments = null;
		SavedPayment savedPayment = null;
		try {
			savedPayments = entityManager.createQuery(hql, SavedPayment.class)
	                .setParameter("memberId", memberId).getResultList();
			//entityManager建立週期.createQuery(hql,Member.class物件)取得(HQL語法).setParameter()設定參數值.getSingleResult();回應錯誤
			savedPayment = savedPayments.get(0);
		}catch (NoResultException nre) { 
			return null; 
		} catch (NonUniqueResultException nure) {
			return null; 
	    }
		
		return savedPayment;//查詢結果正確最後傳回Member物件
		
	}

	@Override
	public void saveMemberPayment(MemberPayment memberPaymentId) {
		entityManager.persist(memberPaymentId);
		
	}

	
	@Override
	@Transactional
	public void saveSalesOrder(SalesOrder salesOrder) {
		entityManager.persist(salesOrder);		
	}
	
//08/23 差這個沒寫
//	@Override
//	public SalesOrder saveSalesOrder(SalesOrder salesOrder) {
//		
//		entityManager.persist(salesOrder);
//	}

	@Override
	public OrderDetails selectOrderDetail() {
		String hql="from OrderDetails Order by orderId DESC"; 
		OrderDetails orderDetail = null;
		try {
			List<OrderDetails> orderList = entityManager.createQuery(hql, OrderDetails.class).getResultList();
			orderDetail = orderList.get(0);

		}catch (NoResultException nre) { 
			return null; 
		} catch (NonUniqueResultException nure) {
			return null; 
	    }
		
		return orderDetail;//查詢結果正確最後傳回Member物件
	}
	
	@Override
	public OrderDetails selectOrderDetailById(int orederId) {
		String hql="from OrderDetails where orderId = :orderId"; 
		
		OrderDetails orderDetail = null;
		try {
			orderDetail = entityManager.createQuery(hql, OrderDetails.class).setParameter("orderId", orederId).getSingleResult();

		}catch (NoResultException nre) { 
			return null; 
		} catch (NonUniqueResultException nure) {
			return null; 
	    }
		
		return orderDetail;//查詢結果正確最後傳回Member物件
	}


@Override
public List<CartVo> saveSalesOrderCartVo(SalesOrder salesOrder) {
	// TODO Auto-generated method stub
	return null;
}


	
	
	
	

}
