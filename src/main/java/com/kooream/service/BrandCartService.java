package com.kooream.service;

import java.util.List;

import com.kooream.domain.BrandCartVO;

public interface BrandCartService {

	public int addCart(BrandCartVO vo);	// 장바구니 추가
	
	public List<BrandCartVO> brandCartList(int m_no);	// 장바구니 리스트 가져오기
	
	




}
