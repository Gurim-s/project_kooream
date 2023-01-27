package com.kooream.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.MemberVO;
import com.kooream.service.MemberService;
import com.kooream.service.RentalService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	@Setter(onMethod_= @Autowired)
	private MemberService service;
	
	// 로그인메뉴 클릭시 로그인 페이지로 이동
	@GetMapping("/loginPage")
	public String geIndex() {
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
	
}
