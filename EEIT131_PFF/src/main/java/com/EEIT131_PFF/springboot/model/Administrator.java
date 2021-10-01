package com.EEIT131_PFF.springboot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Administrator")
public class Administrator {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer administratorId;
	String accountId;
	String password;

	public Administrator(Integer administratorId, String accountId, String password) {
		super();
		this.administratorId = administratorId;
		this.accountId = accountId;
		this.password = password;

	}

	public Administrator() {

	}

	@Override
	public String toString() {
		return "Activity [administratorId=" + administratorId + ", accountId=" + accountId + ", password=" + password
				+ "]";
	}

	public Integer getAdministratorId() {
		return administratorId;
	}

	public void setAdministratorId(Integer administratorId) {
		this.administratorId = administratorId;
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

}
