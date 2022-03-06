package com.banagram.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.comment.dao.CommentDAO;
import com.banagram.comment.model.Comment;
import com.banagram.comment.model.CommentView;
import com.banagram.user.bo.UserBO;
import com.banagram.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	// 남의 DAO를 부르지 않는다. 남의 BO를 부른다.
	@Autowired
	private UserBO userBO;
	
	public int writeComment(int userId, int postId, String content) {
		return commentDAO.insertComment(userId, postId, content);
	}
	
	public List<CommentView> genterateCommentListByPostId(int postId) {
		List<CommentView> resultList = new ArrayList<>();
		List<Comment> commentList = commentDAO.selectCommentList(postId);
		
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			
			// 댓글
			commentView.setComment(comment);
			
			// 댓글쓴이
			User user = userBO.getUserByUserId(comment.getUserId());
			commentView.setUser(user);
			
			resultList.add(commentView);
		}
		return resultList;
	}
	
	public int deleteCommentByPostIdUserIdCommentId(int userId, int postId, int commentId) {
		return commentDAO.deleteCommentByPostIdUserIdCommentId(userId, postId, commentId);
	}
	
	// post 삭제 시 함께 삭제하기 위한 BO
	public void deleteCommentByPostId(int postId) {
		commentDAO.deleteCommentByPostId(postId);
	}
}
