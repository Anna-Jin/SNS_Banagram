package com.banagram.timeline.model;

import java.util.List;

import com.banagram.comment.model.Comment;
import com.banagram.post.model.Post;

// 타임라인 카드 하나
public class ContentView {
	private Post post;
	private List<Comment> commentList;
	// private List<Like> likeList;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
}
