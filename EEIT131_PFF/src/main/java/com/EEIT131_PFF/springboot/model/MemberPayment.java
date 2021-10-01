package com.EEIT131_PFF.springboot.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "MemberPayment")
public class MemberPayment {
	@Id@Column(name = "MEMBERPAYMENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberPaymentId ;
	
	@Transient@Column(name = "FK_MEMBERID")
	private Integer  fk_memberId;
	
	@Transient@Column(name = "FK_ORDERID")//
	private Integer  fk_orderId ;
	
	@Column(name= "EMAIL")
	private String   email;
	
	@Column(name= "PHONE")
	private String   phone;
	
	@Column(name= "CARDID")
	private String   cardId;
	
	@Column(name= "ADDRESS")
	private String   address;
	
	@Column(name= "SHOPADDRESS")
	private String   shopAddress;
	
	@Column(name= "PAYERNAME")
	private String   payerName;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="FK_MEMBERID")
	@JsonIgnore
	private Member  member;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_ORDERID")
	@JsonManagedReference(value="memberPayment-orderDetails")
	private OrderDetails orderDetails;
	
	public MemberPayment() {
		
	}
	

	public MemberPayment(String email, String phone, String cardId, String address, String shopAddress) {
		super();
		this.email = email;
		this.phone = phone;
		this.cardId = cardId;
		this.address = address;
		this.shopAddress = shopAddress;
	}


	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}
	

	public Integer getMemberPaymentId() {
		return memberPaymentId;
	}


	public void setMemberPaymentId(Integer memberPaymentId) {
		this.memberPaymentId = memberPaymentId;
	}


	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}


	public OrderDetails getOrderDetails() {
		return orderDetails;
	}


	public void setOrderDetails(OrderDetails orderDetails) {
		this.orderDetails = orderDetails;
	}


	public Integer getFk_orderId() {
		return fk_orderId;
	}

	public void setFk_orderId(Integer fk_orderId) {
		this.fk_orderId = fk_orderId;
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

	public Member getMemberId() {
		return member;
	}

	public void setMemberId(Member member) {
		this.member = member;
	}
    

	public String getPayerName() {
		return payerName;
	}


	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(" [fk_memberId=");
		builder.append(fk_memberId  );
		builder.append(", fk_orderId  =");
		builder.append(fk_orderId);
		builder.append(", email=");
		builder.append(email );
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", cardId =");
		builder.append(cardId);
		builder.append(", address=");
		builder.append(address);
		builder.append(", shopAddress=");
		builder.append(shopAddress);
		builder.append("]");
		return builder.toString();
	}



	

}
