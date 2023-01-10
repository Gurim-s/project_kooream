package com.kooream.service;

import java.util.List;

import com.kooream.domain.CommunityTalkReplyVO;

public interface CommunityTalkReplyService {
	
	// 댓글 작성
	public int register(CommunityTalkReplyVO vo);
	
	// 댓글 리스트
	public List<CommunityTalkReplyVO> getList(int talkno);
	
	// 댓글 삭제
	public int remove (int talkreplyno);
	
	// 댓글 수정
	public int modify (CommunityTalkReplyVO vo);
	
	// 댓글 조회
	public CommunityTalkReplyVO get (int talkreplyno);
}
