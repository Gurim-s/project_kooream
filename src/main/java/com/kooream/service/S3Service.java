package com.kooream.service;

import org.springframework.web.multipart.MultipartFile;

public interface S3Service {
	public void init();
	public void uploadAWS(MultipartFile image, String s3Path);
	public String getFileURL(String fileName);
}
