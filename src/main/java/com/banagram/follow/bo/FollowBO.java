package com.banagram.follow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.follow.dao.FollowDAO;

@Service
public class FollowBO {
	
	@Autowired
	private FollowDAO followDAO;

	public boolean existFollow(int userId, int followUserId) {
		return followDAO.existFollow(userId, followUserId);
	}
	
	public void addFollow(int userId, int followUserId) {
		followDAO.insertFollow(userId, followUserId);
	}
	
	public void deleteFollow(int userId, int followUserId) {
		followDAO.deleteFollow(userId, followUserId);
	}
}
