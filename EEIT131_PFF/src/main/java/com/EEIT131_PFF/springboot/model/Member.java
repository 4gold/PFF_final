package com.EEIT131_PFF.springboot.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators.IntSequenceGenerator;
@Entity
@Table(name = "Member")
public class Member {
	
	@Id@Column(name = "MEMBERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberId;
	
	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "member")
	@JsonIgnore
	private Set< MemberPayment > memberPayment  = new HashSet< MemberPayment >(0);
	
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "member")
	@JsonManagedReference(value="member-health")
	private MemberHealth memberHealth;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "member")
	@JsonIgnore
	private Set< SavedPayment > savedPayment = new HashSet< SavedPayment >();
//	
//	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
//    @JoinTable(name="Bookmark", joinColumns= {@JoinColumn(name="fk_memberID")}, 
//    inverseJoinColumns= {@JoinColumn(name="fk_productID")})
//	@JsonBackReference(value="member-product")
//	private Set< Product > product = new HashSet<Product>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "member")
//	@JsonManagedReference(value="memberBookmark")
	@JsonIgnore
	private Set<Bookmark> bookmark = new HashSet<Bookmark>();
	
	@Column(name = "ACCOUNTID")
	private String  accountId;
	
	@Column(name = "PASSWORD")
	private String  password;
	@Column(name = "USERNAME")
	private String  userName;
	@Column(name = "BIRTHDAY")
	private String birthday;
	@Column(name = "EMAIL")
	private String  email;
	@Column(name = "ADDRESS")
	private String  address;
	@Column(name = "PHONE1")
	private String  phone1;
	@Column(name = "PHONE2")
	private String  phone2;
	@Column(name = "PHONE3")
	private String  phone3;
	@Column(name = "CREATETIME")
	private Timestamp createTime;
	@Column(name = "ACTIVECODE")
	private String activeCode;
	@Column(name = "ACTIVESTATUS")
	private Integer activeStatus;
	
	
	

	public Member() {
		
	}
	

	public Set<MemberPayment> getMemberPayment() {
		return memberPayment;
	}


	public void setMemberPayment(Set<MemberPayment> memberPayment) {
		this.memberPayment = memberPayment;
	}


	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
		
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
    

	public Timestamp getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	

	public String getActiveCode() {
		return activeCode;
	}


	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}


	public Integer getActiveStatus() {
		return activeStatus;
	}


	public void setActiveStatus(Integer activeStatus) {
		this.activeStatus = activeStatus;
	}


	public MemberHealth getMemberHealth() {
		return memberHealth;
	}


	public void setMemberHealth(MemberHealth memberHealth) {
		this.memberHealth = memberHealth;
	}
	


	public Set<SavedPayment> getSavedPayment() {
		return savedPayment;
	}


	public void setSavedPayment(Set<SavedPayment> savedPayment) {
		this.savedPayment = savedPayment;
	}



	
//    public void addProduct(Product product) {
//        this.product.add(product);
//        product.getMember().add(this);
//    }
//  
//    public void removeProduct(Product product) {
//        this.product.remove(product);
//        product.getMember().remove(this);
//    }
//

	public Set<Bookmark> getBookmark() {
		return bookmark;
	}


	public void setBookmark(Set<Bookmark> bookmark) {
		this.bookmark = bookmark;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [pk=");
		builder.append(memberId);
		builder.append(", accountId=");
		builder.append(accountId);
		builder.append(", password=");
		builder.append(password);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", email=");
		builder.append(email);
		builder.append(", address=");
		builder.append(address);
		builder.append(", phone1=");
		builder.append(phone1);
		builder.append(", phone2=");
		builder.append(phone2);
		builder.append(", phone3=");
		builder.append(phone3);
		builder.append(", activeCode=");
		builder.append(activeCode);
		builder.append(", activeStatus=");
		builder.append(activeStatus);
		builder.append(", createTime=");
		builder.append(createTime);
		builder.append("]");
		return builder.toString();
	}
	
	public String toJSON() {
		StringBuilder builder = new StringBuilder();
		builder.append("{ \"memberId\":");
		builder.append('\"'+memberId+'\"');
		builder.append(", \"accountId\":");
		builder.append('\"'+accountId+'\"');
		builder.append(", \"password\":");
		builder.append('\"'+password+'\"');
		builder.append(", \"userName\":");
		builder.append('\"'+userName+'\"');
		builder.append(", \"birthday\":");
		builder.append('\"'+birthday+'\"');
		builder.append(", \"email\":");
		builder.append('\"'+email+'\"');
		builder.append(", \"address\":");
		builder.append('\"'+address+'\"');
		builder.append(", \"phone1\":");
		builder.append('\"'+phone1+'\"');
		builder.append(", \"phone2\":");
		builder.append('\"'+phone2+'\"');
		builder.append(", \"phone3\":");
		builder.append('\"'+phone3+'\"');
		builder.append(", \"createTime\":\"");
		builder.append(createTime);
		builder.append("\", \"gender\":");
		builder.append('\"'+getMemberHealth().getGender().trim()+'\"');
		builder.append(", \"height\":");
		builder.append('\"'+(getMemberHealth().getHeight()-68)+'\"');
		builder.append(", \"weight\":");
		builder.append('\"'+(getMemberHealth().getWeight()-68)+'\"');
		builder.append(", \"bmi\":");
		builder.append('\"'+(getMemberHealth().getBmi()-68)+'\"');
		builder.append("}");
		return builder.toString();
	}
	

}
