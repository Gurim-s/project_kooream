package com.kooream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RentalMenuVO;
import com.kooream.mapper.RentalMapper;
import com.kooream.mapper.RntUpldFileMapper;
import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RentalServiceImpl implements RentalService{
	
	@Setter(onMethod_= @Autowired)
	private RentalMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private RntUpldFileMapper fmapper;
	
	// 렌탈 상품 등록
	@Override
	public int addRntPrdt(ProductVO vo) {
		mapper.addRntPrdt(vo);
		int upPno = vo.getP_no();	// p_no 값 불러와서 저장
		String strUuid = vo.getStrUuid();
		
		String[] modNum = strUuid.split("@");
		
		Map<String,Object> mMap = new HashMap<String,Object>();
		mMap.put("p_no", upPno);
		
		for(int i=1; i<modNum.length; i++) {
			mMap.put("uuid", modNum[i]);
			fmapper.updtPno(mMap);
		}
		
		return 1;
	}

	@Override
	public List<ProductVO> getList(RentalMenuVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public List<AttachFileVO> getViewImg(ProductVO vo) {
		return mapper.getViewImg(vo);
	}

	@Override
	public ProductVO viewPrdt(ProductVO vo) {
		return mapper.viewPrdt(vo);
	}

	@Override
	public List<AttachFileVO> getFile(ProductVO vo) {
		return mapper.getFile(vo);
	}

	@Override
	public int updateRntPrdt(ProductVO vo) {
		mapper.updateRntPrdt(vo);
		int upPno = vo.getP_no();	// p_no 값 불러와서 저장
		String strUuid = vo.getStrUuid();
		
		String[] modNum = strUuid.split("@");
		
		Map<String,Object> mMap = new HashMap<String,Object>();
		mMap.put("p_no", upPno);
		
		for(int i=1; i<modNum.length; i++) {
			mMap.put("uuid", modNum[i]);
			fmapper.updtPno(mMap);
		}
		return 1;
	}

	@Override
	public int removeRntPrdt(ProductVO vo) {
		mapper.removeRntPrdt(vo);
		fmapper.removePrdtFile(vo);
		return 1;
	}
}
