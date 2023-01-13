package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandAdminVO;
import com.kooream.domain.ProductVO;

public interface BrandProductService {

	public List<ProductVO> getList();
	
	public void register(ProductVO vo);
	
	public ProductVO get(ProductVO vo);		// 상세보기

	public List<AttachFileVO> getAttachList(int p_no);
	
	public int modify(ProductVO vo);
	
	public int remove(ProductVO vo);
	
	public BrandAdminVO member(ProductVO vo);	
	//	보내는 값은 product vo 
	// 리턴되는 값의 형태가 brandAdminVo vo
	

}
