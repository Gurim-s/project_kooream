package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;

public interface BrandProductService {

	public List<ProductVO> getList();
	
	public void register(ProductVO vo);
	
	public ProductVO get(int p_no);

	public List<AttachFileVO> getAttachList(int p_no);
	
}
