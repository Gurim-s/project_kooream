package com.kooream.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.CodiImageVO;
import com.kooream.domain.OriginalAttachVO;
import com.kooream.domain.OriginalVO;
import com.kooream.service.OriginalService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class OriginalController {

	private OriginalService service;

	// 정품판별 게시판 리스트 화면 이동
	@GetMapping("/oriList")
	public String oriList(Model model) {
		log.info("ori list........");

		model.addAttribute("list", service.oriList());

		return "/community/oriList";
	}

	// 정품판별 게시글 작성 화면 이동
	@GetMapping("/oriRegister")
	public String oriRegister() {

		return "/community/oriRegister";
	}
	
	// 게시글 이미지 비동기로 가져오기
	@GetMapping(value = "/getImages/{orino}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<OriginalAttachVO>> getImages(@PathVariable("orino") int orino) {
		List<OriginalAttachVO> list = service.getAttList(orino);
		System.out.println("list : " + list.size());
		
		return new ResponseEntity<List<OriginalAttachVO>>(list, HttpStatus.OK);
	}
	

	// 정품 판별 게시글 인서트
	@PostMapping("/oriRegister")
	public String oriRegister(OriginalVO vo) {
		log.info("ori register....." + vo);
		service.oriRegister(vo);

		List<OriginalAttachVO> list = vo.getAttachList();

		if (list.size() > 0) {
			for (OriginalAttachVO vo2 : list) {
				log.info("------------------------filename : " + vo2.getFileName());
				log.info("------------------------path : " + vo2.getUploadPath());
				log.info("------------------------uuid : " + vo2.getUuid());
			}

		}

		return "/community/oriList";
	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<OriginalAttachVO>> getAttachList(int orino) {
		log.info("getAttachList....." + orino);
		return new ResponseEntity<List<OriginalAttachVO>>(service.getAttList(orino), HttpStatus.OK);
	}

	// 정품판별 게시글 조회
	@GetMapping("/oriGet")
	public String oriGet(int orino, Model model) {
		log.info("original Get................" + orino);
		OriginalVO vo = service.oriGet(orino);
		
		System.out.println("-------" + vo.getOrino());
		System.out.println("-----" + vo.getAttachList().size());

		model.addAttribute("vo",vo);
		System.out.println("==========" + vo);
		model.addAttribute("list", vo.getAttachList());
		System.out.println("============" + vo.getAttachList());
		return "/community/oriGet";
	}
	
	// 정품판별 게시글 수정 (화면이동)
	@GetMapping("/oriUpdate")
	public String oriUpdate(int orino, Model model) {
		log.info("original update page............" + orino);
		return "/community/oriUpdate";
	}
	
	// 정품판별 게시글 삭제
	@GetMapping("/oriRemove")
	public String oriRemove(int orino, RedirectAttributes rttr) {
		log.info("original remove........" + orino);
		
		if(service.oriRemove(orino)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/community/oriList";
		
	}
	
}
