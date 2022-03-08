package com.banagram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.banagram.user.model.User;

@Repository
public interface UserDAO {

	
	public boolean existEmail(String email);
	
	public boolean existLoginId(String loginId);
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId
			,@Param("password") String password);
	
	public User selectUserByUserId(int id);
	
	public int insertUser(
			@Param("email") String email,
			@Param("name") String name,
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	public int updateUser(
			@Param("id") int id,
			@Param("email") String email, 
			@Param("name") String name, 
			@Param("loginId") String loginId, 
			@Param("imagePath") String imagePath, 
			@Param("introduce") String introduce);
}