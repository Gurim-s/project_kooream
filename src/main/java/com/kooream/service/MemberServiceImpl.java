package com.kooream.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
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

	@Override
	public MemberVO findInfo(MemberVO vo) {
		return mapper.findInfo(vo);
	}

	@Override
	public int updatePw(MemberVO vo) {
		vo.setM_pw(pwencoder.encode(vo.getM_pw()));
		return mapper.updatePw(vo);
	}
	
	
	/*
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //"smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "lhy9704@naver.com"; //"서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "vblhyjj1122!@"; //"서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "lhy9704@naver.com"; // "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "kooream"; //"프로젝트이름 또는 보내는 사람 이름";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "kooream 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getM_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getM_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);  //.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		//MemberVO ck = mdao.readMember(vo.getM_id());
		MemberVO ck = mapper.findInfo(vo);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(ck.getM_id() == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getM_email().equals(ck.getM_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setM_pw(pw);
			// 비밀번호 변경
			mdao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	*/
}
