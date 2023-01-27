package com.kooream.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.MemberVO;

@Mapper
public interface MemberMapper {
	public int check(Map<String, Object> map);
	public int goJoin(MemberVO vo);
	public int goLogin(Map<String, Object> map);
	public MemberVO getMemberInfo(Map<String, Object> map);
}
