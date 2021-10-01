package com.EEIT131_PFF.springboot.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Blob;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name="Product")
//@JsonIdentityInfo(generator=IntSequenceGenerator.class)//避免迴圈會自動給物件產生@id，發現重複會阻止
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "productId")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Product  implements Serializable{
	
	private static final long serialVersionUID=1L;
	
	@Id@Column(name="PRODUCTID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer productId;
	@Column(name = "PRODUCTNAME")
	private String  productName;
	@Column(name = "PRODUCTTYPE")
	private String  productType;
	@Column(name="ONSTOCK")
	private Integer onStock;
	@Column(name = "PRICE")
	private BigDecimal  price;//
	@Column(name = "REMARKS")
	private String remarks;
	@Column(name = "ONSALE")
	private String onSale;
	@JsonIgnore
	@Column(name="COVERIMAGE")
	private Blob  coverImage;
	@Column(name ="CALORIES")
	private Integer Calories;
	@Column(name = "INGREDIENTS")
	private String ingredients;

	@Transient
	private String fileDataURL;
	
	@Column(name = "IMAGENAME")
	private String  imageName;
	@Column(name="mimeType")
	private String  mimeType;
	
	
	
	@Transient@Column(name = "FK_PARTNERID")
	private Integer fk_partnerId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FK_PARTNERID")
	@JsonBackReference(value="product-partner")
	private Partner partner;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "product")
	@JsonManagedReference(value="product-productImg")
	private Set<ProductImage>  productImage = new HashSet<>();
	
//	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
//    @JoinTable(name="Bookmark", joinColumns= {@JoinColumn(name="fk_productID")}, 
//    inverseJoinColumns= {@JoinColumn(name="fk_memberID")})
//	@JsonBackReference(value="member-product")
//	private Set<Member> member = new HashSet<Member>();
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "product")
	@JsonManagedReference(value="productBookmark")
	private Set<Bookmark> bookmark = new HashSet<Bookmark>();
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "product")
//	@JsonManagedReference(value="salesOrder-product")	
	@JsonIgnore
	private Set<SalesOrder> salesOrder = new HashSet<SalesOrder>();
	
	public Product() {
		
	}
	
	
	public Product( String productName, BigDecimal price, String remarks) {
		this.productName = productName;
		this.price = price;
		this.remarks = remarks;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
	public String getProductType() {
		return productType;
	}


	public void setProductType(String productType) {
		this.productType = productType;
	}


	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
    
	
	public Integer getProductId() {
		return productId;
	}


	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	


	public Integer getOnStock() {
		return onStock;
	}


	public void setOnStock(Integer onStock) {
		this.onStock = onStock;
	}


	public String getOnSale() {
		return onSale.trim();
	}


	public void setOnSale(String onSale) {
		this.onSale = onSale;
	}


	public Integer getFk_partnerId() {
		return fk_partnerId;
	}


	public void setFk_partnerId(Integer fk_partnerId) {
		this.fk_partnerId = fk_partnerId;
	}

	public Blob getCoverImage() {
		return coverImage;
	}


	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}


	public String getFileDataURL() {
		return fileDataURL;
	}


	public void setFileDataURL(String fileDataURL) {
		this.fileDataURL = fileDataURL;
	}


	public String getImageName() {
		return imageName;
	}


	public void setImageName(String imageName) {
		this.imageName = imageName;
	}


	public String getMimeType() {
		return mimeType;
	}


	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public Partner getPartner() {
		return partner;
	}


	public void setPartner(Partner partner) {
		this.partner = partner;
	}


	public Set<ProductImage> getProductImage() {
		return productImage;
	}


	public void setProductImage(Set<ProductImage> productImage) {
		this.productImage = productImage;
	}
    


	public Set<Bookmark> getBookmark() {
		return bookmark;
	}


	public void setBookmark(Set<Bookmark> bookmark) {
		this.bookmark = bookmark;
	}


	public Set<SalesOrder> getSalesOrder() {
		return salesOrder;
	}


	public void setSalesOrder(Set<SalesOrder> salesOrder) {
		this.salesOrder = salesOrder;
	}


	public Integer getCalories() {
		return Calories;
	}


	public void setCalories(Integer calories) {
		Calories = calories;
	}


	public String getIngredients() {
		return ingredients;
	}


	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}






	
	
	
	

}
