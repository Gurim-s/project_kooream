package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.kooream.domain.ProductVO;
import com.kooream.mapper.BrandProductMapper;
import com.kooream.mapper.BrandProductUploadMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
  public class BrandProductServiceImpl implements BrandProductService{
  
  @Setter(onMethod_ = @Autowired ) 
  private BrandProductMapper mapper;
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductUploadMapper uploadmapper;

  
  
  @Override 
  public void register(ProductVO vo) { 
	  mapper.insert(vo);
		/*
		 * int b_no = mapper.getBno();
		 * 
		 * if(vo.getAttachList() = !null && vo.getAttachList(). size()>0) {
		 * for(ProductVO vo2 : vo.getAttachList()) { vo2.setB_no(b_no);
		 * uploadmapper.insert(vo2); } }
		 *ddddd/
  
  }


@Override
public List<ProductVO> getList() {
	return mapper.getList();
}
  
  
  }
 
