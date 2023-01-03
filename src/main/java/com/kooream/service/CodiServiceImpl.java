package com.kooream.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kooream.mapper.CodiMapper;
import com.koorema.domain.CodiVO;

import lombok.Setter;

public class CodiServiceImpl implements CodiService{
	
	@Setter(onMethod_ = @Autowired)
	private CodiMapper mapper;
	
	
	
	

	@Override
	public void register(CodiVO vo) {
		
		// 1. 게시글 등록
		mapper.insert(vo);
		
	}
	
	
	
	
	
	@Override
	public CodiVO get(int codi_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean modify(CodiVO vo) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean remove(int codi_no) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
