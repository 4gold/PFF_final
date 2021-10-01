package com.EEIT131_PFF.springboot.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Activity")
public class Activity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer activityId;
	String discount;
	String title;
	String content;
	
	@Transient
	private String fileDataURL;
	
	Blob coverImage;
	
	String imageName;
	String mimeType;
	
	public Activity(Integer activityId, String discount, String title, String content) {
		super();
		this.activityId = activityId;
		this.discount = discount;
		this.title = title;
		this.content = content;
	}
	public Activity() {

	}

	@Override
	public String toString() {
		return "Activity [activityId=" + activityId + ", discount=" + discount + ", title=" + title + ", content="
				+ content + "]";
	}

	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
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
