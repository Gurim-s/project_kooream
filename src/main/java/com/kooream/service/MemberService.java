package com.kooream.service;

import java.util.Map;

import com.kooream.domain.MemberVO;

public interface MemberService {
	public int check(Map<String, Object> map);
	public int goJoin(MemberVO vo);
}
