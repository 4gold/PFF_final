package com.EEIT131_PFF.springboot.partner.service;

import java.util.List;


import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Partner;

public interface PartnerService {

	List<Partner> findAll();

	Partner findByPartnerId(Integer partnerId);

	void save(Partner partner);

	Partner findByuniformNumbers(String uniformNumbers);

	void update(Partner partnerId);

	Partner findById(String partnerId);

	Partner findById(Integer partnerId);

	Partner selectById(String uniformNumbers);

	List<OrderDetails> selectAllOrder(Integer partnerId);

	

	

	

	

	

}