package com.banagram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banagram.profile.bo.ProfileBO;
import com.banagram.profile.model.Profile;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private ProfileBO profileBO;
	

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
		HttpSession session = request.getSession();
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		
		return "redirect:/user/login-view";
	}
	
	/**
	 * 글 수정 화면
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/profile/edit")
	public String update(
			Model model,
			HttpServletRequest request) {
		
		// 로그인 권한 검사
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		Profile profile = profileBO.generateProfileList(userId);
		
		model.addAttribute("profile", profile);
		model.addAttribute("viewPath", "user/edit_profile");
		
		return "template/timeline_layout";
	}

}
