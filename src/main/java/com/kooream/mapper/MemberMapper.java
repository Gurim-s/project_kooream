package com.kooream.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.MemberVO;

@Mapper
public interface MemberMapper {
	// 회원가입 중복체크
	public int check(Map<String, Object> map);
	// 회원가입
	public int goJoin(MemberVO vo);
	public int addAuth(Map<String, Object> map);
	// 로그인
	public MemberVO read(String m_id);
	
	
	
	
	/*
	public int goLogin(Map<String, Object> map);
	public MemberVO getMemberInfo(Map<String, Object> map);
	*/
}
