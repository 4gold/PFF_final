package com.EEIT131_PFF.springboot.partner.service.Impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.partner.repository.PartnerRepository;
import com.EEIT131_PFF.springboot.partner.service.PartnerService;

@Service
@Transactional
public class PartnerServiceImpl implements PartnerService  {

	@Autowired
	PartnerRepository  partnerRepository;
	
	@Override
	public List<Partner>  findAll(){
		return partnerRepository.findAll();
	}

	@Override
	public Partner selectById(String uniformNumbers) {
		return partnerRepository.selectById(uniformNumbers);
	}
	
	@Override
	public Partner findByPartnerId(Integer partnerId) {
		return partnerRepository.findByPartnerId(partnerId);
	}

	@Override
	public void save(Partner partner) {
		if (findByPartnerId(partner.getPartnerId()) != null) {
			throw new RuntimeException("帳號已存在，請更換新帳號");
		}
		partnerRepository.save(partner);
	}

	@Override
	public Partner findById(String partnerId) {
		return partnerRepository.findById(partnerId);
	}

	@Override
	public void update(Partner partner) {
		partnerRepository.update(partner);
	}

	@Override
	public Partner findByuniformNumbers(String uniformNumbers) {
		return partnerRepository.findByuniformNumbers(uniformNumbers);
	}

	@Override
	public Partner findById(Integer partnerId) {
		return partnerRepository.findById(partnerId);
	}

	@Override
	public List<OrderDetails> selectAllOrder(Integer partnerId) {
		return partnerRepository.selectAllOrder(partnerId);
	}

	

	
}
