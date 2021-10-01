package com.EEIT131_PFF.springboot.manager.repository;

import java.util.List;

import com.EEIT131_PFF.springboot.model.Partner;

public interface AdminiPartnerRepository {

	List<Partner> findAllPartner();

	Partner findByPartnerId(Integer partnerId);

	void save(Partner partnerId);

	Partner findById(Integer partnerId);

	void update(Partner partner);

	void DeletePartner(Integer partnerId);



}