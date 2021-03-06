package com.banagram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.banagram.comment.model.Comment;

@Repository
public interface CommentDAO {

	
	public int insertComment(
			@Param("userId") int userId, 
			@Param("postId") int postId, 
			@Param("content") String content);
	
	public List<Comment> selectCommentList(int postId);
	
	public int countCommentByPostId(int postId);
	
	public int deleteCommentByPostIdUserIdCommentId(
			@Param("userId") int userId, 
			@Param("postId") int postId,
			@Param("commentId") int commentId);
	
	// post 삭제 시 함께 삭제하기 위한 DAO
	public void deleteCommentByPostId(int postId);
}
