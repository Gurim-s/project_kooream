package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int countOriOk(int orino) {
		log.info("original OK....." + orino);
		return mapper.countOriOk(orino);
	}
	
	// 가품 같아요 댓글 갯수
	@Override
	public int countOriNo(int orino) {
		log.info("original NO....." + orino);
		return mapper.countOriNo(orino);
	}
	
	// 진품 댓글 셀렉트
	@Override
	public List<OriginalReplyVO> chOk(int orino) {
		log.info("original reply OK List......" + orino);
		return mapper.chOk(orino);
	}
	
	// 가품 댓글 셀렉트
	@Override
	public List<OriginalReplyVO> chNo(int orino) {
		log.info("original reply NO List......" + orino);
		return mapper.chNo(orino);
	}
	
	// 댓글 삭제
	@Transactional
	@Override
	public int remove(int orireplyno) {
		log.info("reply remove................." + orireplyno);
		
		int result = mapper.delete(orireplyno);
		return result;
	}
	
	// 댓글 조회
	@Override
	public OriginalReplyVO get(int orireplyno) {
		log.info("original reply get.........." + orireplyno);
		
		return mapper.read(orireplyno);
	}
	
	// 댓글 수정
	@Override
	public int modify(OriginalReplyVO vo) {
		log.info("original modify................" + vo);
		
		int result = mapper.update(vo);
		return result;
	}
	
}
