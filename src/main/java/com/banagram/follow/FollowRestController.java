package com.banagram.follow;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.banagram.follow.bo.FollowBO;

@RestController
public class FollowRestController {
	
	@Autowired
	private FollowBO followBO;

	
	/**
	 * 팔로우 추가/삭제
	 * @param followUserId
	 * @param request
	 * @return
	 */
	@RequestMapping("/follow")
	public Map<String, Object> follow(
			@RequestParam("followUserId") int followUserId, // 팔로우 당하는 userId
			HttpServletRequest request
			) {
		
				Map<String, Object> result = new HashMap<>();

				HttpSession session = request.getSession();
				Integer userId = (Integer) session.getAttribute("userId");

				if (userId == null) {
					result.put("result", "error");
					result.put("errorMessage", "로그인 후 사용가능합니다.");
					return result;
				}

				boolean exist = followBO.existFollow(userId, followUserId);

				if (exist) {
					// 팔로우가 눌러져있을 때 -> followUserId와 매칭되는 userId 삭제
					followBO.deleteFollow(userId, followUserId);
				} else {
					// 팔로우가 눌러져있지 않을 때 -> followUserId와 userId insert
					followBO.addFollow(userId, followUserId);
				}

				result.put("result", "success");

				return result;
	}
}
