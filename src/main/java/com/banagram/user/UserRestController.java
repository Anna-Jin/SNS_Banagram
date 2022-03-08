package com.banagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.banagram.common.EncryptUtils;
import com.banagram.user.bo.UserBO;
import com.banagram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserBO userBO;
	
	/**
	 * 이메일 중복확인
	 * @param email
	 * @return
	 */
	@RequestMapping("/duplicate-email")
	public Map<String, Object> isDuplicatedEmail(
			@RequestParam("email") String email
			) {
		
		
		Map<String, Object> result = new HashMap<>();
		boolean existEmail = userBO.existEmail(email);
		result.put("result", existEmail);
		
		return result;
	}
	
	
	/**
	 * 아이디 중복확인 (사용자 이름)
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/duplicate-loginId")
	public Map<String, Object> isDuplicatedLoginId(
			@RequestParam("loginId") String loginId
			) {
		
		
		Map<String, Object> result = new HashMap<>();
		boolean existLoginId = userBO.existLoginId(loginId);
		result.put("result", existLoginId);
		
		return result;
	}
	
	/**
	 * 회원가입
	 * @param email
	 * @param name
	 * @param loginId
	 * @param password
	 * @return
	 */
	@PostMapping("/signup")
	public Map<String, Object> signup(
			@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password
			) {
		
		// 비밀번호 암호화
		String encryptedPassword = EncryptUtils.md5(password);
		
		// DB insert
		int row = userBO.addUser(email, name, loginId, encryptedPassword);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (row < 1) {
			result.put("result", "false");
		}
		
		return result;
	}
	
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 */
	@PostMapping("/login")
	public Map<String, Object> login(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		// 비밀번호 암호화
		String encryptedPassword = EncryptUtils.md5(password);
		
		// DB에서 아이디와 비번으로 셀렉트
		User user = userBO.getUserByLoginIdPassword(loginId, encryptedPassword);
		
		// 결과 JSON리턴
		Map<String, Object> result = new HashMap<>();
		
		if (user != null) {
			// session에 로그인 정보 저장 (로그인 상태 유지)
			HttpSession session = request.getSession();
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userId", user.getId());
			
			result.put("result", "success");
		} else {
			result.put("errorMessage", "존재하지 않는 사용자입니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	
	@PostMapping("/update")
	public Map<String, Object> update(
			@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "introduce", required = false) String introduce,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// userBO.update호출
		int row = userBO.updateUser(userId, userLoginId, email, name, loginId, file, introduce);
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "프로필 수정에 실패했습니다.");
		}
		
		logger.error("[profile update] 프로필 업데이트");
		
		return result;
	}
}
