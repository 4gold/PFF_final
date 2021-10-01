package com.EEIT131_PFF.springboot.cart.repository;

import java.util.List;


import com.EEIT131_PFF.springboot.cart.vo.CartVo;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberPayment;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.SalesOrder;
import com.EEIT131_PFF.springboot.model.SavedPayment;


public interface CartRepository {

	List<Product> findAll();
	
	
	Product findByProductId(Integer productId);

	void save(Product product);
	
	void delete(Product product);


	void update(Product product);


	Member findByMemberId(Integer memberId);


	MemberPayment findByMemberPaymentId(Integer memberPaymentId);

	Member selectById(String accountId);


    void saveOrderDetails(OrderDetails orderDetails);


	void saveSalesOrder(SalesOrder salesOrder);
	
	SavedPayment selectBySaveMemberPaymentId(Integer memberId); //抓取用memberId從SavedPayment取


	void saveMemberPayment(MemberPayment memberPaymentId);


	List<CartVo> saveSalesOrderCartVo(SalesOrder salesOrder);


	OrderDetails selectOrderDetail();


	OrderDetails selectOrderDetailById(int orederId);
	
	





}