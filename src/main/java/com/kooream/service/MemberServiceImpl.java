package com.kooream.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kooream.domain.MemberVO;
import com.kooream.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.SetDelegate;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	@Setter (onMethod_= @Autowired)
	private MemberMapper mapper;
	
	// 패스워드 인코딩을 위해서 선언
	@Setter (onMethod_= @Autowired)
	private PasswordEncoder pwencoder;
	
	
	@Override
	public int check(Map<String,Object> map) {
		return mapper.check(map);
	}

	@Override
	public int goJoin(MemberVO vo) {
		// 패스워드 인코딩
		vo.setM_pw(pwencoder.encode(vo.getM_pw()));
		mapper.goJoin(vo);
		
		// 회원가입시 권한테이블에 m_no, auth 넣어주기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_no", vo.getM_no());
		map.put("auth", "ROLE_USER");
		mapper.addAuth(map);
		return 1;
	}

	@Override
	public int successModify(MemberVO vo) {
		return mapper.successModify(vo);
	}

	@Override
	public int deleteMember(int m_no) {
		return mapper.deleteMember(m_no);
	}
	
}
