package com.banagram.comment.model;

import java.util.Date;

public class Comment {
	private int id;
	private int userId;
	private int postId;
	private String content;
	private Date creadtedAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreadtedAt() {
		return creadtedAt;
	}
	public void setCreadtedAt(Date creadtedAt) {
		this.creadtedAt = creadtedAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
	
}
