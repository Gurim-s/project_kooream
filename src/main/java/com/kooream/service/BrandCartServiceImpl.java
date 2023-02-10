package com.kooream.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.ProductVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.mapper.BrandProductMapper;
import com.kooream.mapper.BrandProductUploadMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
public class BrandCartServiceImpl implements BrandCartService{
	
	@Setter(onMethod_ = @Autowired )
	private BrandCartMapper cartmapper;
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductUploadMapper uploadmapper;
	
	@Setter(onMethod_ = @Autowired )
	private BrandProductMapper mapper;

	// 장바구니 추가
	@Override
	public int addCart(BrandCartVO vo) {
		//log.warn("serviceImpl " + vo.getP_no());
		return cartmapper.addCart(vo);
		
	}

	// 장바구니 리스트 가지고오기
	@Override
	public List<BrandCartVO> brandCartList(int m_no) {
		List<BrandCartVO> list = cartmapper.brandCartList(m_no);
		
		
		for (BrandCartVO vo : list) {
			List<AttachFileVO> attach = uploadmapper.findByPno(vo.getP_no());
		//	int productList = mapper.getPno();
			vo.setAttachList(attach);
			//vo.setProductList(productList);;
			
		}

		return list;
	}


	@Override
	public List<AttachFileVO> CartgetAttachList(int p_no) {
		
		return uploadmapper.findByPno(p_no);
	}

	

	@Override
	public int Cartdelete(BrandCartVO vo) {
		
		return cartmapper.Cartdelete(vo);
	}



	@Override
	public void CartdeleteAll(int mno) {
		cartmapper.CartdeleteAll(mno);
		
	}


//	@Override
//	public List<BrandCartVO> brandCartList(int m_no) {
		
//	return cartmapper.brandCartList(m_no);
}
	
	

  

	 
