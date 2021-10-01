package com.EEIT131_PFF.springboot.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="MemberHealth")
public class MemberHealth {

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name="property", value = "member"))
	@Id @GeneratedValue(generator = "generator")
	@Column(name="FK_MEMBERID")
	Integer fk_memberId;
	
	@Column(name="GENDER")
	String gender;
	@Column(name="HEIGHT")
	Double height;
	@Column(name="WEIGHT")
	Double weight;
	@Column(name="BMI")
	Double bmi;
	
	@OneToOne
	@JoinColumn(name="FK_MEMBERID", referencedColumnName="MEMBERID")
	@JsonBackReference(value="member-health")
	Member member;
	
	public Integer getFk_userId() {
		return fk_memberId;
	}
	public void setFk_userId(Integer fk_userId) {
		this.fk_memberId = fk_userId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getBmi() {
		return bmi;
	}
	public void setBmi(Double bmi) {
		this.bmi = bmi;
	}
	
	
	public Integer getFk_memberId() {
		return fk_memberId;
	}
	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	@Override
	public String toString() {
		return "MemberHealth [fk_memberId=" + fk_memberId + ", gender=" + gender + ", height="
				+ height + ", weight=" + weight + ", bmi=" + bmi + "]";
	}
	
	
	
}
