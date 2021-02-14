package model;

import java.util.Date;

public class Comment {
	private int commentNo;
	private int reviewNo;
	private String comment;
	private String id;
	private Date regdate;
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", reviewNo=" + reviewNo + ", comment=" + comment + ", id=" + id
				+ ", regdate=" + regdate + "]";
	}
	
}
