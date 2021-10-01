package com.EEIT131_PFF.springboot.cart.vo;

import java.math.BigDecimal;

public class SalesOrderVo {
	private  Integer salesOrderId;
	private  Integer fk_productId;
	private  Integer fk_orderId;
	private  Integer quantity;
	private  BigDecimal discount;
	
	public Integer getSalesOrderId() {
		return salesOrderId;
	}
	public void setSalesOrderId(Integer salesOrderId) {
		this.salesOrderId = salesOrderId;
	}
	public Integer getFk_productId() {
		return fk_productId;
	}
	public void setFk_productId(Integer fk_productId) {
		this.fk_productId = fk_productId;
	}
	public Integer getFk_orderId() {
		return fk_orderId;
	}
	public void setFk_orderId(Integer fk_orderId) {
		this.fk_orderId = fk_orderId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return "SalesOrderVo [salesOrderId=" + salesOrderId + ", fk_productId=" + fk_productId + ", fk_orderId="
				+ fk_orderId + ", quantity=" + quantity + ", discount=" + discount + "]";
	}
	
	

}
