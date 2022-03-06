package com.banagram.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	public boolean existLike(
			@Param("userId") int userId,
			@Param("postId") int postId
			);
	
	public int countLike(int postId);

	public void insertLike(
			@Param("userId") int userId,
			@Param("postId") int postId);
	
	public void deleteLikeByPostIdUserId(
			@Param("userId") int userId,
			@Param("postId") int postId);
	
	// post 삭제 시 함께 삭제하기 위한 DAO
	public void deleteLikeByPostId(int postId);
}
