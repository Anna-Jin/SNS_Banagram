package com.banagram.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.banagram.comment.bo.CommentBO;
import com.banagram.common.FileManagerService;
import com.banagram.like.bo.LikeBO;
import com.banagram.post.dao.PostDAO;
import com.banagram.post.model.Post;

@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private FileManagerService fileManager;

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public List<Post> getPostListByUserId(int userId) {
		return postDAO.selectPostListByUserId(userId);
	}
	
	public int countPostByUserId(int userId) {
		return postDAO.countPostByUserId(userId);
	}
	
	public void addPost(int userId, String userLoginId, MultipartFile file, String content) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.savaFile(userLoginId, file);
		}
		
		postDAO.insertPost(userId, userLoginId, imagePath, content);
	}
	
	public void deletePostByPostIdUserId(int postId, int userId) {
		// postId로 select post -> logging에 남겨두기
		Post post = postDAO.selectPostById(postId);
		if (post == null) {
			logger.warn("[post delete] 해당 포스트가 없습니다 userId:{}, postId:{}", userId, postId);
			return;
		}
		
		// 글 삭제
		postDAO.deletePostByPostIdUserId(postId, userId);
		
		// 이미지가 있으면 이미지 삭제
		String imagePath = post.getImagePath();
		if (imagePath != null) {
			fileManager.deleteFile(imagePath);
		}
		
		// 댓글들 삭제 byPostId
		commentBO.deleteCommentByPostId(postId);
		
		// 좋아요들 삭제 byPostId
		likeBO.deleteLikeByPostId(postId);
	}
}
