package com.banagram.timeline;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banagram.post.bo.PostBO;
import com.banagram.post.model.Post;
import com.banagram.timeline.model.ContentView;
import com.banagram.user.bo.UserBO;

@Controller
public class TimelineContorller {
	
	@Autowired
	private PostBO postBO;

	
	@RequestMapping("/timeline")
	public String timeline(Model model) {
		// 하나의 카드 -> contentview객체 (view용 객체)
		List<ContentView> contentList = new ArrayList<>();
		
		
		// post 내용
		List<Post> postList = postBO.getPostList();
		// 유저 id로 유저 loginId가져오기
		// List<Comment> commentList ;
		
		
		model.addAttribute("postList", postList);
		model.addAttribute("viewPath", "timeline/timeline");
		
		return "template/timeline_layout";
	}
}
