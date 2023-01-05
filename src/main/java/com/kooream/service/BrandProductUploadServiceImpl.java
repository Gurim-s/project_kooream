package com.kooream.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.AttachFileVO;

import com.kooream.mapper.BrandProductUploadMapper;

import lombok.Setter;


@Service
  public class BrandProductUploadServiceImpl implements BrandProductUploadService{
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductUploadMapper mapper;


	@Override
	public int uploadFile(AttachFileVO vo) {
		return mapper.uploadFile(vo);

	}

	@Override
	public int removeFile(String getUuid) {
		return mapper.removeFile(getUuid);
	}

  
  
  }
 
