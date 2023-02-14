package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandAdminVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.ProductVO;
import com.kooream.domain.SizeVO;

public interface BrandProductService {

	public List<ProductVO> getList(ProductVO vo2);
	
	public void register(ProductVO vo);
	
	public ProductVO get(ProductVO vo);		// 결제페이지에서 섬네일 조회
	
	public ProductVO getDetail(ProductVO vo); // 상세 상품 페이지

	public List<AttachFileVO> getAttachList(int p_no);
	
	public List<SizeVO> getAttachSize(int p_no);	// p_no에 맞춰서 SizeVo 리스트 가지고오기
		
	
	public int modify(ProductVO vo);
	
	public int remove(ProductVO vo);
	
	public BrandAdminVO member(ProductVO vo);	
	
	//	보내는 값은 product vo 
	// 리턴되는 값의 형태가 brandAdminVo vo
	
	List<ProductVO> getpList(Criteria cri);

}
