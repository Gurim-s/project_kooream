package com.kooream.service;



import com.kooream.domain.AttachFileVO;


public interface BrandProductUploadService {
	
	public int uploadFile(AttachFileVO vo);
	public int removeFile(String getUuid);



}
