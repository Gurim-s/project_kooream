package com.kooream.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.AttachFileVO;

@Mapper
public interface RntUpldFileMapper {
	public int uploadFile(AttachFileVO vo);
	public int removeFile(String fileName);
}
