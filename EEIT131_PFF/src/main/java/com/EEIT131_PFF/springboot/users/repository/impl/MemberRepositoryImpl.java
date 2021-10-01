package com.EEIT131_PFF.springboot.users.repository.impl;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.OptimisticLockException;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.EEIT131_PFF.springboot.model.Bookmark;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberHealth;
import com.EEIT131_PFF.springboot.model.MemberPayment;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.SavedPayment;
import com.EEIT131_PFF.springboot.users.repository.MemberRepository;


@Repository
@Transactional
public class MemberRepositoryImpl implements MemberRepository{
	
	@Autowired
	EntityManager entityManager;
	
	@Autowired
	Session session;
	
	@Override
	public Member selectById(String accountId) {
		
		String hql="from Member Where accountId =:accountId";
		Member member = null;
		try {
			member= entityManager.createQuery(hql, Member.class)
	                .setParameter("accountId", accountId).getSingleResult();
		}catch (NoResultException nre) { 
			return null; 
		} catch (NonUniqueResultException nure) {
			return null; 
	    }
		
		return member;
		
	}
	
	public void merge(Member member) {		
		if(selectById(member.getAccountId())==null) {
			throw new RuntimeException("帳號不存在");
		}
		//entityManager.detach(member);
		try {
		entityManager.merge(member);
	    }catch(Exception e) {
		e.printStackTrace();
		throw new RuntimeException("更新失敗");
	}
		
		System.out.println("member merged");
	}
	
	public void saveHealth(MemberHealth memberHealth) {
		try {
			entityManager.persist(memberHealth);
		}catch(Exception e){
			
			throw new RuntimeException("儲存健康資料失敗");
		}

	}

	@Override
	public void save(Member member) {
		if(selectById(member.getAccountId())!=null){
			throw new RuntimeException("帳號已存在，請重新輸入");
		}
        entityManager.persist(member);	
	}

	@Override
	public Member findByActiveCode(String activeCode) {
		String hql = "From Member Where activeCode=:activeCode";
		Member member = null;
		try {
			member = (Member)entityManager.createQuery(hql).setParameter("activeCode", activeCode).getSingleResult();
		}catch(NoResultException nre) { 
			return null; 
		} catch (NonUniqueResultException nure) {
			return null; 
	    }
		
		return member;
	}
    
	@Override
	public List<SavedPayment> findSavedPaymentById(String accountId) {
		
		Integer memberId = selectById(accountId).getMemberId();
		
		String hql="FROM SavedPayment WHERE fk_memberId =:memberId";
		List<SavedPayment> savedPayment = entityManager.createQuery(hql).setParameter("memberId", memberId).getResultList();
		return savedPayment;
	}

	@Override
	public void merge(SavedPayment savedPayment) {
		try {
			entityManager.detach(savedPayment);
			
			entityManager.merge(savedPayment);
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("更新失敗");
		}
		System.out.println("savedPayment merge");
	}

	@Override
	public void save(SavedPayment savedPayment) {
		try {		
			entityManager.persist(savedPayment);
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("儲存失敗");
		}
		System.out.println("savedPayment save");
	}

	@Override
	public void deletePayment(Integer svId) {
		String hql = "DELETE FROM SavedPayment WHERE savedPaymentId=:svId";
		
		try {		
			int isSuccess = entityManager.createQuery(hql).setParameter("svId", svId).executeUpdate();
			if(isSuccess==0) {
		        throw new OptimisticLockException("刪除失敗");
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("刪除失敗");
		}
		System.out.println("savedPayment delete");
	};
	
	@Override
	public Boolean hasPayment(String account, Integer SavedPaymentId) {
		//取得此帳號全部的付款資訊
		List<SavedPayment> savedPayments = findSavedPaymentById(account);
		boolean hasPayment = false;
		
		for(int i = 0; i<savedPayments.size();i++) {
			SavedPayment payment = savedPayments.get(i);
			if(payment.getSavedPaymentId()==SavedPaymentId) {
				hasPayment = true;
			}
		}
		
		return hasPayment;
	}
//處理bookmark	
	@Override
	public void deleteBookmark(Integer productId, Member account) {
		
//	   Product product = entityManager.find(Product.class, productId);
//	   System.out.println(account.getProduct());
	   
//	   Iterator<Product> itr = account.getProduct().iterator();
//	   System.out.println(productId);
//	   System.out.println(account.getProduct());
//	   Set<Product> newProduct = new HashSet<>();
//	   while (itr.hasNext()) { 
//		  Product product = itr.next();
//		  if((product.getProductId()).equals(productId)) {	  
//			  System.out.println("remove: "+product.getProductId());	  
//		  }else{
//			  newProduct.add(product);
//		  }
//	   }
//	   account.setProduct(newProduct);
//	   System.out.println("prodcut is?");
//	   System.out.println(account.getProduct());
//	   entityManager.detach(account);
//	   entityManager.merge(account);	   
		
	   String hql = "DELETE FROM Bookmark WHERE fk_productId=:productId AND fk_memberId=:memberId";
	   
	   entityManager.createQuery(hql).setParameter("productId", productId)
	       .setParameter("memberId", account.getMemberId()).executeUpdate();
	   
	   

		System.out.println("bookmark delete");
		
	}
	
	@Override
	public List<Bookmark> selectFromBookmarkBymemberId(Integer memberId){
		String hql = "FROM Bookmark b WHERE b.member.memberId=:memberId";
		return entityManager.createQuery(hql, Bookmark.class).setParameter("memberId", memberId).getResultList();
	}
	
	
	
	//==========取得這個帳戶的所有購物紀錄========

	@Override
	public List<OrderDetails> selectAllPurchaseRecord(Integer memberId) {
		System.out.println("memberId: "+memberId);
//		String hql = "from OrderDetails WHERE orderId = 10000";
//		OrderDetails order = (OrderDetails)entityManager.createQuery(hql).getSingleResult();
//		System.out.println(order.getMemberpayment().getMember().getMemberId());
		
		String hql2 = "FROM Member m WHERE m.memberId =:memberId";
		
		Member member1 = (Member)entityManager.createQuery(hql2).
				setParameter("memberId", memberId).getSingleResult();
		List<OrderDetails> orders = new ArrayList<OrderDetails>();
		Set<MemberPayment> memberPaymentSet = new TreeSet<MemberPayment>();
		memberPaymentSet = member1.getMemberPayment();
		//排序Set
		Iterator<MemberPayment> itr = memberPaymentSet.iterator();			    
				
		
		while (itr.hasNext()) {
		    orders.add(itr.next().getOrderDetails());			 
		}
		
		System.out.println(orders.get(0).getSalesOrders());
		
		return orders;

	}

	@Override
	public OrderDetails selectPurchaseRecord(Integer orderId) {
		String hql = "FROM OrderDetails WHERE orderId=:orderId";
		
		return (OrderDetails)entityManager.createQuery(hql).setParameter("orderId", orderId).getSingleResult();
	}

	@Override
	public Boolean updateMemberPwd(String password, Integer memberId) {
		String hql = "UPDATE Member SET password =:password WHERE memberId=:memberId";
		try {
			entityManager.createQuery(hql).setParameter("password", password).setParameter("memberId", memberId).executeUpdate();
		}catch(Exception e) {
			return false;
		}
		
		return true;
	}

	@Override
	public Boolean hasEmail(String email) {
		String hql = "FROM Member WHERE email=:email";
		Member member = null;
		try {
			member = entityManager.createQuery(hql, Member.class).setParameter("email", email).getSingleResult();
		}catch(Exception e) {
			return false;
		}
		if(member != null) {
			return true;
		}
		
		return false;
	}

	@Override
	public Member selectByEmail(String email) {
		String hql = "FROM Member WHERE email=:email";
		Member member = null;
		try {
			member = entityManager.createQuery(hql, Member.class).setParameter("email", email).getSingleResult();
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("查詢失敗");
		}
			
		return member;
	}

	@Override
	public void updateMemberActiveCode(String randomCode, Integer memberId) {
		String hql ="UPDATE Member SET activeCode=:activeCode WHERE memberId=:memberId";
		Member member = null;
		try {
			entityManager.createQuery(hql).setParameter("activeCode", randomCode)
					.setParameter("memberId", memberId).executeUpdate();
		}catch(Exception e) {
			throw new RuntimeException("更新activeCode失敗");
		}
		
	}

	@Override
	public void mergeMemberHealth(MemberHealth memberHealth) {
		try {
			entityManager.merge(memberHealth);
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("更新memberHealth失敗");
		}
		System.out.println("memberHealth merged");
	}


}
