package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.mapper.CommunityTalkMapper;
import com.kooream.mapper.CommunityTalkReplyMapper;
import com.kooream.domain.CommunityTalkVO;
import com.kooream.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommunityTalkServiceImpl implements CommunityTalkService{
	
	@Setter(onMethod_ = @Autowired)
	private CommunityTalkMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private CommunityTalkReplyMapper replyMapper;
	
	// 구림톡 게시글 리스트 (페이징 처리 하기 전)
//	@Override
//	public List<CommunityTalkVO> getTalkList() {
//		log.info("getlist.............");
//		return mapper.getTalkList(); 
//	}
	
	// 구림톡 게시글 등록
	@Override
	public void talkRegister(CommunityTalkVO vo) {
		log.info("register......." + vo);
		
		// 1. 게시글 등록
		mapper.talkInsert(vo);
		
	}
	
	// 구림톡 게시글 상세 보기
	@Override
	public CommunityTalkVO talkGet(int talkno) {
		log.info("talk get................" + talkno);
		return mapper.talkGet(talkno);
	}
	
	// 구림톡 게시글 삭제하기
	@Transactional
	@Override
	public boolean talkRemove(int talkno) {
		log.info("talk remove.............." + talkno);
		
		if(replyMapper.getList(talkno) != null) {
			replyMapper.allDelete(talkno);
		}
		
		return mapper.talkRemove(talkno) == 1;
	}
	
	// 구림톡 게시글 수정하기
	@Override
	public boolean talkUpdate(CommunityTalkVO vo) {
		log.info("update............." + vo);
		System.out.println(vo.getTalkno());
		int result = mapper.talkUpdate(vo);
		return result == 1? true : false;
	}
	
	// 페이징 처리 된 구림톡 전체 게시글 보기
	@Override
	public List<CommunityTalkVO> getListWithPaging(Criteria cri) {
		log.info("getListWithPaging" + cri);
		return mapper.getListWithPaging(cri);
	}
	
	// 게시판 전체 글 수 구하기
	@Override
	public int getTotal() {
		log.info("get total count.........");
		return mapper.getTotalCount();
	}
	
}
