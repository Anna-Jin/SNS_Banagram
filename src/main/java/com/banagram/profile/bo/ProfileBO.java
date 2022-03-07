package com.banagram.profile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.follow.bo.FollowBO;
import com.banagram.post.bo.PostBO;
import com.banagram.profile.model.Profile;
import com.banagram.user.bo.UserBO;

@Service
public class ProfileBO {
	
	@Autowired 
	private UserBO userBO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private FollowBO followBO;

	
	public Profile generateProfileList(int currentId) {
		// 프로필 리스트 객체를 만든다.
		Profile profile = new Profile();
		
		// userList에서 currentId에 맞는 user를 가져온다.
		profile.setUser(userBO.getUserByUserId(currentId)); 
		
		// currentId에 맞는 postList를 가져온다.
		profile.setPostList(postBO.getPostListByUserId(currentId)); 
		
		// currentId에 맞는 post개수를 가져온다.
		profile.setCountPost(postBO.countPostByUserId(currentId));
		
		// currentId에 맞는 팔로우 개수를 가져온다.
		profile.setCountFollow(followBO.countFollow(currentId)); 
		
		// currentId에 맞는 팔로워 개수를 가져온다.
		profile.setCountFollower(followBO.countFollower(currentId));

		
		// profileList에 add한다.
		
		return profile;
	}
}
