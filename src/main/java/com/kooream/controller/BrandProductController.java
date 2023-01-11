package com.kooream.controller;



import java.util.List;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.AttachFileVO;
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
		
		/*
		 * log.info("register....." + vo.getB_no()); log.info("register....." +
		 * vo.getP_category()); log.info("register....." + vo.getP_model_no());
		 * log.info("register....." + vo.getP_name_en()); log.info("register....." +
		 * vo.getP_name_ko()); log.info("register....." + vo.getP_release_price());
		 * log.info("register....." + vo.getP_no()); log.info("register....." +
		 * vo.getP_size());
		 */
		service.register(vo);
		rttr.addFlashAttribute("result", "ok");
		return "redirect:/brandshop/view";
	}
	
	@GetMapping("/view")
	public String view(Model model) {
		model.addAttribute("list", service.getList());
		return "/brandshop/view";
	}	
	
	@GetMapping("/getList")
	@ResponseBody 
	public ResponseEntity<List<ProductVO>> getList() {	
		return new ResponseEntity<List<ProductVO>>(service.getList(),HttpStatus.OK);
	}
	
	  @GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	  
	  @ResponseBody public ResponseEntity<List<AttachFileVO>> getAttachList(int p_no) {
		  log.info("getAttachList...." + p_no); 
		  return new ResponseEntity<List<AttachFileVO>>(service.getAttachList(p_no),HttpStatus.OK);
	  
	  }
	  
	  @GetMapping("/get")	// 누르면 상세페이지 이동
	  public String get(ProductVO vo, Model model, Criteria cri) {
		 log.info("getp_no"+ vo.getP_no());
		  model.addAttribute("cri", cri);
		  model.addAttribute("vo", service.get(vo));
		  
		  return "/brandshop/get";
		  
	  }
	  
	  @GetMapping("/modify")
	  public String modify(ProductVO vo, Model model, Criteria cri) {
		  log.info("modify...." + vo );
		  model.addAttribute("cri", cri);
		  model.addAttribute("vo", service.get(vo));
		  
		  return "brandshop/modify";
	  }
	  
	 
	
	
  

  }
  
 