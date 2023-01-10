package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.AttachFileVO;
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

  
  @Transactional
  @Override 
  public void register(ProductVO vo) { 
	  mapper.insert(vo);
		
		  int p_no = mapper.getPno();
		  
		  if(vo.getAttachList() != null && vo.getAttachList(). size()>0) {
			  for(AttachFileVO vo2 : vo.getAttachList()) { 
				  vo2.setP_no(p_no);
				  uploadmapper.uploadFile(vo2); 
				  } 
			  }
		 
  
  }
  


@Override
public List<ProductVO> getList() {
	List<ProductVO> list = mapper.getList();
	
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



@Override
public ProductVO get(ProductVO vo) {

	return mapper.read(vo);
}
  
  
  }
 
