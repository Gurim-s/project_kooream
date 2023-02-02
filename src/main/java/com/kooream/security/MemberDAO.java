package com.kooream.security;

import com.kooream.domain.MemberVO;

public interface MemberDAO {
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;

}
