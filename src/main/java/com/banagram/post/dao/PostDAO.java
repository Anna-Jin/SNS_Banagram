package com.banagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.banagram.post.model.Post;

@Repository
public interface PostDAO {

	public List<Post> selectPostList();
	
	public Post selectPostById(int postId);
	
	public void insertPost(
			@Param("userId") int userId,
			@Param("userLoginId") String userLoginId,
			@Param("imagePath") String imagePath, 
			@Param("content") String content);
	
	public void deletePostByPostIdUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
}
