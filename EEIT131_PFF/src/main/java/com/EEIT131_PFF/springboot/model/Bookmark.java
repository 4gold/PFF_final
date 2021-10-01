package com.EEIT131_PFF.springboot.model;

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


@Entity
@Table(name = "Bookmark")
public class Bookmark {
    
	@Id @Column(name="BOOKMARKID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bookmarkId;
	
	@Transient@Column(name="FK_MEMBERID")
	private Integer fk_memberId;
	@Transient@Column(name="FK_PRODUCTID")
	private Integer fk_productId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="FK_MEMBERID")
	@JsonBackReference(value="memberBookmark")
	private Member member;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="FK_PRODUCTID")
	@JsonBackReference(value="productBookmark")
	private Product product;

	public Integer getBookmarkId() {
		return bookmarkId;
	}

	public void setBookmarkId(Integer bookmarkId) {
		this.bookmarkId = bookmarkId;
	}

	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}

	public Integer getFk_productId() {
		return fk_productId;
	}

	public void setFk_productId(Integer fk_productId) {
		this.fk_productId = fk_productId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Bookmark [bookmarkId=" + bookmarkId + ", fk_memberId=" + fk_memberId + ", fk_productId=" + fk_productId
				+ ", member=" + member + ", product=" + product + "]";
	}
	
	
}
