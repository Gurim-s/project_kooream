package com.kooream.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.SizeVO;
import com.kooream.mapper.BidShopMapper;
import com.kooream.mapper.BrandProductMapper;
import com.kooream.mapper.SizeMapper;
import com.kooream.service.BidShopService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class BidShopController {
	
	@Setter(onMethod_ = @Autowired )
	private BidShopService service;
	
	@Setter(onMethod_ = @Autowired)
	private BidShopMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private SizeMapper sizemapper;
	
	@GetMapping("/shop_allList")
	public String shop_List(Model model) {
		log.info("list...");
		
		List<ProductVO> bidList = service.getList();
		for (ProductVO productVO : bidList) {
			int p_no = productVO.getP_no();
			List<AttachFileVO> attachFileList = service.getAttachList(p_no);
			List<String> imageUrls = new ArrayList<String>();
			for(AttachFileVO attachFileVO: attachFileList) {
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
				
				imageUrls.add("/displayImage?fileName=" + fileCallPathEncoded);
			}
			
			productVO.setImageUrls(imageUrls);
		}
		
		model.addAttribute("bidList", bidList);
		return "shop/shop_allList";
	}
	
	@GetMapping("/shop_buypage")
	public String shop_buypage() {
		log.info("shop_buypage...");
		
		return "shop/shop_buypage";
	}
	
	@GetMapping("/shop_paymentPage")
	public String shop_paymentPage() {
		log.info("shop_paymentPage...");
		
		return "shop/shop_paymentPage";
	}
	
	@GetMapping("/shop_Sell_Sizeselect")
	public String shop_sizeselect() {
		log.info("shop_sizeselect...");
		
		return "shop/shop_Sell_Sizeselect";
	}

	@GetMapping("/shop_register")
	public String shop_registerPage() {
		log.info("shop_registerPage...");

		return "shop/shop_register";
	}

	@Transactional
	@PostMapping("/shop_register")
    public String shop_register(ProductVO vo) {
        log.info("shop_register...");
        service.insertProduct(vo);
        int p_no = mapper.getPno();
        
        System.out.println(p_no);
        
		if (vo.getSizeList() != null && vo.getSizeList().size() >0 ) {	// size의길이가 null이 아니고, 0보다 크면
			for (String size : vo.getSizeList()) {	// 
				SizeVO sizevo = new SizeVO();	// 
				sizevo.setPp_size(size);
				sizevo.setP_no(p_no);
				
				sizemapper.addSize(sizevo);
			}
		}

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
        	
        	imageUrls.add("/displayImage?fileName=" + fileCallPathEncoded);
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
        	
        	imageUrls.add("/displayImage?fileName=" + fileCallPathEncoded);
        }
        
        model.addAttribute("imageUrls", imageUrls);
        
        return "shop/shop_buypage";
    }
	
	@GetMapping(value = "/shop_sellpage/{p_no}")
    public String get2(@PathVariable("p_no") int p_no, Model model) {

		ProductVO vo = service.read(p_no);
        model.addAttribute("vo", vo);
        
        BidShopVO vo2 = new BidShopVO();
		model.addAttribute("vo2", vo2);
		System.out.println(vo2.getPp_size());
		System.out.println(vo.getP_no());
        
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
        	
        	imageUrls.add("/displayImage?fileName=" + fileCallPathEncoded);
        }
        
        model.addAttribute("imageUrls", imageUrls);
        return "shop/shop_sellpage";
    }
	
	@GetMapping(value = "/shop_Sell_Sizeselect/{p_no}")
	public String get3(@PathVariable("p_no") int p_no, Model model) {
		
		
		ProductVO vo = service.read(p_no);
		/* BidShopVO vo2 = service.sizeRead(p_no); */
		model.addAttribute("vo", vo);
		
		List<BidShopVO> vo2 = service.sizeRead(vo.getP_no());
		model.addAttribute("vo2", vo2);
		
		System.out.println("ddddddddddddd" + vo2);
		
		List<AttachFileVO> attachFileVOs = service.getAttachList(vo.getP_no());
		List<String> imageUrls = new ArrayList<String>();
		
		System.out.println(vo.getP_no());
		
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
			
			imageUrls.add("/displayImage?fileName=" + fileCallPathEncoded);
		}
		
		model.addAttribute("imageUrls", imageUrls);
		return "shop/shop_Sell_Sizeselect";
	}

	// 이미지 리스트 보여주기
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public ResponseEntity<List<AttachFileVO>> getAttachList(int p_no) {
		log.info("getAttachList...." + p_no); 
		return new ResponseEntity<List<AttachFileVO>>(service.getAttachList(p_no),HttpStatus.OK);
	}
}