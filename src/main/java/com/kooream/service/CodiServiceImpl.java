package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.CodiVO;
import com.kooream.mapper.CodiMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CodiServiceImpl implements CodiService{
	
	@Setter(onMethod_ = @Autowired)
	private CodiMapper mapper;
	

	@Override
	public List<CodiVO> getList() {
		
		log.info("getList.....");
		
		
		return mapper.getList();
	}
	
	@Override
	public void register(CodiVO vo) {
		
		log.info("register.............. " + vo);
		
		// 1. 게시글 등록
		mapper.insert(vo);
		
	}
	
	
	
	@Override
	public CodiVO get(int codi_no) {
		log.info("get....."+codi_no);
		return mapper.read(codi_no);
	}
	
	@Override
	public boolean modify(CodiVO vo) {
		log.info("modufy........."+ vo);
		return mapper.update(vo) == 1;
	}
	
	@Override
	public boolean remove(int codi_no) {
		log.info("remove........."+ codi_no);
		return mapper.delete(codi_no) == 1;
	}
	
	
}
