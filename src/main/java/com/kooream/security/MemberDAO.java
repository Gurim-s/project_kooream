package com.kooream.security;

import org.springframework.stereotype.Service;

import com.kooream.domain.MemberVO;

@Service
public interface MemberDAO {
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;

}
