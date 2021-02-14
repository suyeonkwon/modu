package model;

import java.util.Date;

public class ReviewBoard {
	private int reviewNo;
	private int category; 
	private String id;
	private String subject;
	private String content;
	private String file;
	private String place;
	private String url;
	private String address;
	private Date regdate;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "ReviewBoard [reviewNo=" + reviewNo + ", category=" + category + ", id=" + id + ", subject=" + subject
				+ ", content=" + content + ", file=" + file + ", place=" + place + ", url=" + url + ", address="
				+ address + ", regdate=" + regdate + "]";
	}

	
	
	
	
}
