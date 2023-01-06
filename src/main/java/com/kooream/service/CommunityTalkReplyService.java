package com.kooream.service;

import java.util.List;

import com.kooream.domain.CommunityTalkReplyVO;

public interface CommunityTalkReplyService {

	public int register(CommunityTalkReplyVO vo);
	public List<CommunityTalkReplyVO> getList(int talkno);
}
