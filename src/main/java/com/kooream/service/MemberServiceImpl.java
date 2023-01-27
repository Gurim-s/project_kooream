package com.kooream.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.MemberVO;
import com.kooream.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	@Setter (onMethod_= @Autowired)
	private MemberMapper mapper;

	@Override
	public int check(Map<String,Object> map) {
		return mapper.check(map);
	}

	@Override
	public int goJoin(MemberVO vo) {
		return mapper.goJoin(vo);
	}
}
