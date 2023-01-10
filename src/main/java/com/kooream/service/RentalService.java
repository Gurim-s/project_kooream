package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.RentalMenuVO;

public interface RentalService {
	public int addRntPrdt(ProductVO vo);
	public List<ProductVO> getList(RentalMenuVO vo);
	public List<AttachFileVO> getViewImg(ProductVO vo);
	public ProductVO viewPrdt(ProductVO vo);
	public List<AttachFileVO> getFile(ProductVO vo);
	public int updateRntPrdt(ProductVO vo);
	public int removeRntPrdt(ProductVO vo);
}
