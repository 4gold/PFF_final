package com.EEIT131_PFF.springboot.partner.repository;

import java.util.List;


import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Partner;

public interface PartnerRepository {

	List<Partner> findAll();

	Partner findByPartnerId(Integer partnerId);

	void save(Partner partner);

	Partner findById(String partnerId);

    void update(Partner partnerId) ;

	Partner findByuniformNumbers(String uniformNumbers);

	Partner findById(Integer partnerId);

	Partner selectById(String uniformNumbers);

	List<OrderDetails> selectAllOrder(Integer partnerId);

	OrderDetails selectAllOrder1(Integer orderId);

}