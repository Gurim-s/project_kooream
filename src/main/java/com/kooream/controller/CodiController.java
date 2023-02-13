package com.kooream.controller;


import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.CodiImageVO;
import com.kooream.domain.CodiVO;
import com.kooream.domain.Codi_TagVO;
import com.kooream.domain.Codi_itemVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.PageDTO;
import com.kooream.domain.ProductTagVO;
import com.kooream.domain.SearchCriteria;
import com.kooream.service.CodiService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/codishop/*")
@AllArgsConstructor
public class CodiController {
	private CodiService service;
	

	@GetMapping("/list")
	public String list() {
		return "/codishop/list";
	}

	@PostMapping(value = "/list", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CodiVO>> list(@RequestBody SearchCriteria cri,
											@RequestParam(value = "searchType", required = false, defaultValue = "")String searchType, 
											@RequestParam(value = "searchName", required = false, defaultValue = "")String searchName, 
											@RequestParam(value = "searchTagName", required = false, defaultValue = "")String searchTagName
											){
		List<CodiVO> list = service.getList(cri);
		
		int total = service.getTotal(cri);
		
		log.info(cri.getAmount()+""+cri.getPageNum());
		return new ResponseEntity<List<CodiVO>>(list, HttpStatus.OK);
	}
	
	
	
		
	@GetMapping("/register")
	public String register() {
		log.info("codiController - 게시글 등록 페이지 이동 " );
		
		return "/codishop/register";
	}
	
	@PostMapping("/register")
	public String register(CodiVO vo, RedirectAttributes rttr) {
		log.info("register........" + vo);

		List<CodiImageVO> list = vo.getAttachList();
		List<Codi_TagVO> tagList = vo.getCodiTagList();
		List<ProductTagVO> productTagList = vo.getProductTagList();
		
		for(int i=0; i<vo.getCodiTagList().size(); i++ ) {
		  
		log.error(vo.getCodiTagList().get(i).getTag_name()); }
		 
		service.register(vo);
		
		
		if(tagList != null) {
			for(Codi_TagVO vo3 : tagList) {
				log.info("::::getTag_name::::"+vo3.getTag_name());
				log.info("::::getTag_cnt::::"+vo3.getTag_cnt());
				log.info("::::getCodi_no::::"+vo3.getCodi_no());
			}
		}
		
		if(list != null && list.size()>0) {
			for(int i = 0; i<list.size(); i++) {
				log.info("::::::::::::::::::filename"+ list.get(i).getFileName());
				log.info("::::::::::::::::::getUploadPath"+ list.get(i).getUploadPath());
				log.info("::::::::::::::::::getUuid"+ list.get(i).getUuid());
			}
		}
		rttr.addFlashAttribute("result", "ok");

		return "redirect:/codishop/list";
	}
	
	// 게시글 페이지 이동
	@GetMapping("/get")
	public String get(@RequestParam("codi_no") int codi_no, Model model, Criteria cri) {
		log.info("/get....gogo");
		model.addAttribute("board", service.get(codi_no));
		model.addAttribute("cri", cri);
	
		return "/codishop/get";
	}
	
	// 게시글 이미지 비동기로 가져오기
	@GetMapping(value = "/getImages/{codi_no}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CodiImageVO>> getImages(@PathVariable("codi_no") int codi_no) {
		List<CodiImageVO> list = service.getCodiAttachList(codi_no);
		System.out.println("list : " + list.size());
		
		return new ResponseEntity<List<CodiImageVO>>(list, HttpStatus.OK);
	}
	
	// 게시글 태그 비동기 가져오기
	@GetMapping(value = "/getTag/{codi_no}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Codi_TagVO>> getTags(@PathVariable("codi_no") int codi_no){
		List<Codi_TagVO> list1 = service.getTagList(codi_no);
		System.out.println("list : " + list1.size());
		log.info("getTags..................." + codi_no); 
		
		return new ResponseEntity<List<Codi_TagVO>>(list1, HttpStatus.OK);
	}
	
	// 상품 태그 
	@GetMapping(value = "/getProductTag/{codi_no}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductTagVO>> getPNoListByCodiNo(@PathVariable("codi_no") int codi_no){
		List<ProductTagVO> pList = service.getPNoListByCodiNo(codi_no);
		
		return new ResponseEntity<List<ProductTagVO>>(pList, HttpStatus.OK);
	}
	
	// 수정 
	@GetMapping("/modify")
	public String modify(@RequestParam("codi_no") int codi_no, Model model, Criteria cri) {
		model.addAttribute("vo", service.get(codi_no));
		model.addAttribute("cri",cri);
		log.info(codi_no);
		return "/codishop/modify";
	}
	
	@PostMapping("/modify")
	public String modify(CodiVO vo, RedirectAttributes rttr) {
		log.info("update........."+vo);
		service.modify(vo);
		log.info(vo);
		return "redirect:/codishop/list";
	}
	
	 // modify getMapping ... end 
	
	// 삭제 
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam("codi_no") int codi_no)throws Exception{
		service.remove(codi_no);
		
		return "redirect:/codishop/list";
	} // remove .... end 

}

