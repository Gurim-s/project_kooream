package com.kooream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kooream.domain.CommunityTalkVO;
import com.kooream.service.CommunityTalkService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class CommunityTalkController {
	
	private CommunityTalkService service;
	
	// 뉴스 리스트에서 구림톡 리스트로 페이지 이동 (메인에서 커뮤니티 메뉴 눌렀을 때 뉴스 리스트가 보임)
	@GetMapping("/talkList")
	public String talkList(Model model) {
		log.info("gettalklist....................");
		model.addAttribute("list", service.getTalkList());
		return "/community/talkList"; 
	}
	
	//구림톡 리스트에서 게시글 작성으로 이동
	@GetMapping("/talkRegister")
	public String talkRegister(Model model) {
		return "/community/talkRegister";
	}
	
	//게시글 작성 페이지에서 게시글 인서트
	@PostMapping("/talkRegister")
	public String talkRegister(CommunityTalkVO vo) {
		log.info("register..........." + vo);
		service.talkRegister(vo);
		
		return "/talkList";
	}
	
	
}
