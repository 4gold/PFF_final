package com.EEIT131_PFF.springboot.model;


import java.math.BigDecimal;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.annotation.ObjectIdGenerators.IntSequenceGenerator;
import com.voodoodyne.jackson.jsog.JSOGGenerator;


@Entity
@Table(name = "SalesOrder")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "salesOrderId")
//避免迴圈用指定的Id為準，發現重複會阻止
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class SalesOrder {
	
	@Id@Column(name = "SALESORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer  salesOrderId;
	
    
	@Transient@Column(name="FK_PRODUCTID")
	private Integer fk_productId;
    
	@Transient@Column(name="FK_ORDERID")
	private Integer fk_orderId;
	
	@Column(name="QUANTITY")
	private Integer quantity;
	
	@Column(name="DISCOUNT")
	private Double discount;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="FK_ORDERID")
	@JsonBackReference(value="orderDetails-salesOrder")
	private OrderDetails orderDetails;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="FK_PRODUCTID")
	//@JsonBackReference(value="salesOrder-product")
	private Product product;

	
	
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

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public OrderDetails getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(OrderDetails orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getSalesOrderId() {
		return salesOrderId;
	}

	public void setSalesOrderId(Integer salesOrderId) {
		this.salesOrderId = salesOrderId;
	}





	
	
	
	
}

