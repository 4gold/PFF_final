package com.EEIT131_PFF.springboot.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Partner")
public class Partner {
	@Id@Column(name = "PARTNERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer partnerId;
	@Column(name = "UNIFORMNUMBERS")
	private String  uniformNumbers;
	@Column(name = "COMPANYNAME")
	private String  companyName;
	@Column(name = "PHONE")
	private String  phone;
	@Column(name = "PASSWORD")
	private String  password;
	@Column(name = "EMAIL")
	private String  email;
	@Column(name = "ADDRESS")
	private String  address;
	@Column(name = "BUSINESSCATEGORY")
	private String  businessCategory;
	@Column(name = "OFFICIALWEBSITE")
	private String  officialWebsite;
	@Column(name = "REMARKS")
	private String  remarks;
	@Column(name = "BANKACCOUNT")
	private String  bankAccount;
	@Column(name = "FK_ORDERID")
	private String fk_orderId;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "partner",cascade = CascadeType.PERSIST)
	@JsonManagedReference(value="product-partner")
    private Set<Product> products = new HashSet<Product>();
	
//	@OneToMany(fetch = FetchType.EAGER,mappedBy = "partner",cascade = CascadeType.PERSIST)	
//	@JsonManagedReference(value="partner-orders")
//	private Set<PartnerOrders> partnerOrders;
	

	
	public Partner() {
		
	}
	


	public Integer getPartnerId() {
		return partnerId;
	}



	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}



	public String getUniformNumbers() {
		return uniformNumbers.trim();
	}



	public void setUniformNumbers(String uniformNumbers) {
		this.uniformNumbers = uniformNumbers;
	}



	public String getCompanyName() {
		return companyName.trim();
	}



	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}



	public String getPhone() {
		return phone.trim();
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getPassword() {
		return password.trim();
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getEmail() {
		return email.trim();
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getAddress() {
		return address.trim();
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getBusinessCategory() {
		return businessCategory.trim();
	}



	public void setBusinessCategory(String businessCategory) {
		this.businessCategory = businessCategory;
	}



	public String getOfficialWebsite() {
		return officialWebsite.trim();
	}



	public void setOfficialWebsite(String officialWebsite) {
		this.officialWebsite = officialWebsite;
	}



	public String getRemarks() {
		return remarks.trim();
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



	public String getBankAccount() {
		return bankAccount.trim();
	}



	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}



	public Set<Product> getProducts() {
		return products;
	}



	public void setProducts(Set<Product> products) {
		this.products = products;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(" [ uniformNumbers=");
		builder.append(uniformNumbers);
		builder.append(", companyName=");
		builder.append(companyName);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", password=");
		builder.append(password);
		builder.append(", email=");
		builder.append(email);
		builder.append(", address=");
		builder.append(address);
		builder.append(", businessCategory=");
		builder.append(businessCategory);
		builder.append(", officialWebsite=");
		builder.append(officialWebsite);
		builder.append(", remarks=");
		builder.append(remarks);
		builder.append(", bankAccount=");
		builder.append(bankAccount);
		builder.append("]");
		return builder.toString();
	}
	
	
	

}
