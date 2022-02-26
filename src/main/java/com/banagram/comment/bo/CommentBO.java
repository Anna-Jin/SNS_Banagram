package com.banagram.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.comment.dao.CommentDAO;
import com.banagram.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int writeComment(int userId, String userLoginId, int postId, String content) {
		return commentDAO.insertComment(userId, userLoginId, postId, content);
	}
	
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectCommentList(postId);
	}
}
