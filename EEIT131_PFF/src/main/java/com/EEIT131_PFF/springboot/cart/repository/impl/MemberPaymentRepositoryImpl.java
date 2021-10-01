package com.EEIT131_PFF.springboot.cart.repository.impl;



import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.EEIT131_PFF.springboot.cart.repository.MemberPaymentRepository;
import com.EEIT131_PFF.springboot.model.MemberPayment;

@Repository
@Transactional
public class MemberPaymentRepositoryImpl implements MemberPaymentRepository {
	
	@Autowired
	EntityManager entityManager;
	
	@Override //一筆訂單明細就有一筆會員付款資訊
	public MemberPayment selectById(Integer fk_orderIds ) {
		
		String hql="from MemberPayment Where fk_orderId =:fk_orderIds";//帳號是唯一值
		MemberPayment member = null;
		try {
			member= entityManager.createQuery(hql, MemberPayment.class)
	                .setParameter("fk_memberId", fk_orderIds).getSingleResult();
		}catch (NoResultException nre) { 
			return null; 
		} catch (NonUniqueResultException nure) {
			return null; 
	    }
		
		return member;//有查到就塞回去
		
	}
	
	@Override
	public void merge(MemberPayment memberPayment) {		
		if(selectById(memberPayment.getFk_memberId())==null) {
			throw new RuntimeException("查付款無紀錄");
		}
		entityManager.detach(memberPayment);
		
		entityManager.merge(memberPayment);
		
		System.out.println("memberPayment merged");
	}
	
	
	@Override
	public void save(MemberPayment MemberPayment) {
	
        entityManager.persist(MemberPayment);	
	}
	
	
	
   
	
	
	
	
	

		
	
   

}
