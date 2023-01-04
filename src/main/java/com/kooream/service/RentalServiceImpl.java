package com.kooream.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kooream.domain.ProductVO;
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
}
