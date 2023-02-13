package com.kooream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.CommunityTalkVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.PageDTO;
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
	// 기존에 누군가 만들어 둔 Criteria 도메인 사용함 (페이징 처리를 위한)
	@GetMapping("/talkList")
	public String talkList(Model model, Criteria cri) {
		//log.info("gettalklist....................");
		// 페이징 처리 없이 리스트를 뿌렸을 때 사용 했음
		//model.addAttribute("list", service.getTalkList());
		
		log.info("talk list.........." + cri);
		
		int total = service.getTotal();
		log.info("total : " + total);
		
		// 한 페이지의 담을 게시글 수
		model.addAttribute("list", service.getListWithPaging(cri));
		// 전체 게시글 수
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/community/talkList"; 
	}
	
	//구림톡 리스트에서 게시글 작성으로 이동
	@GetMapping("/talkRegister")
	public String talkRegister(Model model, Criteria cri) {
		model.addAttribute("cri", cri);
		return "/community/talkRegister";
	}
	
	// 게시글 작성 페이지에서 게시글 인서트 (작성 후 리스트로 이동)
	@PostMapping("/talkRegister")
	public String talkRegister(CommunityTalkVO vo, Criteria cri, RedirectAttributes rttr) {
		log.info("register..........." + vo);
		service.talkRegister(vo);
		
		// 페이징 처리를 위한 값 저장... post 방식이기 때문에 url에 값을 싣기 위해 rttr에 담음
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/community/talkList";
	}
	
	// 구림톡 게시글 상세 보기
	@GetMapping("/talkGet")
	public String talkGet(@RequestParam("talkno") int talkno, Model model, Criteria cri) {
		log.info("talk get................." + talkno);
		
		model.addAttribute("vo", service.talkGet(talkno));
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("amount", cri.getAmount());
		return "/community/talkGet";
	}
	
	// 구림톡 게시글 삭제
	@GetMapping("/talkRemove")
	public String talkRremove(@RequestParam("talkno") int talkno, RedirectAttributes rttr, Criteria cri) {
		log.info("talk remove................" + talkno);
		
		// 후에 경고창 띄울 예정이라 만들어 두긴 했으나 리스트 넘어가는데 변수가 없어서 인지... 타지 않음
		// 페이징 처리 후 다시 확인 할 것
		// 삭제 처리는 성공
		if(service.talkRemove(talkno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/community/talkList";
	}
	
	// 구림톡 게시글 수정 페이지 이동
	@GetMapping("/talkUpdate")
	public String talkUpdate(@RequestParam("talkno") int talkno, Model model, Criteria cri) {
		log.info("talk update................" + talkno);
		
		model.addAttribute("vo", service.talkGet(talkno));
		//페이징 값 저장
		model.addAttribute("cri", cri);
		return "/community/talkUpdate";
	}
	
	// 구림톡 게시글 수정 (update)
	@PostMapping("/talkUpdate")
	public String talkUpdate(CommunityTalkVO vo, RedirectAttributes rttr, Criteria cri) {
		log.info("talk update.........." + vo.getTalkno());
		
		if(service.talkUpdate(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/community/talkList";
	}
	
	
	
	
}
