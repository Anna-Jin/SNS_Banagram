package com.banagram.timeline;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.banagram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class TimelineRestController {

	@Autowired
	private PostBO postbo;
	
	@PostMapping("/write")
	public Map<String, Object> addPost(
			@RequestParam("file") MultipartFile file,
			@RequestParam("content") String content,
			HttpServletRequest request
			) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용가능합니다.");
			return result;
		}
		
		// db에 insert
		postbo.addPost(userId, userLoginId, file, content);
		
		return result;
	}
}
