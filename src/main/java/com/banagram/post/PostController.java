package com.banagram.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.banagram.post.bo.PostBO;

@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;

	
}
