package com.banagram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	/*
	 * 웹의 이미지 주소와 실제 파일 경로를 매핑해주는 설정
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**") // http://localhost/images/appletree066_1632141241/sun.png 이런 형식으로 만든다
		.addResourceLocations("file:/Users/jin-yujin/Desktop/yujin/megaIT/SNS_Banagram/workspace/images/"); // 실제 파일 저장 위치
	}
}
