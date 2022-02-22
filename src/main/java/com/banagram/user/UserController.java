package com.banagram.user;

import javax.servlet.http.HttpServletRequest;

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
	public String singUp(Model model) {
		model.addAttribute("viewPath", "sign_up");
		return "template/registration_layout";
	}
	
	/**
	 * 로그인 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/login-view")
	public String logIn(Model model) {
		
		model.addAttribute("viewPath", "sign_in");
		
		return "template/registration_layout";
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request) {
		request.removeAttribute("userLoginId");
		request.removeAttribute("userName");
		request.removeAttribute("userId");
		
		return "redirect:/user/singin-view";
	}
}
