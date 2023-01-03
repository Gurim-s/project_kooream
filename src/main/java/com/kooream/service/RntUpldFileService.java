package com.kooream.service;

import com.koorema.domain.AttachFileVO;

public interface RntUpldFileService {
	public int uploadFile(AttachFileVO vo);
	public int removeFile(String fileName);
}
