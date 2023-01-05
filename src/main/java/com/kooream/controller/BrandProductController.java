package com.kooream.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.Criteria;
import com.kooream.domain.ProductVO;
import com.kooream.service.BrandProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/brandshop/*")
@AllArgsConstructor 
public class BrandProductController {
 
	private BrandProductService service;
	
/* GetMapping은 단순 페이지 이동용*/	
	
	
	@GetMapping("/index")
	public String index(Model model) {
		return "brandshop/index";
	}

  
	@GetMapping("/register")	// 등록 페이지 단순 이동
	public String register(Model model) {
		return "brandshop/register";
	}
  
  
	@PostMapping("/register")	// 등록 페이지 삽입 
	public String register(ProductVO vo,RedirectAttributes rttr) { 
		
		log.info("register....." + vo);
		service.register(vo);
		return "redirect:/brandshop/register";
	}
	
	@GetMapping("/view")
	public String view(Model model) {
		model.addAttribute("list", service.getList());
		return "/brandshop/view";
	}
  

  }
  
 