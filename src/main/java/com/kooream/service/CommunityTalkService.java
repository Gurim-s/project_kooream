package com.kooream.service;

import java.util.List;

import com.kooream.domain.CommunityTalkVO;
import com.kooream.domain.Criteria;

public interface CommunityTalkService {
	
	// 구림톡 게시글 리스트 (페이징 처리 하기 전)
	//public List<CommunityTalkVO> getTalkList();
	
	// 구림톡 게시글 등록
	public void talkRegister(CommunityTalkVO vo); 
	
	// 구림톡 게시글 상세 페이지 보기
	public CommunityTalkVO talkGet (int talkno);
	
	// 구림톡 게시글 삭제
	public boolean talkRemove(int talkno);
	
	// 구림톡 게시글 수정
	public boolean talkUpdate(CommunityTalkVO vo);
	
	// 페이징 처리 된 구림톡 게시글 리스트
	public List<CommunityTalkVO> getListWithPaging(Criteria cri);
	
	// 게시판 전체 글 수 구하기
	public int getTotal();
}
