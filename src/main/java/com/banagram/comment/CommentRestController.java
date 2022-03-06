package com.banagram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.banagram.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/write")
	public Map<String, Object> write(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpServletRequest request
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 시에만 댓글작성 가능하게 하기
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		if (userId == null || userLoginId == null) {
			result.put("result", "error");
			result.put("errorMessage", "[댓글쓰기] 로그인 세션이 없습니다.");
			return result;
		}
		
		// insert DB
		int row = commentBO.writeComment(userId, postId, content);
		if (row > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("errorMessage", "[댓글쓰기] 댓글쓰기 중 실패하였습니다.");
		}
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId,
			@RequestParam("commentId") int commentId,
			HttpServletRequest request
			) {
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		int row = commentBO.deleteCommentByPostIdUserIdCommentId(userId, postId, commentId);
		if (row > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("errorMessage", "[댓글삭제] 댓글삭제가 실패하였습니다.");
		}
		
		return result;
	}

}
