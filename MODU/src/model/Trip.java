package model;

import java.util.Date;

public class Trip {
	private int tripNo;
	private int share;
	private String id;
	private String city;
	private String tripTitle;
	private String comment; 
	private String picture;
	private String countryCode;
	private Date startDate;
	private Date endDate;
	private Date regdate;
	private Double cityLat;
	private Double cityLng;
	
	public int getTripNo() {
		return tripNo;
	}
	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTripTitle() {
		return tripTitle;
	}
	public void setTripTitle(String tripTitle) {
		this.tripTitle = tripTitle;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Double getCityLat() {
		return cityLat;
	}
	public void setCityLat(Double cityLat) {
		this.cityLat = cityLat;
	}
	public Double getCityLng() {
		return cityLng;
	}
	public void setCityLng(Double cityLng) {
		this.cityLng = cityLng;
	}
	public int getShare() {
		return share;
	}
	public void setShare(int share) {
		this.share = share;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	@Override
	public String toString() {
		return "Trip [tripNo=" + tripNo + ", share=" + share + ", id=" + id + ", city=" + city + ", tripTitle="
				+ tripTitle + ", comment=" + comment + ", picture=" + picture + ", countryCode=" + countryCode
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", regdate=" + regdate + ", cityLat=" + cityLat
				+ ", cityLng=" + cityLng + "]";
	}

		
	
}
