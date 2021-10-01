package com.EEIT131_PFF.springboot.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.EEIT131_PFF.springboot.model.SalesOrder;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
@Entity
@Table(name = "OrderDetails")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "orderId")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class OrderDetails {
	@Id@Column(name = "ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderId;
	
	@Column(name="FK_PARTNERID")
	private String fk_partnerId;
	
	@Column(name="ORDERSTATUS")
	private String  orderStatus;
	
	@Column(name = "PAYMENTSTATUS")
	private String  paymentStatus;
	
	@Column(name = "PAYMENTMETHOD")
	private String  paymentMethod;
	
	@Column(name = "SHIPPINGSTATUS")
	private String  shippingStatus;
	
	@Column(name = "SHIPPINGMETHOD")
	private String  shippingMethod;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	Timestamp orderTime;
	
	@Column(name = "REMARKS")
	private String  remarks;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	Timestamp finishedTime;
	
	@OneToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL,mappedBy = "orderDetails" )
	@JsonBackReference(value="memberPayment-orderDetails")
	private MemberPayment memberpayment;
	
	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "orderDetails")
	@JsonManagedReference(value="orderDetails-salesOrder")
	private Set<SalesOrder> salesOrders = new HashSet<SalesOrder>(0);
	
	
//	@OneToMany(fetch = FetchType.EAGER,mappedBy = "orderDetails",cascade = CascadeType.PERSIST)	
//	@JsonManagedReference(value="orderDetails-partner")
//	private Set<PartnerOrders> partnerOrders;
	
	
	public OrderDetails() {
		
	}
	
	public OrderDetails(String orderStatus, String paymentStatus, String paymentMethod, String shippingStatus,
			String shippingMethod, Timestamp orderTime, String remarks, Timestamp finishedTime, MemberPayment memberpayment,
			Set<SalesOrder> salesOrders) {
		super();
		this.orderStatus = orderStatus;
		this.paymentStatus = paymentStatus;
		this.paymentMethod = paymentMethod;
		this.shippingStatus = shippingStatus;
		this.shippingMethod = shippingMethod;
		this.orderTime = orderTime;
		this.remarks = remarks;
		this.finishedTime = finishedTime;
		this.memberpayment = memberpayment;
		this.salesOrders = salesOrders;
	}


	public MemberPayment getMemberpayment() {
		return memberpayment;
	}

	public void setMemberpayment(MemberPayment memberpayment) {
		this.memberpayment = memberpayment;
	}



	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderStatus() {
		return orderStatus.trim();
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getPaymentStatus() {
		return paymentStatus.trim();
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getPaymentMethod() {
		return paymentMethod.trim();
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	
	public String getShippingStatus() {
		return shippingStatus.trim();
	}

	public void setShippingStatus(String shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	public String getShippingMethod() {
		return shippingMethod.trim();
	}

	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
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

	
	
	public Set<SalesOrder> getSalesOrders() {
		return salesOrders;
	}

	public void setSalesOrders(Set<SalesOrder> salesOrders) {
		this.salesOrders = salesOrders;
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(" [ orderId=");
		builder.append(orderId);
		builder.append(", orderStatus=");
		builder.append(orderStatus);
		builder.append(", paymentStatus=");
		builder.append(paymentStatus);
		builder.append(", paymentMethod=");
		builder.append(paymentMethod);
		builder.append(", shippingStatus=");
		builder.append(shippingStatus);
		builder.append(", shippingMethod=");
		builder.append(shippingMethod);
		builder.append(", orderTime=");
		builder.append(orderTime);
		builder.append(", remarks=");
		builder.append(remarks);
		builder.append(", finishedTime=");
		builder.append(finishedTime);
		builder.append("]");
		return builder.toString();
	}

	
	
	

}
