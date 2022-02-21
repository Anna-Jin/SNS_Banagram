package com.banagram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.banagram.common.EncryptUtils;
import com.banagram.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/duplicate-email")
	public Map<String, Object> isDuplicatedEmail(
			@RequestParam("email") String email
			) {
		
		
		Map<String, Object> result = new HashMap<>();
		boolean existEmail = userBO.existEmail(email);
		result.put("result", existEmail);
		
		return result;
	}
	
	@RequestMapping("/duplicate-loginId")
	public Map<String, Object> isDuplicatedLoginId(
			@RequestParam("loginId") String loginId
			) {
		
		
		Map<String, Object> result = new HashMap<>();
		boolean existLoginId = userBO.existLoginId(loginId);
		result.put("result", existLoginId);
		
		return result;
	}
	
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
}
