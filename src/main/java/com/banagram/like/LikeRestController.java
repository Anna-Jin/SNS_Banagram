package com.banagram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.banagram.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;

	
	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
}
