package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.OriginalReplyVO;
import com.kooream.mapper.OriginalReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OriginalReplySeviceImpl implements OriginalReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private OriginalReplyMapper mapper;
	
	// 댓글 작성
	@Override
	public int register(OriginalReplyVO vo) {
		log.info("original reply............" + vo);
		
		int result = mapper.insert(vo);
		return result;
	}
	
	// 댓글 목록
	@Override
	public List<OriginalReplyVO> getList(int orino) {
		log.info("original reply list..........." + orino);
		return mapper.getList(orino);
	}
	
	// 진품 같아요 댓글 갯수
	@Override
	public int countOriOk() {
		return mapper.countOriOk();
	}
	
	// 가품 같아요 댓글 갯수
	@Override
	public int countOriNo() {
		return mapper.countOriNo();
	}
	
	
}
