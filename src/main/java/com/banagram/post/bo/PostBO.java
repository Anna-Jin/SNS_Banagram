package com.banagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.banagram.common.FileManagerService;
import com.banagram.post.dao.PostDAO;
import com.banagram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManager;

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public void addPost(int userId, String userLoginId, MultipartFile file, String content) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.savaFile(userLoginId, file);
		}
		
		postDAO.insertPost(userId, userLoginId, imagePath, content);
	}
}
