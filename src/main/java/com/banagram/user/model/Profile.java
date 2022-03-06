package com.banagram.user.model;

public class Profile {
	private User user;
	private boolean existFollow;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public boolean isExistFollow() {
		return existFollow;
	}
	public void setExistFollow(boolean existFollow) {
		this.existFollow = existFollow;
	}
	
}
