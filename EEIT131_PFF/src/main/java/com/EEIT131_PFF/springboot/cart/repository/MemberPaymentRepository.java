package com.EEIT131_PFF.springboot.cart.repository;

import com.EEIT131_PFF.springboot.model.MemberPayment;

public interface MemberPaymentRepository {

	MemberPayment selectById(Integer fk_orderIds);

	void merge(MemberPayment memberPayment);

	void save(MemberPayment MemberPayment);

}