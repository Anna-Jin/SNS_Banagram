package com.banagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.banagram.post.model.Post;

@Repository
public interface PostDAO {

	public List<Post> selectPostList();
	
	public void insertPost(
			@Param("userId") int userId, 
			@Param("imagePath") String imagePath, 
			@Param("content") String content);
}
