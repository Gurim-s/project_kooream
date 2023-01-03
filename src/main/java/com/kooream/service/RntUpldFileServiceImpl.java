package com.kooream.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.mapper.RntUpldFileMapper;
import com.koorema.domain.AttachFileVO;

import lombok.Setter;

@Service
public class RntUpldFileServiceImpl implements RntUpldFileService{
	
	@Setter(onMethod_= @Autowired)
	private RntUpldFileMapper mapper;
	
	@Override
	public int uploadFile(AttachFileVO vo) {
		return mapper.uploadFile(vo);
	}

	@Override
	public int removeFile(String fileName) {
		return mapper.removeFile(fileName);
	}

}
