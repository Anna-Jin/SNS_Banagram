package com.banagram.like.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public void insertLikeByPostId(int userId, int postId);
}
