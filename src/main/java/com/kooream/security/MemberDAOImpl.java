package com.kooream.security;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kooream.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	//DB연결 (xml에서 만들어진 객체를 가져다 사용하고자함 = 의존 주입)
	@Inject
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요
	
	//mapper구분하는 값 namespace
	private static final String namespace = "com.kooream.mapper.MemberMapper2";
	
	@Override
	public int updatePw(MemberVO vo) throws Exception {
		return sqlSession.update(namespace+".updatePw", vo);
	}
	
}
