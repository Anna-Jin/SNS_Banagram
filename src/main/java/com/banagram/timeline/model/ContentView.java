package com.banagram.timeline.model;

import java.util.List;

import com.banagram.comment.model.CommentView;
import com.banagram.post.model.Post;
import com.banagram.user.model.User;

// 타임라인 카드 하나
public class ContentView {
	private Post post;
	private List<CommentView> commentList;
	private User user;
	private boolean existLike; // 내가 좋아요를 눌렀는 지에 대한 여부
	private int countLike;
	private int countComment;
	
	public int getCountComment() {
		return countComment;
	}
	public void setCountComment(int countComment) {
		this.countComment = countComment;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<CommentView> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentView> commentList) {
		this.commentList = commentList;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public boolean isExistLike() {
		return existLike;
	}
	public void setExistLike(boolean existLike) {
		this.existLike = existLike;
	}
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	
	
}
