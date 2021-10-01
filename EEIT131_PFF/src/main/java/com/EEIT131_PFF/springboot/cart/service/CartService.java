package com.EEIT131_PFF.springboot.cart.service;

import java.util.List;

import com.EEIT131_PFF.springboot.cart.vo.CartVo;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberPayment;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.SalesOrder;
import com.EEIT131_PFF.springboot.model.SavedPayment;

public interface CartService {

	/**
	 * @return
	 */
	List<Product> findAll();//此處Product代表使用model裡的product

	/**
	 * 找尋商品利用ID取得
	 * @param productId
	 * @return
	 */
	Product findByProductId(Integer productId);
	
//TODO 請實作 精進自己看可不可以一次撈完
//	List<Product> findByProductIdList(List<Integer> productIdList);
	
	void save(Product product);//存回商品 
	
	void delete(Product product);//刪除商品

	void update(Product product);//更新商品
//-------------------------------------------------------------------------	
	Member findByMemberId(Integer memberId);

	MemberPayment findByMemberPaymentId(Integer memberPaymentId);
//-------------------------------------------------------------------------
	
	Member selectById(String accountId);
		
	SavedPayment selectBySaveMemberPaymentId(Integer memberId);
	
	void saveSalesOrder(SalesOrder salesOrder);//存入銷貨明細
	
	void saveOrderDetails(OrderDetails orderDetails);//存入訂單明細
	
	void saveMemberPayment(MemberPayment memberPaymentId);//存入付款資訊
	
//	void saveSalesOrderCartVo(SalesOrder salesOrder);
	
	OrderDetails selectOrderDetail();
	
	OrderDetails selectOrderDetailById(int orederId);
	

	
}