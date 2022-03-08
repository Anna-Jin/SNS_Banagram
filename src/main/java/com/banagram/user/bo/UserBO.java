package com.banagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.banagram.common.FileManagerService;
import com.banagram.user.dao.UserDAO;
import com.banagram.user.model.User;

@Service
public class UserBO {
	
	@Autowired FileManagerService fileManager;
	
	@Autowired
	private UserDAO userDAO;
	
	
	public boolean existEmail(String email) {
		return userDAO.existEmail(email);
	}
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	public User getUserByUserId(int id) {
		return userDAO.selectUserByUserId(id);
	}
	
	public int addUser(String email, String name, String loginId, String password) {
		return userDAO.insertUser(email, name, loginId, password);
	}
	
	public int updateUser(Integer userId, String userLoginId, String email, String name, String loginId, MultipartFile file, String introduce) {
		// user의 현재 프로필 사진을 가져온다
		String userProfileImageUrl = getUserByUserId(userId).getProfileImageUrl();
		
		String imagePath = null;
		// file이 null이면 수정하지 않는다
		if (file != null) {
			imagePath = fileManager.savaFile(userLoginId, file);
			
			// 새로운 이미지 업로드가 성공하면 기존 이미지 삭제 (기존 이미지가 있을 때만)
			if (userProfileImageUrl != null && imagePath != null) {
				fileManager.deleteFile(userProfileImageUrl);
			}
		}
		
		// DB update
		return userDAO.updateUser(userId, email, name, loginId, imagePath, introduce);
	}
	
	
}
