package com.kooream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 게시글 작성 페이지에서 게시글 인서트 (작성 후 리스트로 이동)
	@PostMapping("/talkRegister")
	public String talkRegister(CommunityTalkVO vo) {
		log.info("register..........." + vo);
		service.talkRegister(vo);
		
		return "/community/talkList";
	}
	
	// 구림톡 게시글 상세 보기
	@GetMapping("/talkGet")
	public String talkGet(@RequestParam("talkno") int talkno, Model model) {
		log.info("talk get................." + talkno);
		
		model.addAttribute("vo", service.talkGet(talkno));
		return "/community/talkGet";
	}
	
	// 구림톡 게시글 삭제
	@PostMapping("/talkRemove")
	public String talkRremove(@RequestParam("talkno") int talkno, RedirectAttributes rttr) {
		log.info("talk remove................" + talkno);
		
		// 후에 경고창 띄울 예정이라 만들어 두긴 했으나 리스트 넘어가는데 변수가 없어서 인지... 타지 않음
		// 페이징 처리 후 다시 확인 할 것
		// 삭제 처리는 성공
		if(service.talkRemove(talkno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/community/talkList";
	}
	
	// 구림톡 게시글 수정 페이지 이동
	@GetMapping("/talkUpdate")
	public String talkUpdate(@RequestParam("talkno") int talkno, Model model) {
		log.info("talk update................" + talkno);
		model.addAttribute("vo", service.talkGet(talkno));
		return "/community/talkUpdate";
	}
	
	// 구림톡 게시글 수정 (update)
	@PostMapping("/talkUpdate")
	public String talkUpdate(CommunityTalkVO vo, RedirectAttributes rttr) {
		log.info("talk update.........." + vo.getTalkno());
		
		if(service.talkUpdate(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/community/talkList";
	}
	
	
	
	
}
