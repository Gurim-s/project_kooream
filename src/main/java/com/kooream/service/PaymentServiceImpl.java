package com.kooream.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.PaymentListVO;
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.mapper.BrandProductMapper;
import com.kooream.mapper.BrandProductUploadMapper;
import com.kooream.mapper.PaymentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
public class PaymentServiceImpl implements PaymentService{
	
	@Setter(onMethod_ = @Autowired )
	private PaymentMapper paymapper;
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductUploadMapper uploadmapper;
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductMapper mapper;

	
	// 주문내역 추가
	@Override
	@Transactional
	public int addPayment(PaymentListVO list) {
		int result = 0;
		//int m_no = list.getM_no();
		for(int i=0; i<list.getPaymentList().size(); i++) {
			//PaymentVO payment = list.getPaymentList().get(i);
			//payment.setM_no(m_no);
			//result += paymapper.addPayment(payment);
			log.error("----" + list.getPaymentList().get(i).getP_no());
			log.error("----" + list.getPaymentList().get(i).getPay_price());
			log.error("----" + list.getPaymentList().get(i).getM_adress());
			
			result += paymapper.addPayment(list.getPaymentList().get(i));
		}
		
		log.error("---- result : " + result);
		log.error("---- size : " + list.getPaymentList().size());
		
		return result;
		
	}

	// 주문리스트 불러오기
	@Override
	public List<PaymentVO> paymentList(int m_no) {
		List<PaymentVO> list = paymapper.paymentList(m_no);
		System.out.println(m_no+"가지고와라!!!");
		//int result = 0;
		for (PaymentVO vo : list) {
				List<AttachFileVO> attach = uploadmapper.findByPno(vo.getP_no());
				//int productList = mapper.getPno();
				vo.setAttachList(attach);
		}
		return list;
		
		
	}

	@Override
	public List<AttachFileVO> paymentgetAttachList(int p_no) {

		return uploadmapper.findByPno(p_no);
	}

	@Override
	public int paymentdelete(PaymentVO vo) {
		
		return paymapper.paymentdelete(vo);
	}
}


	 
		

	

  

	 
