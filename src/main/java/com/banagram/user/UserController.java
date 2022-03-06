package com.banagram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banagram.user.bo.UserBO;
import com.banagram.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;

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
	
	/**
	 * 로그아웃
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request) {
		request.removeAttribute("userLoginId");
		request.removeAttribute("userName");
		request.removeAttribute("userId");
		
		return "redirect:/user/login-view";
	}
	
	@RequestMapping("/profile/{id}")
	public String profile(
			@PathVariable("id") int id,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		if (userId == null || userLoginId == null) {
			return "redirect:user/login-view";
		}
		
		User user = userBO.getUserByUserId(id);
		
		model.addAttribute("user", user);
		model.addAttribute("viewPath", "user/profile");
		
		return "template/timeline_layout";
	}
}
