package com.kooream.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.ProductVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.mapper.BrandProductMapper;
import com.kooream.mapper.BrandProductUploadMapper;
import com.kooream.mapper.BrandSelectMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
public class BrandSelectServiceImpl implements BrandSelectService{
	
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductUploadMapper uploadmapper;
	
	@Setter(onMethod_ = @Autowired )
	private BrandSelectMapper selectmapper;


	// 카테고리 불러오기
	@Override
	public List<ProductVO> getList(ProductVO vo2) {
		List<ProductVO> list = selectmapper.getList(vo2);
		log.info(vo2 + "서비스임플~");
		log.info(list + "서비스 임플 리스트~");
		
		// 상품테이블 + 상품이미지 합쳐서 불러오기
		for (ProductVO vo : list) {
			List<AttachFileVO> attach = uploadmapper.findByPno(vo.getP_no());	// 
			vo.setAttachList(attach);
		}
		return list;
	}

	@Override
	public List<AttachFileVO> getAttachList(int p_no) {
		
		
		return uploadmapper.findByPno(p_no);
	}

	// 금액 불러오기
	@Override
	public List<ProductVO> getListprice(ProductVO vo3) {
		List<ProductVO> list2 = selectmapper.getListprice(vo3);
		
		for (ProductVO vo : list2) {
			List<AttachFileVO> attach = uploadmapper.findByPno(vo.getP_no());	// 
			vo.setAttachList(attach);
		}
		return list2;
	
	}
}

  

	 
