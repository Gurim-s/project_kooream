package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CommunityTalkReplyVO;

public interface CommunityTalkReplyMapper {
	
	// 댓글 작성
	public int insert(CommunityTalkReplyVO vo);
	
	// 댓글 목록
	public List<CommunityTalkReplyVO> getList(int talkno);
}
