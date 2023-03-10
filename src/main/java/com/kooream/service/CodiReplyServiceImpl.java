package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.CodiReplyVO;
import com.kooream.domain.Codi_TagVO;
import com.kooream.domain.Criteria;
import com.kooream.mapper.CodiReplyMapper;
import com.kooream.mapper.Codi_TagMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CodiReplyServiceImpl implements CodiReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private CodiReplyMapper mapper;
	
	
	@Setter(onMethod_ = @Autowired)
	private Codi_TagMapper tagmapper;
	
	
	
	@Override
	public int register(CodiReplyVO vo) {
		
		log.info("register ..... " + vo);
		
		return mapper.insert(vo);
		
	}
	
	@Override
	public CodiReplyVO get(int codi_no) {
		
		log.info("get........" + codi_no);
		
		return mapper.read(codi_no);
	}
	
	@Override
	public int modify(CodiReplyVO vo) {
		
		log.info("modify.............." + vo);
		
		return mapper.update(vo);
	}

	
	@Override
	public int remove(int codi_c_no) {
		log.info("remove.............." + codi_c_no);
		
		
		return mapper.delete(codi_c_no);
	}
	
	@Override
	public List<CodiReplyVO> getList( int codi_no) {
		log.info("get reply List >............>>>>> " + codi_no);
		
		return mapper.getList(codi_no);
	}
	
	
	
	
	
	
	
}
