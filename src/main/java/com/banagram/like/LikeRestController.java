package com.banagram.like;

import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {

	
	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(@PathVariable("postId") int postId) {
		
		return null;
	}
}
