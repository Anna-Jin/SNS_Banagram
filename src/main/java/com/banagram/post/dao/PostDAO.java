package com.banagram.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.banagram.post.model.Post;

@Repository
public interface PostDAO {

	public List<Post> selectPostList();
}
