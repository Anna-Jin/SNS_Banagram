package com.banagram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.banagram.post.bo.PostBO;
import com.banagram.post.model.Post;

@RestController
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	@RequestMapping("/posts")
	public List<Post> posts() {
		
		return postBO.getPostList();
	}
}
