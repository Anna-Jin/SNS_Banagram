package com.banagram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용가능합니다.");
			return result;
		}
		
		boolean exist = likeBO.existLike(userId, postId);
		
		if (exist) {
			// 좋아요가 눌러져있을 때 -> postId와 매칭되는 userId 삭제
		} else {
			// 좋아요가 눌러져있지 않을 때 -> postId와 userId insert
		}
		
		
		
		result.put("result", "success");
		
		return result;
	}
}
