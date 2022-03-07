package com.banagram.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException
			{
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String uri = request.getRequestURI();
		
		if (userId != null && uri.startsWith("/user")) {
			// 로그인이 된 상태에서 로그인 or 회원가입 페이지 접근
			response.sendRedirect("/timeline");
			return false;
		} else if (userId == null && uri.startsWith("/timeline")) {
			// 로그인이 안된 상태에서 타임라인 페이지 접근
			response.sendRedirect("/user/login-view");
			return false;
		}
		
		logger.warn("######### preHandle 호출, uri:{}", uri);
		
		return true;
	}
}
