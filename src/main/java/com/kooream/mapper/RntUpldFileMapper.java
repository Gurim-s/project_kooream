package com.kooream.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;

@Mapper
public interface RntUpldFileMapper {
	public int uploadFile(AttachFileVO vo);
	public int removeFile(String getUuid);
	public int updtPno(Map<String, Object> mMap);
	public int removePrdtFile(ProductVO vo);
	
}
