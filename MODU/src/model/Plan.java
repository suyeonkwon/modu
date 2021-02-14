package model;

import java.util.Date;

public class Plan {
	private int tripNo;
	private int planSeq;
	private double lat;
	private double lng;
	private String id;
	private String memo;
	private String place;
	private String planTime;
	private Date planDate;
	
	public int getTripNo() {
		return tripNo;
	}
	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}
	public int getPlanSeq() {
		return planSeq;
	}
	public void setPlanSeq(int planSeq) {
		this.planSeq = planSeq;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Date getPlanDate() {
		return planDate;
	}
	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}
	public String getPlanTime() {
		return planTime;
	}
	public void setPlanTime(String planTime) {
		this.planTime = planTime;
	}
	
	@Override
	public String toString() {
		return "Plan [tripNo=" + tripNo + ", planSeq=" + planSeq + ", lat=" + lat + ", lng=" + lng + ", id=" + id
				+ ", memo=" + memo + ", place=" + place + ", planTime=" + planTime + ", planDate=" + planDate + "]";
	}
	
	
	
}
