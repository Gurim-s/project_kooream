package com.kooream.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
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

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;
import com.kooream.service.BidShopService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class BidShopController {
	
	private BidShopService service;
	
	@GetMapping("/shop_allList")
	public String shop_List(Model model) {
		log.info("list...");
		
		List<ProductVO> bidList = service.getList();
	
		model.addAttribute("bidList", bidList);
		return "shop/shop_allList";
	}
	
	@GetMapping("/shop_introduce")
	public String shop_introduce() { 
		log.info("introduce...");
		
		return "shop/shop_introduce";
	}
//	
//	@GetMapping("/shop_bidpage")
//	public String shop_bidpage() {
//		log.info("bidpage...");
//		
//		return "shop/shop_bidpage";
//	}
	
	@GetMapping("/shop_buypage")
	public String shop_buypage() {
		log.info("shop_buypage...");
		
		return "shop/shop_buypage";
	}
	
//	@GetMapping("/shop_buypage2")
//	public String shop_buypage2() {
//		log.info("shop_buypage...");
//		
//		return "shop/shop_buypage2";
//	}

	@GetMapping("/shop_register")
	public String shop_registerPage() {
		log.info("shop_registerPage...");

		return "shop/shop_register";
	}

	@PostMapping("/shop_register")
    public String shop_register(ProductVO vo) {
        log.info("shop_register...");

        service.insertProduct(vo);

        return "redirect:/shop/shop_allList";
    }
	
//	@PostMapping("/shop_buypage")
//    public String shop_register(BidShopVO vo) {
//        log.info("shop_buypage...");
//
//        service.insertProduct(vo);
//
//        return "redirect:/shop/shop_allList";
//    }
	
//	@GetMapping("/shop_bidpage")
//	public String get(@RequestParam("p_no") int p_no, Model model) {
//		log.info("/shop_bidpage");
//		model.addAttribute("vo", service.get(p_no));
//		return "/shop/shop_bidpage";
//	}
	
	@GetMapping(value = "/shop_introduce/{p_no}")
    public String get(@PathVariable("p_no") int p_no, Model model) {

        ProductVO vo = service.read(p_no);
        System.out.println("+++++++++++++++++++++");
        System.out.println(vo.getMax_bid_sell());
        System.out.println(vo.getMin_bid_buy());
        System.out.println("+++++++++++++++++++++");
        model.addAttribute("vo", vo);
        List<AttachFileVO> attachFileVOs = service.getAttachList(vo.getP_no());
        List<String> imageUrls = new ArrayList<String>();
        
        for(AttachFileVO attachFileVO: attachFileVOs) {
        	String uploadPath = attachFileVO.getUploadPath();
        	String uuid = attachFileVO.getUuid();
        	String fileName = attachFileVO.getFileName();
        	String fileCallPath = uploadPath + "/" + uuid + "_" + fileName;
        	String fileCallPathEncoded = null;
        	try {
        		fileCallPathEncoded = URLEncoder.encode(fileCallPath, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
        	
        	imageUrls.add("/bidfile/display?fileName=" + fileCallPathEncoded);
        }
        
        model.addAttribute("imageUrls", imageUrls);
        		
        return "shop/shop_introduce";
    }
	
	@GetMapping(value = "/shop_modify/{p_no}")
	public String modify(@PathVariable("p_no") int p_no, Model model) {
		  		  
		ProductVO vo = service.modiread(p_no);
		model.addAttribute("vo", vo);
		return "shop/shop_modify";
	}
	
	@PostMapping("/shop_modify")	
	public String modify(ProductVO vo) {
		log.info("modify...." + vo );
		service.modify(vo);
		
		return "redirect:/shop/shop_allList";
	}

	@GetMapping(value = "/remove/{p_no}")	
	public String remove(@PathVariable("p_no") int p_no) {
		service.remove(p_no);
		return "redirect:/shop/shop_allList";
	}
	
	@GetMapping(value = "/shop_buypage/{p_no}")
    public String get1(@PathVariable("p_no") int p_no, Model model) {

        ProductVO vo = service.read(p_no);
        model.addAttribute("vo", vo);
        return "shop/shop_buypage";
    }
	
	@GetMapping(value = "/shop_sellpage/{p_no}")
    public String get2(@PathVariable("p_no") int p_no, Model model) {

        ProductVO vo = service.read(p_no);
        model.addAttribute("vo", vo);
        return "shop/shop_sellpage";
    }
	
	// 이미지 리스트 보여주기
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public ResponseEntity<List<AttachFileVO>> getAttachList(int p_no) {
		log.info("getAttachList...." + p_no); 
		return new ResponseEntity<List<AttachFileVO>>(service.getAttachList(p_no),HttpStatus.OK);
	}
}