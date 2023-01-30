package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandAdminVO;
import com.kooream.domain.ProductVO;

public interface BidImageMapper {
	
	public int uploadFile(AttachFileVO vo);
	
	public int removeFile(String Uuid);
	
	public List<AttachFileVO> findByPno(int p_no);


}
