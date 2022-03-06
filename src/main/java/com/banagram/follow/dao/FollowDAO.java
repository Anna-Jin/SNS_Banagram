package com.banagram.follow.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowDAO {

	public boolean existFollow(
			@Param("userId") int userId,
			@Param("followUserId") int followUserId); 
	
	public int countFollow(int userId);
	
	public int countFollower(int userId);
	
	public void insertFollow(
			@Param("userId") int userId,
			@Param("followUserId") int followUserId);
	
	public void deleteFollow(
			@Param("userId") int userId,
			@Param("followUserId") int followUserId);
}
