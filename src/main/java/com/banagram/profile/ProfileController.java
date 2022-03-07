package com.banagram.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banagram.profile.bo.ProfileBO;
import com.banagram.profile.model.Profile;

@Controller
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO;
	
	/**
	 * 프로필 화면
	 * @param currentId
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/profile/{currentId}")
	public String profile(
			@PathVariable("currentId") int currentId,
			Model model) {
		
		// profileBO 불러오기
		Profile profile = profileBO.generateProfileList(currentId);
		
		model.addAttribute("profile", profile);
		model.addAttribute("viewPath", "user/profile");
		
		return "template/timeline_layout";
	}
}
