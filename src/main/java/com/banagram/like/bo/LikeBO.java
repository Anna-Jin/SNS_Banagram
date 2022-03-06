package com.banagram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public boolean existLike(int userId, int postId) {
		return likeDAO.existLike(userId, postId);
	}
	
	public int countLike(int postId) {
		return likeDAO.countLike(postId);
	}
	
	public void addLike(int userId, int postId) {
		likeDAO.insertLike(userId, postId);
	}
	
	// 좋아요 취소
	public void deleteLikeByPostIdUserId(int userId, int postId) {
		likeDAO.deleteLikeByPostIdUserId(userId, postId);
	}
	
	// post 삭제 시 함께 삭제하기 위한 BO
	public void deleteLikeByPostId(int postId) {
		likeDAO.deleteLikeByPostId(postId);
	}
}
