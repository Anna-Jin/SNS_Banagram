package com.banagram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.comment.bo.CommentBO;
import com.banagram.comment.model.Comment;
import com.banagram.post.bo.PostBO;
import com.banagram.post.model.Post;
import com.banagram.timeline.model.ContentView;

@Service
public class ContentBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
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
			ContentView contentView = new ContentView();
			// ContentView 모델에 포스트 집어넣기
			contentView.setPost(post);
			
			// ContentView 모델에 댓글 집어넣기
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			contentView.setCommentList(commentList);
			
			contentList.add(contentView);
		}
		
		return contentList;
	}
}
