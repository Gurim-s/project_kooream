package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CommunityTalkReplyVO;

public interface CommunityTalkReplyMapper {
	
	// 댓글 작성
	public int insert(CommunityTalkReplyVO vo);
	
	// 댓글 목록
	public List<CommunityTalkReplyVO> getList(int talkno);
	
	// 댓글 삭제
	public int delete(int talkreplyno);
	
	// 댓글 수정
	public int update(CommunityTalkReplyVO vo);
	
	// 댓글 조회(번호 가져오기 위해)
	public CommunityTalkReplyVO read(int talkreplyno);
	
	// 게시글 삭제 전체 댓글 삭제
	public int allDelete(int talkno);
	
}
