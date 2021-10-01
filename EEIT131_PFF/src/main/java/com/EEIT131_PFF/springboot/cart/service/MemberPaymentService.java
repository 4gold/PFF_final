package com.EEIT131_PFF.springboot.cart.service;

import com.EEIT131_PFF.springboot.model.MemberPayment;

public interface MemberPaymentService {

	MemberPayment selectById(Integer fk_orderIds);

	void merge(MemberPayment memberPayment);

	void save(MemberPayment memberPayment);

}