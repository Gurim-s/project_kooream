package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CommunityTalkVO;

public interface CommunityTalkMapper {
	// 구림톡 리스트 보기
	public List<CommunityTalkVO> getTalkList();
	
	// 구림톡 게시글 등록
	public void talkInsert(CommunityTalkVO vo);
	
	// 구림톡 상세 보기
	public CommunityTalkVO talkGet (int talkno);
	
	// 구림톡 삭제
	public int talkRemove (int talkno);
	
	// 구림톡 수정
	public int talkUpdate (CommunityTalkVO vo);
}
