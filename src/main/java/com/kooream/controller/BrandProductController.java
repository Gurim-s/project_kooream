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
	
	
	@GetMapping("/index")		// index페이지로 이동
	public String index(Model model) {
		return "brandshop/index";
	}

  
	@GetMapping("/register")	// 등록 페이지 단순 이동
	public String register(Model model, int b_no) {
		model.addAttribute("b_no", b_no);
		//log.info(model + "수정페이지로 이동중");
		return "brandshop/register";	// brandshop 폴더 안에 register.jsp 로 이동 
	
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
		rttr.addAttribute("b_no", vo.getB_no());
		return "redirect:/brandshop/view";
	}
	
	@GetMapping("/view")	// 리스트 페이지로 이동
	public String view(Model model, @RequestParam int b_no) {	// index에서 b_no값을 던져줬으니깐 b_no값을 저장해야함
		model.addAttribute("b_no", b_no);
		//model.addAttribute("list", service.getList());
		log.info(b_no + "b_no 받고 목록으로 가기!!");
		return "/brandshop/view";
	}	
	// 상품 리스트 보여주기
	@GetMapping("/getList")	// 비동기 방식 mapping
	@ResponseBody 
	public ResponseEntity<List<ProductVO>> getList(ProductVO vo2) {	
		log.info(vo2.getB_no()+ "-----00000000000000000");
		return new ResponseEntity<List<ProductVO>>(service.getList(vo2),HttpStatus.OK);
	}
	// 이미지 리스트 보여주기
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public ResponseEntity<List<AttachFileVO>> getAttachList(int p_no) {
		log.info("getAttachList...." + p_no); 
		return new ResponseEntity<List<AttachFileVO>>(service.getAttachList(p_no),HttpStatus.OK);
	}
	  
	@GetMapping("/get")	// 누르면 상세페이지 이동
	public String get(ProductVO vo, Model model, Criteria cri) {
		log.info("getp_no============"+ vo.getP_no());
		model.addAttribute("cri", cri);
		model.addAttribute("vo", service.get(vo));
		model.addAttribute("vo2", service.member(vo));  // 
		return "/brandshop/get";
	}
	
	
	  
	@GetMapping("/modify")	// 수정버트은을 누르면 수정 페이지로 이동
	public String modify(ProductVO vo, Model model, Criteria cri) {
		  
		model.addAttribute("cri", cri);
		model.addAttribute("vo", service.get(vo));
		  
		return "brandshop/modify";	//.jsp
	}
	  
	@PostMapping("/modify")	// 수정페이지에서 수정하고 수정한 결과 저장
	public String modify(ProductVO vo, RedirectAttributes rttr, Criteria cri) {
		log.info("modify...." + vo );
		//rttr.addAttribute("pageNum", cri.getPageNum());
		//rttr.addAttribute("amount", cri.getAmount());
		
			
			 log.info("======================="+vo.getB_no());
			  log.info("======================="+vo.getP_no());
			  log.info("======================="+vo.getP_name_ko());
			  log.info("======================="+vo.getP_name_en());
			  log.info("======================="+vo.getP_model_no());
			  log.info("======================="+vo.getP_release_price());
			  log.info("======================="+vo.getP_category());
			  log.info("======================="+vo.getP_size());
			 

		service.modify(vo);
		rttr.addAttribute("b_no", vo.getB_no());
		  int result = service.modify(vo);
		  log.info("-----------------------"+result);
		return "redirect:/brandshop/view";		// controller 탐
			/* return "redirect:/brandshop/get?"+vo.getP_no();  pno 값을 가지고 이동*/
	}
	  
	@PostMapping("/remove")		// 상품 삭제
	public String remove(ProductVO vo, RedirectAttributes rttr, Criteria cri) {
		  
/*		  rttr.addAttribute("pageNum", cri.getPageNum());
		  rttr.addAttribute("amount", cri.getAmount());
		*/
		service.remove(vo);
		rttr.addAttribute("b_no", vo.getB_no());
		return "redirect:/brandshop/view";
		  
	}
	 
	
	
  

}
  
 