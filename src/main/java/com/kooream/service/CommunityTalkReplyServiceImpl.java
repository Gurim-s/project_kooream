package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.CommunityTalkReplyVO;
import com.kooream.mapper.CommunityTalkReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommunityTalkReplyServiceImpl implements CommunityTalkReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityTalkReplyMapper mapper;
	
	
	// 댓글 작성
	@Override
	public int register(CommunityTalkReplyVO vo) {
		log.info("reply register........" + vo);
		
		int result = mapper.insert(vo);
		return result;
	}
	
	
	// 댓글 목록
	@Override
	public List<CommunityTalkReplyVO> getList(int talkno) {
		log.warn("reply list....................." + talkno);
		return mapper.getList(talkno);
	}
	
	
	// 댓글 삭제
	@Transactional
	@Override
	public int remove(int talkreplyno) {
		log.info("reply remove.............." + talkreplyno);
		
		int result = mapper.delete(talkreplyno);
		return result;
	}
	
	
	// 댓글 수정
	@Override
	public int modify(CommunityTalkReplyVO vo) {
		log.info("reply modify..............." + vo);
		
		int result = mapper.update(vo);
		return result;
	}
	
}
