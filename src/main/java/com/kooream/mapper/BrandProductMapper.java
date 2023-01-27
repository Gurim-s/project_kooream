package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.BrandAdminVO;
import com.kooream.domain.ProductVO;

public interface BrandProductMapper {
	
	public void insert(ProductVO board);	// 제품 insert

	public List<ProductVO> getList(ProductVO vo2);		// 상품리스트 보여주기

	public int getPno();

	public ProductVO read(ProductVO vo);	// 상세페이지 보기
	
	public int update(ProductVO vo);		// 제품 수정

	public int remove(ProductVO vo);		// 제품 삭제
	
	public BrandAdminVO member(ProductVO vo);	// get페이지에서 BrandAdminVO 가지고 오기위해 사용

	
	

	


}
