package com.kooream.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleImageVO;
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
		return "style/list";
	}
	
	@PostMapping(value = "/list/hot",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			consumes = "application/json")
	public ResponseEntity<List<StyleVO>> listHot(@RequestBody Criteria cri) {
		List<StyleVO> list = service.getList(cri);
		log.info(cri.getAmount() + "" + cri.getPageNum());
		return new ResponseEntity<List<StyleVO>>(list, HttpStatus.OK);
	}
	
//	@GetMapping(value = "/list/recent",
//				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<List<StyleVO>> listRecent() {
//		List<StyleVO> list = service.getList();
//		
//		return new ResponseEntity<List<StyleVO>>(list, HttpStatus.OK);
//	}
	
	@GetMapping(value = "/detail")
	public String detail(@RequestParam String category, @RequestParam long style_no, Model model) {
		model.addAttribute("category", category);
		model.addAttribute("style_no", style_no);
		return "style/detail";
	}
	
	@GetMapping(value = {"/detail_list/{category}/{style_no}",
						 "/detail_list/tag/{category}/{style_no}"},
				 produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<StyleVO>> detailList(@PathVariable("category") String category, @PathVariable("style_no") long style_no) {
		
		return new ResponseEntity<List<StyleVO>>(service.getList(new Criteria(1, 3)), HttpStatus.OK);
	}
	
	@GetMapping("/register")
	public String register() {
		return "style/register";
	}
	
	@PostMapping("/register")
	public String register(StyleVO vo, RedirectAttributes rttr) {
		log.info("register....." + vo);
		service.register(vo);
		
		return "redirect:style/list";
	}
	
	@GetMapping("/update")
	public String update(long style_no, Model model) {
		model.addAttribute("vo", service.get(style_no));
		return "style/update";
	}
	
	@PostMapping("/update")
	public String update(StyleVO vo, RedirectAttributes rttr) {
		log.info("register....." + vo);
		service.register(vo);
		
		return "redirect:style/list";
	}
	
	@PostMapping("/remove")
	public String delete(@RequestParam("style_no") long style_no, RedirectAttributes rttr) {
		log.info("remove....." + style_no);
		
		List<StyleImageVO> imageList = service.getImageList(style_no);
		
		if (service.remove(style_no)) {
			deleteImages(imageList);
			
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:style/list";
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