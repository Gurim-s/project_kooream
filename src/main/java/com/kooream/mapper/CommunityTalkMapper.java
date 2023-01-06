package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CommunityTalkVO;
import com.kooream.domain.Criteria;

public interface CommunityTalkMapper {
	// 구림톡 리스트 보기 (페이징 처리 전 사용)
	//public List<CommunityTalkVO> getTalkList();
	
	// 구림톡 게시글 등록
	public void talkInsert(CommunityTalkVO vo);
	
	// 구림톡 상세 보기
	public CommunityTalkVO talkGet (int talkno);
	
	// 구림톡 삭제
	public int talkRemove (int talkno);
	
	// 구림톡 수정
	public int talkUpdate (CommunityTalkVO vo);
	
	// 페이징 처리 된 구림톡 리스트 보기
	public List<CommunityTalkVO> getListWithPaging(Criteria cri);
	
	// 테이블 내 전체 데이터 개수 구하기(게시판 전체 글 수 구하기)
	public int getTotalCount();
	
}
