package com.banagram.timeline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banagram.timeline.bo.ContentBO;
import com.banagram.timeline.model.ContentView;
import com.banagram.user.bo.UserBO;
import com.banagram.user.model.User;

@Controller
public class TimelineContorller {
	
	@Autowired
	private ContentBO contentBO;
	
	@Autowired
	private UserBO userBO;

	
	@RequestMapping("/timeline")
	public String timeline(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		// 하나의 카드 -> contentView객체 (view용 객체)
		List<ContentView> contentList = contentBO.generateContentViewList(userId);
		User user = userBO.getUserByUserId(userId);
		
		
		model.addAttribute("user", user);
		model.addAttribute("contentList", contentList);
		model.addAttribute("viewPath", "timeline/timeline");
		
		return "template/timeline_layout";
	}
}
