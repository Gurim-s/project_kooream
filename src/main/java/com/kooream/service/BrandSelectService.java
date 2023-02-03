package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.ProductVO;

public interface BrandSelectService {
	
	public List<ProductVO> getList(ProductVO vo2);
	
	public List<AttachFileVO> getAttachList(int p_no);

	public List<ProductVO> getListprice(ProductVO vo3);
		
}





