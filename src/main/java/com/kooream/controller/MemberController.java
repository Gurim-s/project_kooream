package com.kooream.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.MemberVO;
import com.kooream.security.UserSession;
import com.kooream.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	@Setter(onMethod_= @Autowired)
	private MemberService service;
	
	
	// 메인페이지이동
	@GetMapping("/mainPage")
	public String mainPage() {
		return "/main";
	}
	
	// 로그인메뉴 클릭시 로그인 페이지로 이동
	@GetMapping("/loginPage")
	public String goIndex() {
		return "/member/loginPage";
	}
	// 로그인 실패시 핸들러타고 foward로 리턴이 되야해서 post로 하나더 적어줌
	@PostMapping("/loginPage")
	public String goInde() {
		return "/member/loginPage";
	}
	// 회원가입 페이지 이동
	@GetMapping("/joinPage")
	public String joinPage() {
		return "/member/joinPage";
	}
	
	// 회원가입정보 중복체크하는 ajax
	@PostMapping(value="/ajax/checkAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public int checkAjax(@RequestBody Map<String,Object> map) {
		return service.check(map);
	}
	
	// 회원가입 기능
	@PostMapping("/join")
	public String goJoin(MemberVO vo) {
		service.goJoin(vo);
		
		return "redirect:/member/loginPage";
	}
	
	
	// 마이페이지 이동
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/myPage")
	public String myPage() {
		return "/member/myPage";
	}
	
	// 권한 에러 페이지 이동
	@GetMapping("/authErrorPage")
	public String authError() {
		return "/member/authErrorPage";
	}
	
	// 마이페이지 - 프로필페이지 이동
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/profile")
	public String profile() {
		return "/member/profile";
	}
	
	// 마이페이지 - 개인정보 수정 기능
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/successModify")
	public String successModify(HttpServletRequest request, HttpServletResponse response, MemberVO vo) throws IOException {
		
		MemberVO userSession = new UserSession().getSession();
		if(userSession != null) {
			vo.setM_no(userSession.getM_no());	
		}
		
		// 개인정보 수정
		service.successModify(vo);
		
		// UserSession안 logout함수 사용하여 로그아웃시킴
		new UserSession().logout(request, response);
		
		// 알림창 출력
		Writer out = response.getWriter();
		String message = URLEncoder.encode("개인정보가 수정되었습니다. 다시 로그인해주세요.");
		response.setContentType("text/html; charset=UTF-8");
		out.write("<script type=\"text/javascript\">alert(decodeURIComponent('"+message+"'.replace(/\\+/g, '%20'))); location.href='/member/loginPage'</script>");
		return null;
	}
	
	// 마이페이지 - 회원탈퇴기능
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/deleteMember")
	public String deleteMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberVO userSession = new UserSession().getSession();
		if(userSession != null) {
			// 회원 삭제
			service.deleteMember(userSession.getM_no());
		}
		
		// UserSession안 logout함수 사용하여 로그아웃시킴
		new UserSession().logout(request, response);
		
		// 알림창 출력
		Writer out = response.getWriter();
		String message = URLEncoder.encode("회원탈퇴가 완료되었습니다.");
		response.setContentType("text/html; charset=UTF-8");
		out.write("<script type=\"text/javascript\">alert(decodeURIComponent('"+message+"'.replace(/\\+/g, '%20'))); location.href='/member/loginPage'</script>");
		return null;
	}
	
	// 구글 mail api이용
	@PostMapping("/findId")
	public String findId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.trust","smtp.naver.com");
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		//props.setProperty("mail.smtp.ssl.enable", "false");
		props.put("mail.smtp.port", "587");
		//props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
	        protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
	            return new javax.mail.PasswordAuthentication("lhy9704", "vblhyjj1122!@"); // 이메일 보내는 계정의 정보
	        }
	    });

		try {
		  Message msg = new MimeMessage(session);
		  msg.setFrom(new InternetAddress("lhy9704@naver.com")); // 보내는 계정의 주소 적어야됨!
		  msg.addRecipient(Message.RecipientType.TO,
		                   new InternetAddress("lhy9704@naver.com")); // 받는사람
		  msg.setSubject("Your Example.com account has been activated");
		  msg.setText("This is a test");
		  Transport.send(msg);
		} catch (AddressException e) {
		  // ...
			System.out.println("주소 실패");
		} catch (MessagingException e) {
		  // ...
			System.out.println(e.getMessage());
			System.out.println("전송실패");
		}
		
		// 알림창 출력
		Writer out = response.getWriter();
		String message = URLEncoder.encode("이메일로 아이디가 발송되었습니다.");
		response.setContentType("text/html; charset=UTF-8");
		out.write("<script type=\"text/javascript\">alert(decodeURIComponent('"+message+"'.replace(/\\+/g, '%20'))); location.href='/member/loginPage'</script>");
		return null;
	}
	
}
