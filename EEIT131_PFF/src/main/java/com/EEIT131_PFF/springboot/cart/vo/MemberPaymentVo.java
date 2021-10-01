package com.EEIT131_PFF.springboot.cart.vo;

public class MemberPaymentVo {
	
	private String  payerName;
	private String  email;
	private String  phone;
	private String  cardId;
	private String  address;
	
	
	public String getPayerName() {
		return payerName;
	}
	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "MemberPaymentVo [payerName=" + payerName + ", email=" + email + ", phone=" + phone + ", cardId="
				+ cardId + ", address=" + address + "]";
	}
	
	
	
}
