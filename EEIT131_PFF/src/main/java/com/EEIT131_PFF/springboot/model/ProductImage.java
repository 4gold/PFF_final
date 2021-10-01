package com.EEIT131_PFF.springboot.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;




@Entity
@Table(name = "ProductImage")
public class ProductImage  implements Serializable {
	private static final long serialVersionUID=1L;
	
	@Id	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productImageId;

	@Transient@Column(name = "FK_PRODUCTID")
	private Integer fk_productId ;
	@Column(name="IMAGE")
	private Blob  image;
	
	@Transient
	private String fileDataURL;
	
	@Column(name = "IMAGENAME")
	private String  imageName;
	@Column(name="mimeType")
	private String  mimeType;
	
	@ManyToOne
	@JoinColumn(name="FK_PRODUCTID")
	@JsonBackReference(value="product-productImg")
	private Product product;
	
	public Integer getFk_productId() {
		return fk_productId;
	}
	public void setFk_productId(Integer fk_productId) {
		this.fk_productId = fk_productId;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
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
	public Integer getProductImageId() {
		return productImageId;
	}
	public void setProductImageId(Integer productImageId) {
		this.productImageId = productImageId;
	}
	public String getFileDataURL() {
		return fileDataURL;
	}
	public void setFileDataURL(String fileDataURL) {
		this.fileDataURL = fileDataURL;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	

}

