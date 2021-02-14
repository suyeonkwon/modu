package model;

public class LikeBook {
	private String id; 
	private int reviewNo;
	private int tripNo;
	private int type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getTripNo() {
		return tripNo;
	}
	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "LikeBook [id=" + id + ", reviewNo=" + reviewNo + ", tripNo=" + tripNo + ", planSeq=" 
				+ ", type=" + type + "]";
	}
	
	
}
