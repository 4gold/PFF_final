package com.EEIT131_PFF.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "SavedPayment")
public class SavedPayment {
    
	@Id @Column(name = "SAVEDPAYMENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int savedPaymentId;
	@Transient@Column(name = "FK_MEMBERID")
	private int fk_memberId;
	@Column(name = "PAYERNAME")
	private String payerName;
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "PHONE")
	private String phone;
	@Column(name = "CARDID")
	private String cardId;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name = "SHOPADDRESS")
	private String shopAddress;
	
	@ManyToOne 
	@JoinColumn(name = "fk_memberId")
	@JsonIgnore
	private Member member;

	public int getSavedPaymentId() {
		return savedPaymentId;
	}

	public void setSavedPaymentId(int savedPaymentId) {
		this.savedPaymentId = savedPaymentId;
	}

	public int getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(int fk_memberId) {
		this.fk_memberId = fk_memberId;
	}
	
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

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "SavedPayment [savedPaymentId=" + savedPaymentId + ", fk_memberId=" + fk_memberId + ", payerName="
				+ payerName + ", email=" + email + ", phone=" + phone + ", cardId=" + cardId + ", address=" + address
				+ ", shopAddress=" + shopAddress + "]";
	}

    

	
	
}
