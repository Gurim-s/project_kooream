package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kooream.domain.BrandCartVO;
import com.kooream.mapper.BrandCartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
public class BrandCartServiceImpl implements BrandCartService{
	
	@Setter(onMethod_ = @Autowired )
	private BrandCartMapper cartmapper;

	
	@Override
	public int addCart(BrandCartVO vo) {
		return cartmapper.addCart(vo);
		
	}
	
}
  

	 
