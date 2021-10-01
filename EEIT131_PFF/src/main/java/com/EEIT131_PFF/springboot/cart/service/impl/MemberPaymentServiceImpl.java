package com.EEIT131_PFF.springboot.cart.service.impl;



import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.EEIT131_PFF.springboot.cart.repository.MemberPaymentRepository;
import com.EEIT131_PFF.springboot.cart.service.MemberPaymentService;
import com.EEIT131_PFF.springboot.model.MemberPayment;

@Service
@Transactional
public class MemberPaymentServiceImpl implements MemberPaymentService {
	@Autowired
	MemberPaymentRepository memberPaymentRepository;
	
	@Override
	public MemberPayment selectById(Integer fk_orderIds ) {
		return memberPaymentRepository.selectById(fk_orderIds);
	} 
	
	@Override
	public void merge(MemberPayment memberPayment) {
		memberPaymentRepository.merge(memberPayment);
	}
	
	@Override
	public void save(MemberPayment memberPayment) {
		memberPaymentRepository.save(memberPayment);
	}

	
	

}
