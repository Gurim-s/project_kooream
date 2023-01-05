package com.kooream.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.AttachFileVO;


@Mapper
public interface BrandProductUploadMapper{
	public int uploadFile(AttachFileVO vo);
	public int removeFile(String getUuid);
}
