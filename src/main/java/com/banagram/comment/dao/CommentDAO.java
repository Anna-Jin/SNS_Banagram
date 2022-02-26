package com.banagram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.banagram.comment.model.Comment;

@Repository
public interface CommentDAO {

	
	public int insertComment(
			@Param("userId") int userId, 
			@Param("userLoginId") String userLoginId,
			@Param("postId") int postId, 
			@Param("content") String content);
	
	public List<Comment> selectCommentList(int postId);
}
