package com.EEIT131_PFF.springboot.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.cart.repository.CartRepository;
import com.EEIT131_PFF.springboot.cart.service.CartService;
import com.EEIT131_PFF.springboot.cart.vo.CartVo;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberPayment;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.SalesOrder;
import com.EEIT131_PFF.springboot.model.SavedPayment;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	@Autowired
	CartRepository cartRepository;
	
	@Override
	public List<Product> findAll(){
		List<Product> list = cartRepository.findAll();
		return list;
	}//此處Product代表使用model裡的product
	
	@Override
	public Product findByProductId(Integer productId) {
		return cartRepository.findByProductId(productId);
	}

	@Override
	public void save(Product product) {
		
		if (findByProductId(product.getProductId()) != null) {
			throw new RuntimeException("已有商品");
		}
		cartRepository.save(product);
	}
	

	@Override
	public void delete(Product product) {
		cartRepository.delete(product);
	}

	@Override
	public void update(Product product) {
		cartRepository.update(product);
		
	}

	@Override //取會員資料
	public Member findByMemberId(Integer memberId) {
		return cartRepository.findByMemberId(memberId);
	}

	
	@Override
	public MemberPayment findByMemberPaymentId(Integer memberPaymentId) {
		return cartRepository.findByMemberPaymentId(memberPaymentId);
	}


	@Override
	public Member selectById(String accountId) {
		return cartRepository.selectById(accountId);
		
	}

	@Override
	//存入
	public void saveOrderDetails(OrderDetails orderDetails) {
		 cartRepository.saveOrderDetails(orderDetails);
		
	}

	@Override
	public void saveSalesOrder(SalesOrder salesOrder) {
		cartRepository.saveSalesOrder(salesOrder);	
	}

	@Override
	public SavedPayment selectBySaveMemberPaymentId(Integer memberId) {
		return cartRepository.selectBySaveMemberPaymentId(memberId);
	}

	@Override
	public void saveMemberPayment(MemberPayment memberPaymentId) {
		cartRepository.saveMemberPayment(memberPaymentId);
		
	}

//	@Override
//	public void saveSalesOrderCartVo(SalesOrder salesOrder) {
//		
//		return;
//	
////		return cartRepository.saveSalesOrderCartVo(salesOrder);
//	}

	@Override
	public OrderDetails selectOrderDetail() {
		return cartRepository.selectOrderDetail();
	}
	
	@Override
	public OrderDetails selectOrderDetailById(int orederId) {
		return cartRepository.selectOrderDetailById(orederId);
	}



}
