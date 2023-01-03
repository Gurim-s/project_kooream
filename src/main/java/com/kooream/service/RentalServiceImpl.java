package com.kooream.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.mapper.RentalMapper;
import com.koorema.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RentalServiceImpl implements RentalService{
	@Setter(onMethod_= @Autowired)
	private RentalMapper mapper;

	@Override
	public int addRntPrdt(ProductVO vo) {
		return mapper.addRntPrdt(vo);
	}
}
