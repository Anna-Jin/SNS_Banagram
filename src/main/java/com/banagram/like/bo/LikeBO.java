package com.banagram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	
	public void isLikesOn(int userId, int postId) {
		likeDAO.insertLikeByPostId(userId, postId);
	}
}
