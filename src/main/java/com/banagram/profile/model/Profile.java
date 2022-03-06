package com.banagram.profile.model;

import java.util.List;

import com.banagram.post.model.Post;
import com.banagram.user.model.User;

public class Profile {
	private User user;
	private boolean existFollow;
	private List<Post> postList;
	private int countPost;
	private int countFollow; // 팔로우 한 사람 = userId의 개수
	private int countFollower; // 팔로워 ex) 현재 프로필 화면이 userId=1일 때, 팔로워 수는 followUserId가 1인 개수
	
	public List<Post> getPostList() {
		return postList;
	}
	public void setPostList(List<Post> postList) {
		this.postList = postList;
	}
	public int getCountPost() {
		return countPost;
	}
	public void setCountPost(int countPost) {
		this.countPost = countPost;
	}
	public int getCountFollower() {
		return countFollower;
	}
	public void setCountFollower(int countFollower) {
		this.countFollower = countFollower;
	}
	public int getCountFollow() {
		return countFollow;
	}
	public void setCountFollow(int countFollow) {
		this.countFollow = countFollow;
	}
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
