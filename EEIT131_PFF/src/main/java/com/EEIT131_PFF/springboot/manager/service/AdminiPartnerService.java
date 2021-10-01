package com.EEIT131_PFF.springboot.manager.service;

import java.util.List;

import com.EEIT131_PFF.springboot.model.Partner;

public interface AdminiPartnerService {

	List<Partner> findAllPartner();

	Partner findByPartnerId(Integer partnerId);

	void save(Partner partnerId);

	Partner findById(Integer partnerId);

	void update(Partner partnerId);

	void DeletePartner(Integer partnerId);

}