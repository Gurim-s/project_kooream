package com.kooream.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.SizeVO;
import com.kooream.mapper.BidShopMapper;
import com.kooream.mapper.SizeMapper;
import com.kooream.service.BidShopService;
import com.kooream.service.SizeService;

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
	
	@Setter(onMethod_ = @Autowired)
	private SizeService sizeService;
	
	@GetMapping("/shop_allList")
	public String shop_List(Model model) { //Controller에서 리턴값 String은 URL을 의미함 
		log.info("list...");
		List<ProductVO> bidList = service.getList();
//		for (ProductVO productVO : bidList) {
//			int p_no = productVO.getP_no();
//			List<AttachFileVO> attachFileList = service.getAttachList(p_no);
//			List<String> imageUrls = new ArrayList<String>();
//			for(AttachFileVO attachFileVO: attachFileList) {
//				String uploadPath = attachFileVO.getUploadPath();
//				String uuid = attachFileVO.getUuid();
//				String fileName = attachFileVO.getFileName();
//				String fileCallPath = uploadPath + "/" + uuid + "_" + fileName;
//				String fileCallPathEncoded = null;
//				try {
//					fileCallPathEncoded = URLEncoder.encode(fileCallPath, "UTF-8");
//				} catch (UnsupportedEncodingException e) {
//					e.printStackTrace();
//				}
//				
//				imageUrls.add("/displayImage?fileName=" + fileCallPathEncoded);
//			}
//			
//			productVO.setImageUrls(imageUrls);
//		}
		
		model.addAttribute("bidList", bidList);
		System.out.println("+++++++++"+ bidList.size());
		return "shop/shop_allList";
	}
	
	@PostMapping(value="/select_cate",
				consumes = "application/json",		//수신 데이터의 타입
				produces= MediaType.APPLICATION_JSON_UTF8_VALUE) //송신 데이터의 타입
	public ResponseEntity<List<ProductVO>> select_cate(@RequestBody ProductVO category) {
		System.out.println(category.getP_category());
		
		List<ProductVO> cate = service.select_cate(category);
		if (category.getP_category().equals("all")) {
			cate = service.getList();
		}
		for (ProductVO productVO : cate) {
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
		// service를 통해서 데이터를 얻어옴.
		return new ResponseEntity<List<ProductVO>>(cate, HttpStatus.OK);
	}
	@GetMapping("/shop_paymentPage")
	public String shop_paymentPage() {
		log.info("shop_paymentPage...");
		
		return "shop/shop_paymentPage";
	}
	
//	@GetMapping("/shop_Sell_Sizeselect")
//	public String shop_sizeselect() {
//		log.info("shop_sizeselect...");
//		
//		return "shop/shop_Sell_Sizeselect";
//	}
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/shop_register")
	public String shop_registerPage() {
		log.info("shop_registerPage...");

		return "shop/shop_register";
	}

	@Secured({"ROLE_ADMIN"})
	@Transactional
	@PostMapping("/shop_register")
    public String shop_register(ProductVO vo) {
        log.info("shop_register...");
        AttachFileVO main_image = vo.getAttachList().get(0);
        vo.setUuid(main_image.getUuid());
        vo.setFileName(main_image.getFileName());
        vo.setUploadPath(main_image.getUploadPath());
        
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
	
	@GetMapping(value = "/shop_introduce/{p_no}")
    public String get(@PathVariable("p_no") int p_no, Model model) {

        ProductVO vo = service.read(p_no);
        System.out.println("+++++++++++++++++++++");
        System.out.println(vo.getMax_bid_sell());
        System.out.println(vo.getMin_bid_buy());
        System.out.println("부란도~~" + vo.getP_brand());
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
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping(value = "/shop_modify/{p_no}")
	public String modify(@PathVariable("p_no") int p_no, Model model) {
		  		  
		ProductVO vo = service.modiread(p_no);
		model.addAttribute("vo", vo);
		return "shop/shop_modify";
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/shop_modify")	
	public String modify(ProductVO vo) {
		log.info("modify...." + vo );
		service.modify(vo);
		
		return "redirect:/shop/shop_allList";
	}
	
	@Secured({"ROLE_ADMIN"})
	@Transactional
	@GetMapping(value = "/remove/{p_no}")	
	public String remove(@PathVariable("p_no") int p_no) {
		System.out.println("삭제 피엔오~~ : " + p_no);
		service.remove(p_no);
		service.bidremove(p_no);
		sizeService.sizeremove(p_no);
		return "redirect:/shop/shop_allList";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping(value = "/shop_sellbidPage")
    public String get2(BidShopVO bid, Model model) {

		ProductVO vo = service.read(bid.getP_no());
		model.addAttribute("vo", vo);
		
		System.out.println("판매입찰 사이즈" + bid.getPp_size());
		System.out.println(bid.getP_no());
        
		BidShopVO result = service.sizeSelect(bid);
		BidShopVO result2 = service.buysizeSelect(bid);
		model.addAttribute("vo2", result);
		model.addAttribute("vo3", result2);
		System.out.println(result.getPp_size());
		System.out.println(result.getP_no());
		System.out.println("즉시 판매가 : " + result2.getBid_sell());
		
        List<AttachFileVO> attachFileVOs = service.getAttachList(result.getP_no());
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
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping(value = "/shop_buypage")
	public String shop_buypage(BidShopVO bid, Model model) {
		
		ProductVO vo = service.read(bid.getP_no());
		model.addAttribute("vo", vo);
		
		System.out.println(bid.getPp_size());
		System.out.println(bid.getP_no());
		
		BidShopVO result = service.sizeSelect(bid);
		BidShopVO result2 = service.buysizeSelect(bid);
		model.addAttribute("vo2", result);
		model.addAttribute("vo3", result2);
		System.out.println("바이페이지 즉시 구매가 : " + result2.getBid_buy());
		System.out.println("바페 즉판가" + result.getBid_sell());
//		System.out.println(result.getPp_size());
//		System.out.println(result.getP_no());
		
		List<AttachFileVO> attachFileVOs = service.getAttachList(bid.getP_no());
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
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping(value = "/shop_paymentPage")
	public String shop_paymentPage(BidShopVO bid, Model model) {
		
		ProductVO vo = service.read(bid.getP_no());
		model.addAttribute("vo", vo);
		
		System.out.println(bid.getPp_size());
		System.out.println(bid.getP_no());

		BidShopVO result = service.sizeSelect(bid);
		BidShopVO result2 = service.buysizeSelect(bid);
		BidShopVO result3 = service.get_mno(bid);
		model.addAttribute("vo2", result);
		model.addAttribute("vo3", result2);
		model.addAttribute("vo4", result3);
		System.out.println("!!!! - 여긴 즉시 구매 페이지 - !!!!");
		System.out.println("바이페이지 즉시 구매가 : " + result2.getBid_buy());
		System.out.println("mno찾기" + result3.getM_no());
		System.out.println("바페 즉판가" + result.getBid_sell());
//		System.out.println(result.getPp_size());
//		System.out.println(result.getP_no());
		
		List<AttachFileVO> attachFileVOs = service.getAttachList(bid.getP_no());
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
		return "shop/shop_paymentPage";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping(value = "/shop_Nowsellconfirm")
	public String shop_Nowsellconfirm(BidShopVO bid, Model model) {
		
		ProductVO vo = service.read(bid.getP_no());
		model.addAttribute("vo", vo);
		
		System.out.println(bid.getPp_size());
		System.out.println(bid.getP_no());
		
		BidShopVO result = service.sizeSelect(bid);
		BidShopVO result2 = service.buysizeSelect(bid);
		BidShopVO result3 = service.get_mno(bid);
		System.out.println("ㅇㅇ에메노ㅇㅇ" + result3.getM_no());
		model.addAttribute("vo2", result);
		model.addAttribute("vo3", result2);
		model.addAttribute("vo4", result3);
		System.out.println("바이페이지 즉시 구매가 : " + result2.getBid_buy());
		System.out.println("바페 즉판가" + result.getBid_sell());
//		System.out.println(result.getPp_size());
//		System.out.println(result.getP_no());
		
		List<AttachFileVO> attachFileVOs = service.getAttachList(bid.getP_no());
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
		return "shop/shop_Nowsellconfirm";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping(value = "/shop_bid_PaymentPage")
	public String shop_bid_PaymentPage(BidShopVO bid, Model model) {
		
		int vvo = bid.getBid_sell();
		ProductVO vo = service.read(bid.getP_no());
		BidShopVO result = service.sizeSelect(bid);
		BidShopVO result2 = service.buysizeSelect(bid);
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", result);
		model.addAttribute("vo3", result2);
		model.addAttribute("vvo", vvo);
		System.out.println("구매입찰 : " + vvo);
		
		List<AttachFileVO> attachFileVOs = service.getAttachList(bid.getP_no());
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
		return "shop/shop_bid_PaymentPage";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping(value = "/shop_Bidsellconfirm")
	public String shop_Bidsellconfirm(BidShopVO bid, Model model) {
		
		int vvo = bid.getBid_buy();
		ProductVO vo = service.read(bid.getP_no());
		BidShopVO result = service.sizeSelect(bid);
		BidShopVO result2 = service.buysizeSelect(bid);
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", result);
		model.addAttribute("vo3", result2);
		model.addAttribute("vvo", vvo);
		System.out.println("판매입찰 : " + vvo);
		
		List<AttachFileVO> attachFileVOs = service.getAttachList(bid.getP_no());
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
		return "shop/shop_Bidsellconfirm";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping(value = "/shop_Sell_Sizeselect/{p_no}")
	public String get3(@PathVariable("p_no") int p_no, Model model) {
		
		
		ProductVO vo = service.read(p_no);
		/* BidShopVO vo2 = service.sizeRead(p_no); */
		model.addAttribute("vo", vo);
		
		List<BidShopVO> vo2 = service.sizeRead(vo.getP_no());
		model.addAttribute("vo2", vo2);
		
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
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping(value = "/shop_Buy_Sizeselect/{p_no}")
	public String get4(@PathVariable("p_no") int p_no, Model model) {
		
		
		ProductVO vo = service.read(p_no);
		/* BidShopVO vo2 = service.sizeRead(p_no); */
		model.addAttribute("vo", vo);
		
		List<BidShopVO> vo2 = service.buysizeRead(vo.getP_no());
		model.addAttribute("vo2", vo2);
		
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
		return "shop/shop_Buy_Sizeselect";
	}

	// 이미지 리스트 보여주기
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public ResponseEntity<List<AttachFileVO>> getAttachList(int p_no) {
		log.info("getAttachList...." + p_no); 
		return new ResponseEntity<List<AttachFileVO>>(service.getAttachList(p_no),HttpStatus.OK);
	}
}