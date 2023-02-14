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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.MemberVO;
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;
import com.kooream.security.UserSession;
import com.kooream.service.BidShopService;
import com.kooream.service.BiddingService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class BiddingController {
	@Setter(onMethod_ = @Autowired )
	private BiddingService service;
	
	@Setter(onMethod_ = @Autowired )
	private BidShopService service2;
	
	@PostMapping("/shop_buycomplete")
    public String shop_register(BidShopVO vo) {
        log.info("shop_buycomplete...");

        service.insertBuyBid(vo);	// 제품 입력, 사이즈 인서트
        
        System.out.println("구매 입찰 가격 : " + vo.getBid_sell());
		System.out.println("구매 입찰 피엔오 : " + vo.getP_no());
		System.out.println("구매 입찰 사이즈 : " + vo.getPp_size());

        return "redirect:/shop/shop_allList";
    }

	@PostMapping("/shop_bidsellComplete")
    public String shop_bidsell(BidShopVO vo) {
        log.info("shop_sellpage...");
        service.insertBuyBid(vo);
		/* System.out.println(vo.getBid_buy()); */

        return "redirect:/shop/shop_allList";
    }

	@Transactional
	@PostMapping("/now_sell")
    public String shop_nowsell(BidShopVO vo, PaymentVO pvo) {
        log.info("여기는 즉시 판매!!");
		System.out.println("~~mno값 가져오깅 : " + pvo.getM_no());
		System.out.println("~~mno값 가져오깅 : " + pvo.getSell_m_no());
		System.out.println("~~PRICE값 가져오깅 : " + pvo.getPay_price());
		System.out.println("~~Pno값 가져오깅 : " + pvo.getP_no());
        service.trade_complete(pvo);
        service.now_sell(vo);
        System.out.println(vo.getBid_buy());
        System.out.println(vo.getP_no());

        return "redirect:/shop/shop_allList";
    }
	
	//즉시 구매
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@Transactional
	@PostMapping("/now_buy")
	public String shop_nowbuy(BidShopVO vo, PaymentVO pvo) {
		log.info("now_sell..");
		
		System.out.println("~~mno값 가져오깅 : " + pvo.getM_no());
		System.out.println("~~mno값 가져오깅 : " + pvo.getSell_m_no());
		System.out.println("~~PRICE값 가져오깅 : " + pvo.getPay_price());
		System.out.println("~~Pno값 가져오깅 : " + pvo.getP_no());
		service.trade_complete(pvo);
		service.now_buy(vo);
		System.out.println("즉시 구매 가격" + vo.getBid_buy());
		System.out.println("즉시 구매 피엔오" + vo.getP_no());
		
		return "redirect:/shop/shop_allList";
	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/myPage_bid")
	public String myPage_bid(Model model) {
		log.info("입찰 내역 확인창~~");
		MemberVO userSession = new UserSession().getSession();
		if(userSession != null) {
			List<BidShopVO> bvo = service.bid_Read(userSession.getM_no()); // 회원번호 불러오기
			List<PaymentVO> buyvo = service.buyTrade_Read(userSession.getM_no()); // 회원번호 불러오기
			List<PaymentVO> sellvo = service.sellTrade_Read(userSession.getM_no()); // 회원번호 불러오기
			
			for (BidShopVO BidShopVO : bvo) {
				int p_no = BidShopVO.getP_no();
				List<ProductVO> pvo = service.get_Bidinfo(p_no);
				
				BidShopVO.setProductvo(pvo);
				List<AttachFileVO> attachFileList = service2.getAttachList(p_no);
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
				BidShopVO.setImageUrls(imageUrls);
			}
			
			for (PaymentVO PaymentVO : buyvo) {
				int p_no = PaymentVO.getP_no();
				List<ProductVO> pvo = service.get_Bidinfo(p_no);
				
				PaymentVO.setProductvo(pvo);
				List<AttachFileVO> attachFileList = service2.getAttachList(p_no);
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
				PaymentVO.setImageUrls(imageUrls);
			}
			
			for (PaymentVO PaymentVO : sellvo) {
				int p_no = PaymentVO.getP_no();
				List<ProductVO> pvo = service.get_Bidinfo(p_no);
				
				PaymentVO.setProductvo(pvo);
				List<AttachFileVO> attachFileList = service2.getAttachList(p_no);
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
				PaymentVO.setImageUrls(imageUrls);
			}
			model.addAttribute("bvo", bvo);
			model.addAttribute("buyvo", buyvo);
			model.addAttribute("sellvo", sellvo);
		}
		return "/shop/myPage_bid";
	}
	
	@Transactional
	@GetMapping(value = "/bidremove/{bid_no}")	
	public String remove(@PathVariable("bid_no") int bid_no) {
		System.out.println("비드 내역 삭제~~~ : " + bid_no);
		service.bidremove(bid_no);
		return "redirect:/shop/myPage_bid";
	}
}