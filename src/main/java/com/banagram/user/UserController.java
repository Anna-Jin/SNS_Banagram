package com.banagram.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/signup-view")
	public String singUp(Model model) {
		model.addAttribute("viewPath", "sign_up");
		return "template/registration_layout";
	}
	
	@RequestMapping("/login-view")
	public String singIn(Model model) {
		
		model.addAttribute("viewPath", "sign_in");
		
		return "template/registration_layout";
	}
}