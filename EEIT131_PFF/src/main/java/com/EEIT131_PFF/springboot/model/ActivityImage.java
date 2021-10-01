package com.EEIT131_PFF.springboot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

//@Entity
//@Table(name = "ActivityImage")
public class ActivityImage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer fk_activityId;
	String image;
	String imageName;
	String mimeType;
	
	@Transient
	String fileDataURL;
	
	public ActivityImage(Integer fk_activityId, String image, String imageName, String mimeType) {
		super();
		this.fk_activityId = fk_activityId;
		this.image = image;
		this.imageName = imageName;
		this.mimeType = mimeType;
	}

	public Integer getFk_activityId() {
		return fk_activityId;
	}

	public void setFk_activityId(Integer fk_activityId) {
		this.fk_activityId = fk_activityId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
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

	public String getFileDataURL() {
		return fileDataURL;
	}

	public void setFileDataURL(String fileDataURL) {
		this.fileDataURL = fileDataURL;
	}

	

	

}
