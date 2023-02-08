package com.kooream.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.Criteria;
import com.kooream.domain.MemberVO;
import com.kooream.domain.StyleImageVO;
import com.kooream.domain.StyleQuery;
import com.kooream.domain.StyleVO;
import com.kooream.service.StyleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/style/*")
@AllArgsConstructor
public class StyleController {
	private StyleService service;
	
	
	@GetMapping("/list")
	public String list() {
		return "/style/list";
	}
	
	@PostMapping(value = "/list",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			consumes = "application/json")
	public ResponseEntity<List<StyleVO>> listHot(@RequestBody StyleQuery query) {
		List<StyleVO> list = service.getList(query);
		
		return new ResponseEntity<List<StyleVO>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/{style_no}",
				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<StyleVO> get(@PathVariable("style_no") long style_no) {
		StyleVO style = service.get(style_no);
		
		return new ResponseEntity<StyleVO>(style, HttpStatus.OK);
	}
	
	@GetMapping(value = "/detail")
	public String detail(@RequestParam String category, @RequestParam long style_no, Model model) {
		model.addAttribute("category", category);
		model.addAttribute("style_no", style_no);
		return "/style/detail";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/register")
	public String register() {
		return "/style/register";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/register")
	public String register(StyleVO vo, RedirectAttributes rttr) {
		log.info("register....." + vo);
		service.register(vo);
		
		return "redirect:/style/list";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/update")
	public String update(long style_no, Model model) {
		model.addAttribute("vo", service.get(style_no));
		return "/style/update";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/update")
	public String update(StyleVO vo, RedirectAttributes rttr) {
		log.info("register....." + vo);
		service.update(vo);
		return "redirect:/style/list";
	}
	
	@GetMapping("/remove")
	@Transactional
	public String delete(@RequestParam("style_no") long style_no, RedirectAttributes rttr) {
		log.info("remove....." + style_no);
		
		List<StyleImageVO> imageList = service.getImageList(style_no);
		
		if (service.remove(style_no)) {
			deleteImages(imageList);
			
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/style/list";
	}
	
	private void deleteImages(List<StyleImageVO> imageList) {
		if (imageList == null || imageList.size() == 0) return ;
		log.info("delete image files........");
		
		imageList.forEach(image -> {
			try {
				Path file = Paths.get("C:\\upload\\" + image.getUploadPath() + "\\" + image.getUuid() + "\\" + image.getFileName());
				
				Files.deleteIfExists(file);
				// 추후 썸네일 기능 추가시 함께 삭제 해주어야함.
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
}