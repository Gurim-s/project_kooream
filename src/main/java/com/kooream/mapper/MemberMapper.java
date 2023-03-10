package com.kooream.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	// 비밀번호 맞는지 확인
	public int matchPw(MemberVO vo);
	// 개인정보수정
	public int successModify(MemberVO vo);
	// 회원삭제
	public int deleteMember(int m_no);
	// 회원 정보 조회
	public MemberVO getMemberInfoByMno(int m_no);
	// 계정찾기
	public MemberVO findInfo(MemberVO vo);
	// 비밀번호 업데이트
	public int updatePw(MemberVO vo);
	// 팔로우 수 증가
	public int updateFollowerCount(@Param("m_no") int m_no, @Param("amount") int amount);
	// 팔로잉 수 증가
	public int updateFollowingCount(@Param("m_no") int m_no, @Param("amount") int amount);
	// 게시글 수 증가
	public int updateStyleCount(@Param("m_no") int m_no, @Param("amount") int amount);
}
