package com.banagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banagram.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean existEmail(String email) {
		return userDAO.existEmail(email);
	}
	
	public boolean existLoginId(String loginId) {
		return userDAO.existEmail(loginId);
	}
	
	public int addUser(String email, String name, String loginId, String password) {
		return userDAO.insertUser(email, name, loginId, password);
	}
}
