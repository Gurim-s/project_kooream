package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.mapper.CommunityTalkMapper;
import com.kooream.domain.CommunityTalkVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommunityTalkServiceImpl implements CommunityTalkService{
	
	@Setter(onMethod_ = @Autowired)
	private CommunityTalkMapper mapper;
	
	@Override
	public List<CommunityTalkVO> getTalkList() {
		log.info("getlist.............");
		return mapper.getTalkList(); 
	}

	@Override
	public void talkRegister(CommunityTalkVO vo) {
		log.info("register......." + vo);
		
		// 1. 게시글 등록
		mapper.talkInsert(vo);
		
	}
}
