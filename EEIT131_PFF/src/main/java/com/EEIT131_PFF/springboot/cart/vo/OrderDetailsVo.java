package com.EEIT131_PFF.springboot.cart.vo;

import java.sql.Timestamp;

public class OrderDetailsVo {
	private  Integer orderId;
	private  String  orderStatus;
	private  String  paymentStatus;
	private  String  paymentMethod;
	private  String  shippingStatus;
	private  Timestamp orderTime;
	private  String  remarks;
	private  Timestamp finishedTime;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	
	public String getShippingStatus() {
		return shippingStatus;
	}
	public void setShippingStatus(String shippingStatus) {
		this.shippingStatus = shippingStatus;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Timestamp getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Timestamp getFinishedTime() {
		return finishedTime;
	}
	public void setFinishedTime(Timestamp finishedTime) {
		this.finishedTime = finishedTime;
	}
	@Override
	public String toString() {
		return "OrderDetailsVo [orderId=" + orderId + ", orderStatus=" + orderStatus + ", paymentStatus="
				+ paymentStatus + ", paymentMethod=" + paymentMethod + ", shippingStatus=" + shippingStatus
				+ ", orderTime=" + orderTime + ", remarks=" + remarks + ", finishedTime=" + finishedTime + "]";
	}
	
	

	
	
	

}
