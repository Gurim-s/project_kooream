package com.kooream.service;



import com.kooream.domain.AttachFileVO;


public interface BidImageUploadService {
	
	public int uploadFile(AttachFileVO vo);
	public int removeFile(String getUuid);



}
