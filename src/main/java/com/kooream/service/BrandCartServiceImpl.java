package com.kooream.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.mapper.BrandProductUploadMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
public class BrandCartServiceImpl implements BrandCartService{
	
	@Setter(onMethod_ = @Autowired )
	private BrandCartMapper cartmapper;
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductUploadMapper uploadmapper;

	
	@Override
	public int addCart(BrandCartVO vo) {
		//log.warn("serviceImpl " + vo.getP_no());
		return cartmapper.addCart(vo);
		
	}


	@Override
	public List<BrandCartVO> brandCartList(int m_no) {
		List<BrandCartVO> list = cartmapper.brandCartList(m_no);

		return list;
	}
	
}
  

	 
