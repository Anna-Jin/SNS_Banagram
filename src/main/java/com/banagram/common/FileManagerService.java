package com.banagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component // 스프링 빈
public class FileManagerService {
	
	// for mac
	public final static String FILE_UPLOAD_PATH = "/Users/jin-yujin/Desktop/yujin/megaIT/SNS_Banagram/workspace/images/";
	// for window
	// public final static String FILE_UPLOAD_PATH = "D:\\진유진_java\\6_spring-project\\sns_banagram\\workspace\\images/";
	
	public String savaFile(String userLoginId, MultipartFile file) {
		// 파일 디렉토리 경로 예: appletree066_1232141241/sun.png
		// 파일명이 겹치지 않게하기 위해서 현재 시간을 경로에 붙여준다.
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 디렉토리 생성
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			return null; // 디렉토리 생성 시 실패하면 null을 리턴
		}
		
		// 파일 업로드: byte 단위로 업로드한다.
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename()); // getOriginalFilename()는 input에 올린 파일명이다. (한글이면 안됨)
			Files.write(path, bytes);
			
			// 이미지 URL을 리턴한다 (WebMvcConfig에서 매핑한 이미지 path)
			// ex) http://localhost/images/appletree066_1632141241/sun.png 이런 형식으로 리턴한다
			return "/images/" + directoryName + file.getOriginalFilename();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
