package com.banagram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.banagram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	// 꼭 slf4j로 import!
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	/**
	 * 글 쓰기
	 * @param file
	 * @param content
	 * @param request
	 * @return
	 */
	@PostMapping("/write")
	public Map<String, Object> write(
			@RequestParam("file") MultipartFile file,
			@RequestParam("content") String content,
			HttpServletRequest request
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용가능합니다.");
			return result;
		}
		
		// db에 insert
		postBO.addPost(userId, userLoginId, file, content);
		result.put("result", "success");
		
		return result;
	}
	
	/**
	 * 글 삭제
	 * @param postId
	 * @param request
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId,
			HttpServletRequest request
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 해주세요.");
			logger.error("[post delete] 로그인 세션이 없습니다. userId:{}, postId:{}", userId, postId);
			return result;
		}
		
		postBO.deletePostByPostIdUserId(postId, userId);
		result.put("result", "success");
		
		return result;
	}
}
