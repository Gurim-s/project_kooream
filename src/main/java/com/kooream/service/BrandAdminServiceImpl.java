package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.BrandAdminVO;
import com.kooream.mapper.BrandAdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
  public class BrandAdminServiceImpl implements BrandAdminService{
	
//	@Setter(onMethod_ = @Autowired )
//	private BrandAdminMapper mapper;

//	@Override
//	public List<BrandAdminVO> brandgetList() {
//		List<BrandAdminVO> list = mapper.brandgetList();
//		return list;
//	}

//	@Override
//	public BrandAdminVO get(BrandAdminVO vo) {
//		return mapper.read(vo);
//	}
}

 
