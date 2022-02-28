package com.banagram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.comment.bo.CommentBO;
import com.banagram.comment.model.CommentView;
import com.banagram.post.bo.PostBO;
import com.banagram.post.model.Post;
import com.banagram.timeline.model.ContentView;
import com.banagram.user.bo.UserBO;
import com.banagram.user.model.User;

@Service
public class ContentBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private UserBO userBO;
//	
//	@Autowired
//	private LikeBO likeBO;
	
	// 로그인 되지 않아도 타임라인은 볼 수 있으므로 userId는 Integer
	public List<ContentView> generateContentViewList() {
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
			List<CommentView> commentList = commentBO.genterateCommentListByPostId(post.getId());
			content.setCommentList(commentList);
			
			// ContentView 모델에 프로필사진 집어넣기
			User user = userBO.getUserByUserId(post.getUserId());
			content.setUser(user);
			
			contentList.add(content);
		}
		
		return contentList;
	}
}
