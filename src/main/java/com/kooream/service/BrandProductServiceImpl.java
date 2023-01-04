package com.kooream.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kooream.domain.BrandProductVO;
import com.kooream.mapper.BrandProductMapper;


import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
  public class BrandProductServiceImpl implements BrandProductService{
  
  @Setter(onMethod_ = @Autowired ) 
  private BrandProductMapper mapper;
  
  
  @Override 
  public void register(BrandProductVO vo) { 
	  mapper.insert(vo);
  
  
  }
  
  
  }
 
