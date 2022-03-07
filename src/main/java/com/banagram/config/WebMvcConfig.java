package com.banagram.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.banagram.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	/*
	 * 웹의 이미지 주소와 실제 파일 경로를 매핑해주는 설정
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**") // http://localhost/images/appletree066_1632141241/sun.png 이런 형식으로 만든다
		// for mac
		.addResourceLocations("file:/Users/jin-yujin/Desktop/yujin/megaIT/SNS_Banagram/workspace/images/"); // 실제 파일 저장 위치
		// for window
		// .addResourceLocations("file:///D:\\진유진_java\\6_spring-project\\sns_banagram\\workspace\\images/"); // 실제 파일 저장 위치
		
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/static/**", "/error", "/user/logout", "/user/profile/edit");
	}
}
