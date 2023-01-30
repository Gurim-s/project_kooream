package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandAdminVO;
import com.kooream.domain.ProductVO;

import com.kooream.mapper.BrandProductMapper;
import com.kooream.mapper.BrandProductUploadMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j 
public class BrandProductServiceImpl implements BrandProductService{
  
	@Setter(onMethod_ = @Autowired ) 
	private BrandProductMapper mapper;
			
	@Setter(onMethod_ = @Autowired )
	private BrandProductUploadMapper uploadmapper;
			

		
		  
	@Transactional
	@Override 
	public void register(ProductVO vo) { 
		mapper.insert(vo);
				
		int p_no = mapper.getPno();
				  
		if(vo.getAttachList() != null && vo.getAttachList(). size()>0) {
			for(AttachFileVO vo2 : vo.getAttachList()) { 
				vo2.setP_no(p_no);
				uploadmapper.uploadFile(vo2); 
			}
		}
	}
	
  
	@Override
	public List<ProductVO> getList(ProductVO vo2) {
		List<ProductVO> list = mapper.getList(vo2);
		log.info(vo2 + "서비스임플~");
		log.info(list + "서비스 임플 리스트~");
		
		// 상품테이블 + 상품이미지 합쳐서 불러오기
		for (ProductVO vo : list) {
			List<AttachFileVO> attach = uploadmapper.findByPno(vo.getP_no());	// 
			vo.setAttachList(attach);
		}
		return list;
	}

	@Override
	public List<AttachFileVO> getAttachList(int p_no) {
		return uploadmapper.findByPno(p_no);
	}
	
	@Override
	public ProductVO get(ProductVO vo) {
		//상품 번호를 통해 상품 정보 가져오기
		ProductVO product = mapper.read(vo);
		//상품 번호를 통해 상품의 이미지 가져오기
		product.setAttachList(uploadmapper.findByPno(vo.getP_no()));
		
		return product;
	}
	
	@Override
	public int modify(ProductVO vo) {
		
		return mapper.update(vo);
	}

	@Override
	public int remove(ProductVO vo) {
		
		return mapper.remove(vo);
	}

	@Override		// get에서 
	public BrandAdminVO member(ProductVO vo) {
		
		return mapper.member(vo);
	}

	
	
	
	/*
	 * @Override public List<BrandAdminVO> brandGetList() { List<BrandAdminVO> list2
	 * = adminmapper.brandgetList(); return list2; }
	 * 
	 * 
	 * 
	 * @Override public BrandAdminVO get(BrandAdminVO vo2) { return
	 * mapper.read(vo2); }
	 */
	  
}
	 
