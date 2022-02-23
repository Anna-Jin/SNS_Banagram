package com.banagram.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TimelineContorller {
	
	@RequestMapping("/timeline")
	public String timeline() {
		return "template/timeline_layout";
	}
}
