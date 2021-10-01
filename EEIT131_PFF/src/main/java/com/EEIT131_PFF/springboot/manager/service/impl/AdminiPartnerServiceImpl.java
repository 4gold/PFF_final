package com.EEIT131_PFF.springboot.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.manager.repository.AdminiPartnerRepository;
import com.EEIT131_PFF.springboot.manager.service.AdminiPartnerService;

@Service
@Transactional
public class AdminiPartnerServiceImpl implements AdminiPartnerService {

	@Autowired
	AdminiPartnerRepository AdminiPartnerRepository;

	@Override
	public List<Partner> findAllPartner() {
		return AdminiPartnerRepository.findAllPartner();
	}

	@Override
	public Partner findByPartnerId(Integer PartnerId) {
		return AdminiPartnerRepository.findByPartnerId(PartnerId);
	}

	@Override
	public void save(Partner partnerId) {
		AdminiPartnerRepository.save(partnerId);
		
	}

	@Override
	public Partner findById(Integer partnerId) {
		return AdminiPartnerRepository.findById(partnerId);
	}

	@Override
	public void update(Partner partnerId) {
		AdminiPartnerRepository.update(partnerId);
		
	}

	@Override
	public void DeletePartner(Integer partnerId) {
		AdminiPartnerRepository.DeletePartner(partnerId);
		
	}

}
