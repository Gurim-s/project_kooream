package com.kooream.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.kooream.domain.MemberVO;

public interface MemberService {
	public int check(Map<String, Object> map);
	public int goJoin(MemberVO vo);
	public int successModify(MemberVO vo);
	public int deleteMember(int m_no);
	public MemberVO getMemberInfoByMno(int m_no);
	public MemberVO findInfo(MemberVO vo);
	public int matchPw(MemberVO vo);
	public int updatePw(MemberVO vo);
	
	/*
	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;
	//비밀번호찾기
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;
	*/
}
