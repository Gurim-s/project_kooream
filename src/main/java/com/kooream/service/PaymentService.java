package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.PaymentVO;

public interface PaymentService {

	// 주문내역 추가
	public int addPayment(PaymentVO vo);	// 장바구니 추가
	
	// 주문내역 리스트 가지고오기
	public List<PaymentVO> paymentList(int m_no);	// 장바구니 리스트 가져오기
	
	// 장바구니 사진 리스트 가지고오기
	//public List<AttachFileVO> CartgetAttachList(int p_no);
	
	// 장바구니 삭제
	//public int Cartdelete(BrandCartVO vo);
	
	//public List<BrandCartVO> brandCartList(int m_no);
		
}





