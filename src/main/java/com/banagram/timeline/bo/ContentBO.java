package com.banagram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.comment.bo.CommentBO;
import com.banagram.like.bo.LikeBO;
import com.banagram.post.bo.PostBO;
import com.banagram.post.model.Post;
import com.banagram.timeline.model.ContentView;
import com.banagram.user.bo.UserBO;

@Service
public class ContentBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public List<ContentView> generateContentViewList(int userId) {
		// 글 List를 가져온다. -> 반복문 돌림
		List<ContentView> contentList = new ArrayList<>();
		
		// 포스트 목록
		// content에 postList를 집어 넣는다.
		List<Post> postList = postBO.getPostList();
		for (Post post : postList) {
			ContentView content = new ContentView();
			// ContentView 모델에 포스트 집어넣기
			content.setPost(post);
			
			// ContentView 모델에 댓글 집어넣기
			content.setCommentList(commentBO.genterateCommentListByPostId(post.getId()));
			
			// ContentView 모델에 프로필사진 집어넣기
			content.setUser(userBO.getUserByUserId(post.getUserId()));
			
			// ContentView 모델에 좋아요 추가 여부 집어넣기
			content.setExistLike(likeBO.existLike(userId, post.getId()));
			
			// ContentView 모델에 좋아요 카운팅 집어넣기
			content.setCountLike(likeBO.countLike(post.getId()));
			
			// ContentView 모델에 댓글 카운팅 집어넣기
			content.setCountComment(commentBO.countCommentByPostId(post.getId()));
			
			contentList.add(content);
		}
		
		return contentList;
	}
}
