package com.banagram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	

	/**
	 * 회원가입 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/signup-view")
	public String singup(Model model) {
		model.addAttribute("viewPath", "sign_up");
		return "template/registration_layout";
	}
	
	/**
	 * 로그인 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/login-view")
	public String login(Model model) {
		
		model.addAttribute("viewPath", "sign_in");
		
		return "template/registration_layout";
	}
	
	/**
	 * 로그아웃
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.removeAttribute("userLoginId");
		request.removeAttribute("userName");
		request.removeAttribute("userId");
		
		return "redirect:/user/login-view";
	}
	
	@RequestMapping("/profile/edit")
	public String update(
			Model model,
			HttpServletRequest request) {
		
		// 로그인 권한 검사
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		if (userId == null || userLoginId == null) {
			return "redirect:user/login-view";
		}
		
		
		model.addAttribute("viewPath", "user/edit_profile");
		
		return "template/timeline_layout";
	}

}
