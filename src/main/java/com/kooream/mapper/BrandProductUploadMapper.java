package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.AttachFileVO;


@Mapper
public interface BrandProductUploadMapper{

	public int uploadFile(AttachFileVO vo);		// 파일 업로드
	
	public int removeFile(String getUuid);		// 파일 삭제
	
	public List<AttachFileVO> findByPno(int p_no);	// 
}
